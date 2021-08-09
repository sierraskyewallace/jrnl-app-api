class Api::V1::JournalEntriesController < ApplicationController

    def index 
        journal_entries = JournalEntry.all
        render json: journal_entries
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
