class Business < ApplicationRecord
  belongs_to :business_type
  has_one_attached :avatar

  acts_as_taggable_on :languages, :tags

  validates :name, :email, :location, :website, :instagram, :opens_at, :closes_at, :business_type_id, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :website, :instagram, url: { no_local: true }
  validates :telephone, :presence => true,
                        :numericality => true,
                        :length => { :minimum => 10, :maximum => 15 }
end
