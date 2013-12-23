class ProductsController < ApplicationController

  def index
    @products = Product.all.order('created_at DESC').page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def list
    @products = Product.where(:category_id => params[:id]).page(params[:page])
  end

end
