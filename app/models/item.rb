class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders

  attr_accessible :name, :price, :restaurant_id
end
