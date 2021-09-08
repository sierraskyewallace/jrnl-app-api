class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content, :user_id, :id
  #belongs_to :user
end
