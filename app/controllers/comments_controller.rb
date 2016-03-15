class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(comment_params[:article_id])
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(comment_params[:comment_id])
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def comment_params
      params.permit(:author, :content, :article_id, :comment_id,:parent_id)
    end
end

