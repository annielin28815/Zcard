class PostsController < ApplicationController
  before_action :session_required, only: [:create, :edit, :update]
  before_action :set_board, only: [:new, :create]
  before_action :set_post, only: [:show]

  
  def show
    @comment = Comment.new
    # includes(:user) -> 請去找user的資料(這時的user只是符號)
    @comments = @post.comments.includes(:user)
    # select * from posts where id = 7
    # select * from users where id in (3, 5, 8)
  end

  def new
    @post = Post.new  
  end

  def create
    # @post = Post.new(post_params)
    # @post.board = @board
    # @post.user = current_user

    # @post = @board.posts.new(post_params)
    # @post.user = current_user

    @post = current_user.posts.new(post_params)
    @post.board = @board

    if @post.save
      redirect_to @board, notice: '新增文章成功'
    else
      render :new
    end
  end

  def edit
    # 等同下面那行：@post = Post.find_by!(id: params[:id], user: current_user)
    # 錯誤的話會有404頁面
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      render :edit
    end
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end