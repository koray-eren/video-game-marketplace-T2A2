class Order < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :listing_id, uniqueness:  true
end