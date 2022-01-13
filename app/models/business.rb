class Business < ApplicationRecord
  validates :name, :email, :is_owner, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id, presence: true

  belongs_to :business_type
  has_one_attached :avatar

  acts_as_taggable_on :languages, :tags
end
