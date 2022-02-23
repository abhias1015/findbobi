class Business < ApplicationRecord
  COMMUNITIES = [ "Black-owned", "Female-owned", "Female-friendy", "LGBTQ+ friendly",
                  "LGBTQ+ owned", "Environmentally-friendly", "Sustainable business",
                  "Green company", "Local business", "Berlin-based", "Hamburg-based",
                  "Community-owned", "Migrant-Founder", "Migrant-Background", "Inclusive",
                  "Diverse", "Immigrant-friendly", "Internationals-friendly",
                  "Foreigners-friendly", "Asian-owned", "Arab-owned", "African-owned",
                  "Turkish-owned", "Indian-owned", "Latin-owned", "Employee-friendly",
                  "Sex-worker friendly"]

  belongs_to :business_type
  has_one_attached :avatar

  acts_as_taggable_on :languages, :tags

  validates :name, :email, :location, :website, :instagram, :opens_at, :closes_at, :business_type_id, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :website, :instagram, url: { no_local: true }
  validates :telephone, :presence => true,
                        :numericality => true,
                        :length => { :minimum => 10, :maximum => 15 }


  def tags_and_language_names
    tags&.map(&:name) + languages.map(&:name)
  end

  def self.list_records(what, where, tags, languages)
    what = BusinessType.where(name: what)
    tags = tags.split(", ")
    where = where.split(", ")
    tagged_objects = tagged_with((where + tags), :any => true)

    tagged_objects.where(business_type: what)
  end
end
