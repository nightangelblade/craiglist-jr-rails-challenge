class ArticlesController < ApplicationController
  before_filter :authorize, except: :show

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to category_article_path(@article)
    else
      render edit_category_article_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to category_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :price, :email, :category_id)
  end

end
