class Person < ActiveRecord::Base

  store_accessor :work_experience, :company, :office, :description

  belongs_to :city

  validates :identification_type, presence: true
  validates :identification,      presence: true, uniqueness: {case_sensitive: false}
  validates :name,                presence: true
  validates :last_name,           presence: true
  validates :city_id,             presence: true

  enum identification_type: [:identification_card, :passport]
  enum gender: [:male, :female]

  def full_name
    ActiveDecorator::Decorator.instance.decorate(self).full_name
  end

end
