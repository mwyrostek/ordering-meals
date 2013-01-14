#encoding: utf-8

class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders


  validates :restaurant_id, :presence => true
  validates :name, :presence => { message: "musisz podać nazwe"}
  validates :price, :numericality => true
  validates :price, :format => { :with => /^\d{1,3}\.?\d{0,2}$/ }

  attr_accessible :name, :price, :restaurant_id
end
