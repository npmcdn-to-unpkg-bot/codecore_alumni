class Category < ActiveRecord::Base
    has_many :skills, dependent: :nullify
    
    validates :name, presence: true, uniqueness: true

    # Include model in search
    include PgSearch
    multisearchable against: :name
end
