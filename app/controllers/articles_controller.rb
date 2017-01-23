class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @category = @article.category.id
  end

  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
  end

  def edit

  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)

    if @article.save
      redirect_to category_path(@category)
    else
      render new_category_article_path
    end

  end

  def update

  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :price, :email, :category_id)
  end

end
