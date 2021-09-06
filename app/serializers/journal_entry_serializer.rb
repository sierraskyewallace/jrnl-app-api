class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content
  #belongs_to :user
end
