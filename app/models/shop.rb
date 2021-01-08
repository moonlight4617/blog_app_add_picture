class Shop < ApplicationRecord
  belongs_to :owner
  has_one :reservation  
end
