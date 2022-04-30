class BusinessGroup < ApplicationRecord
  has_many :business_type
  
  validates :name, presence: true
end
