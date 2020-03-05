class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@article.comments.create(params.require(:comment).permit(:body))
		redirect_to @article

	end

end