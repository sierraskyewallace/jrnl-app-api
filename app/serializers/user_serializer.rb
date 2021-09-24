class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password_digest
  #has_many :journal_entries
end
