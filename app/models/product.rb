class Product < ActiveRecord::Base
  belongs_to :category

  validates_uniqueness_of :name, message: 'already exists'

end