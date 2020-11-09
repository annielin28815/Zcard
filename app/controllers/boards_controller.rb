class BoardsController < ApplicationController
  def index
  end

  def new
    # 全新的board(做完request就停了)
    @board = Board.new
  end

  def create
    # params["board"] -> {"title" => 'ccc'} (15:26)
    # new -> initialize
    # 塞一個新的陣列進去一個新的變數。(15:50)
    
    clean_params = params.require(:board).permit(:title)
    # 有塞料的board，做這裡時new裡的@board已經死掉了。
    # 當create裡的@board，跟new裡的@board不一樣時，若除村失敗，則頁面導引會有問題。
    @board = Board.new(clean_params)

    if @board.save
      redirect_to "/",notice: '成功新增看板'
    else
      # 借new那個檔案的template來用，原地渲染。
      render :new,notice: '請重新編輯看板名稱，字數需超過四個字'
    end
  end
end
