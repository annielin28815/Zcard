class Cart
  def initialize
    @items = []
  end

  def add_item(item_id, quentity = 1)
    found_item = @items.find { |item| item.item_id == item_id }

    # 如果找到就增加數量，如果沒有就增加新的
    if found_item
      found_item.increment(quentity)
    else
      @items << CartItem.new(item_id, quentity)
    end
    @items << item_id
  end

  # 自定義的empty方法
  def empty?
    # 陣列的empty方法
    @items.empty?
  end

  def items
    @items
  end
end