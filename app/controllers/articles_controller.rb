class ArticlesController < ApplicationController
	def index 
		@articles = Article.all
	end 

	def show
		id = params[:id]
		@article = Article.find(id)
	end

	def recent
		@articles = Article.all.limit(10).order(created_at: :desc)
		render :index
	end

	def new
		@article = Article.new
	end

	def create 
		@article = Article.create(params.require(:article).permit(:title, :body))
	end 
end
