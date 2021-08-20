class Api::V1::JournalEntriesController < ApplicationController

    def index 
        journal_entries = JournalEntry.all
        options = {
            include: [:user]
        }
        render json: JournalEntrySerializer.new(journal_entries, options)
    end

    def create 
        journal_entry = JournalEntry.new(journal_entry_params)
        if journal_entry.save
            render json: journal_entry, status: :created
        else
            render json: { errors: journal_entry.errors.full_messages }
        end
    end
end
