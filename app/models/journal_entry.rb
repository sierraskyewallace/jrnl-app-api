class JournalEntry < ApplicationRecord
    belongs_to :user_entry
    #validates :description, presence: true
end
