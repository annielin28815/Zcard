class CartItem
  attr_reader :product_id, :quantity

  def initialize(item_id, quatity = 1)
    @item_id = item_id
    @quentity = quentity
  end

  def initialize(n = 1)
    @quentity = @quentity + n
  end
end