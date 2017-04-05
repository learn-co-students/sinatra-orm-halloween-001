class Candy < ActiveRecord::Base

  belongs_to :house
  belongs_to :bucket
  has_one :kid, through: :bucket
end