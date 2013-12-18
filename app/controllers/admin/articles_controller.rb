class Admin::ArticlesController < Admin::ApplicationController
  def index

  end

  def new
    @article = Article.new
  end

end
