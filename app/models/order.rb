class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  attr_accessible :item_id, :user_id

  validates :item_id, :presence => true
  validates :user_id, :presence => true


  # scope :today_orders, where("created_at > ?", Date.today.beginning_of_day)

  def self.with_date(date)
    date = Date.today unless date
    where("created_at > ? AND created_at < ?", date.to_date.beginning_of_day, date.to_date.end_of_day)
  end

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
