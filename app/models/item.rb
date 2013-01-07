class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders


  validates :restaurant_id, :presence => true
  validates :name, :presence => true
  validates :price, :format => { :with => /^\d{1,3}\.?\d{0,2}$/}

  attr_accessible :name, :price, :restaurant_id
end
