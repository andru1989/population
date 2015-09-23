class City < ActiveRecord::Base
  belongs_to :region

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def city_region
    [name, region.name].join(' - ')
  end
end
