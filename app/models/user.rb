class User < ApplicationRecord
    has_many :journal_entries
end
