class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = Article.all.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes article_params
    if @article.save
      redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def article_params
    params.require(:article).permit(:title, :type_id, :key_word, :author, :origin, :content, :photo)
  end

end
