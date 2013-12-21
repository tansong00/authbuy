class ArticlesController < ApplicationController

  def index
    @types = Type.all
  end

  def about_us

  end

  def contact_us

  end

  def partner

  end

  def show
    @article = Article.find(params[:id])
    @pre_article = Article.where(["id < ? and type_id = ?",@article.id,@article.type_id]).last
    @ne_article = Article.where(["id > ? and type_id = ?", @article.id,@article.type_id]).first
  end

  def list
    @articles = Article.where(["type_id = ?",params[:id]])
  end

end
