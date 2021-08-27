class User < ApplicationRecord
    has_many :journal_entries

    validates :username, presence: true, uniqueness: true
end
