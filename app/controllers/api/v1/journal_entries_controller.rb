class Api::V1::JournalEntriesController < ApplicationController
    before_action :authenticate_user!

    def index 
        current_user = User.find_by_id(params[:user_id])
        journal_entries = current_user.journal_entries
        render json: JournalEntrySerializer.new(journal_entries)
    end

    def new 
        journal_entry = current_user.journal_entries.build
        render json: JournalEntrySerializer.new(journal_entry)
    end

    def create 
        journal_entry = current_user.journal_entries.build(journal_entry_params)
        if journal_entry.save
            render json: JournalEntrySerializer.new(journal_entry), status: :created
        else
            render json: { errors: journal_entry.errors.full_messages }
        end
    end

    def show 
        journal_entry = current_user.journal_entries.find(params[:id])
        render json: JournalEntrySerializer.new(journal_entry)
    end


    def destroy 
        journal_entry = current_user.journal_entries.find(params[:id])
        journal_entry.destroy
        render json: { message: "Journal entry deleted" }
    end


    private 


    def journal_entry_params
        params.require(:journal_entry).permit(:name, :content, :user_id)
    end
end
