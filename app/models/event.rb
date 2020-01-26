class Event < ApplicationRecord
    validates :action, presence: true
    
    belongs_to :issue
end
