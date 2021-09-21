class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password
  #has_many :journal_entries
end
