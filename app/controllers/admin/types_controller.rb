class Admin::TypesController < Admin::ApplicationController

  def index
    @types =  Type.all.page(params[:page])
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new type_params
    if @type.save
      redirect_to admin_types_path
    else
      render :new
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to admin_types_path
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

end
