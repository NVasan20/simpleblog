class ArticlesController < ApplicationController
	before_action :set_article, except: %i[index recent create]

	def index 
		@articles = Article.all
	end 

	def show; end

	def recent
		@articles = Article.all.limit(10).order(created_at: :desc)
		render :index
	end

	def new
		@article = Article.new
	end

	def create 
		@article = Article.create(article_params)
		redirect_to @article
	end 

	def edit; end

	def update
	    @article.update(article_params)
		redirect_to @article
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end 

	def set_article
		@article = Article.find(params[:id])
	end
end