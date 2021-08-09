class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content, :user_id 
end
