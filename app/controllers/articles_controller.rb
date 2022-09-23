class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end
    
    
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Your article has been successfuly created"
      redirect_to article_path(@article)
    else
        flash[:alert] = @article.errors.full_messages.each {|msg| msg}
        render "new", status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
end
  def edit
    @article = Article.find(params[:id])
end

def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
        flash[:notice] = "Your article has been updated successfully"
        redirect_to @article
    else
        render "new"
    end
end

def destroy
    @article = Article.find(params[:id])
    if @article.destroy
        flash[:notice] = "Your article has been deleted"
        redirect_to articles_path
    end
  end

  
  

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
