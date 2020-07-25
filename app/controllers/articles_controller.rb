class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit 
        
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfuly created"
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was successfuly updated"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        if @article.destroy
            flash[:notice] = "The article is deleted"
            redirect_to articles_path
        else
            render 'destroy'
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end 