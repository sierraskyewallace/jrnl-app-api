class Api::V1::JournalEntriesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]

    def index 
        current_user = User.find_by_id(params[:id])
        journal_entries = current_user.journal_entries.all
        #options = {
         #   include: [:user]
        #}
        render json: JournalEntrySerializer.new(journal_entries)
    end

    def create 
        journal_entry = JournalEntry.new(journal_entry_params)
        if journal_entry.save
            render json: journal_entry, status: :created
        else
            render json: { errors: journal_entry.errors.full_messages }
        end
    end

    private 

    def journal_entry_params
        params.require(:journal_entry).permit(:name, :content, :user_id)
    end
end
