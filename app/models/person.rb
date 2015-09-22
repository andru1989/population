class Person < ActiveRecord::Base
  belongs_to :city

  validates :identification_type, presence: true
  validates :identification,      presence: true
  validates :name,                presence: true
  validates :last_name,           presence: true
  validates :city_id,             presence: true

  enum identification_type: [:identification_card, :passport]
  enum gender: [:male, :female]

  def full_name
    [name, last_name].join(' ')
  end
end
