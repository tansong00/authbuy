class Admin::CategoriesController < Admin::ApplicationController

  def index
    @parent_categories = Category.where(:parent_id => 0).page params[:page]
  end

  def owns
    @child_categories = Category.where(parent_id: params[:id] )
  end

  def new
    @category = Category.new
  end

  def create
    if params[:id].present?
      @first_category = Category.find(params[:id])
      @category = @parent_category.child_categories.build category_params
      @category.parent_id = @first_category.id
    else
      @category = Category.new category_params
    end
    if @category.save
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes category_params
    if @category.save
      redirect_to admin_categories_path
    else
      render :edit
    end

  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
