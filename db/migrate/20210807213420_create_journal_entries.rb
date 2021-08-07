class CreateJournalEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :journal_entries do |t|
      t.string :name 
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
