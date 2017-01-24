class CategoriesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render new_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
