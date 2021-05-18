class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save!
      redirect_to article_path(@article), notice: 'Article created'
    else
      redirect_to new_article_path, notice: @article.errors.full_messages.join
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article), notice: 'Article updated!'
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article deleted!'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
