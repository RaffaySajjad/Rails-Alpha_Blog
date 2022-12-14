# frozen_string_literal: true

# Articles Controller
class ArticlesController < ActionController::Base
  before_action :find_article, only: %i[update show edit destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
