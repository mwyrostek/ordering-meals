class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  attr_accessible :item_id, :user_id

  validates :item_id, :presence => true
  validates :user_id, :presence => true

  def item_name
    self.item.name
  end

  def item_price
    self.item.price
  end

  def restaurant_name
    self.item.restaurant.name
  end  

end
