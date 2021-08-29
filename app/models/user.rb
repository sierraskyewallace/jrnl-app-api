class User < ApplicationRecord
    has_secure_password
    has_many :journal_entries

    validates :username, presence: true, uniqueness: true
end
