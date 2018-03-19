class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "hola", password: "ciao",
  except: [:index, :show]

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  def create
    # => render plain: params[:article].inspect
    #@article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
      #redirect_to (new_article_path)
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def show2
    @article = Article.find(params[:id])
    render 'admin'
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
