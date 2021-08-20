class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content, :user_id 
  #belongs_to :user
end
