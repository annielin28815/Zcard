class BoardsController < ApplicationController
  before_action :find_board, only: [:show, :edit, :update, :destroy, :hide, :open, :lock]

  include SessionsHelper

  def index
    @boards = Board.all
  end

  def show
    # 11/23(15:53)
    # @posts = Post.where(board: @board)
    # @posts = Post.where(board_id: @board.id)
    @posts = @board.posts.order(id: :desc)
  end

  def new
    # 全新的board(做完request就停了)
    @board = Board.new
  end

  def create

    # 有塞料的board，做這裡時new裡的@board已經死掉了。
    # 當create裡的@board，跟new裡的@board不一樣時，若除村失敗，則頁面導引會有問題。
    @board = Board.new(board_params)

    if @board.save
      redirect_to "/",notice: '成功新增看板'
    else
      # 借new那個檔案的template來用，原地渲染。
      render :new,notice: '請重新編輯看板名稱，字數需超過四個字'
    end
  end

  def edit
  end


  def update
    if @board.update(board_params)
      redirect_to root_path, notice: '更新成功'
    else
      render :edit
    end
  end


  def destroy
    @board.destroy
    redirect_to root_path, notice: '看板已刪除'
  end

  def hide
    authorize @board, :hide?
    @board.hide! if @board.may_hide?
    redirect_to boards_path, notice: '看板己隱藏'
  end

  def open
    @board.open! if @board.may_open?
    redirect_to boards_path, notice: '看板己開放'
  end

  def lock
    @board.lock! if @board.may_lock?
    redirect_to boards_path, notice: '看板己鎖定'
  end

  private
  def find_board
    @board = Board.find(params[:id])
    # Board.find_by(id: 1)
    # Board.find_by!(id: 1)
  end

  def board_params
    # params["board"] -> {"title" => 'ccc'} (15:26)
    # new -> initialize
    # 塞一個新的陣列進去一個新的變數。(15:50)
    
    
    params.require(:board).permit(:title)
  end


end
