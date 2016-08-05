class Skill < ActiveRecord::Base
  belongs_to :category
  belongs_to :profile
#  has_many :skillsets, dependent: :nullify
#  has_many :profiles, through: :skillsets

  validates :name, presence: true
  validates :proficiency, presence: true, numericality: { greater_than_or_equal_to: 0,
                                                          less_than_or_equal_to: 10 }

  # Include mode in search
  include PgSearch
  multisearchable against: [:name, :proficiency]
  
end
