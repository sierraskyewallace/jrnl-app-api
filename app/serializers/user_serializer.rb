class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username 
  #has_many :journal_entries
end
