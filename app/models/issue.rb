class Issue < ApplicationRecord
    validates :number, presence: true
    
    has_many :events
end
