class CommentsController < ApplicationController
  before_action :session_required
  before_action :find_post, only: [:create]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      # redirect_to @post
    else
      render 'posts/show'
    end
  end

  # 11/30(12:35)
  def destroy
    # 從使用者角度撈資料
    comment = current_user.comments.find(params[:id])
    # 從資料庫角度撈資料
    # select * from comments where id = ? and user_id = 3
    # comment = Comment.find(params[:id])

    comment.destroy
    redirect_to comment.post, notice: '留言已刪除'
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end