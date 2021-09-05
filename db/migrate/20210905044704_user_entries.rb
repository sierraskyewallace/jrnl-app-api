class UserEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :user_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :journal_entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end

