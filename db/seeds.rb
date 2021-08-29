# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skye = User.create(username: "testuser1", password: "password")
mason = User.create(username: "testuser2", password: "password")
mike = User.create(username: "testuser3", password: "password")

entry1 = JournalEntry.create(user_id: skye.id, name: "Test Entry 1", content: "This is a test entry.")
entry2 = JournalEntry.create(user_id: skye.id, name: "Test Entry 2", content: "This is a test entry.")
entry3 = JournalEntry.create(user_id: mason.id, name: "Test Entry 3", content: "This is a test entry.")
entry4 = JournalEntry.create(user_id: mike.id, name: "Test Entry 4", content: "This is a test entry.")
entry5 = JournalEntry.create(user_id: mike.id, name: "Test Entry 5", content: "This is a test entry.")