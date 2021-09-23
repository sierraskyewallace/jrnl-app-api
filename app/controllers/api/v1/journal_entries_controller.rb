class Api::V1::JournalEntriesController < ApplicationController
   before_action :authenticate

    def index 
        journal_entries = @current_user.journal_entries
        render json: JournalEntrySerializer.new(journal_entries)
    end

    def new 
        current_user = User.find_by(params[:id])
        journal_entry = current_user.journal_entries.build
    end

    def create 
        current_user = User.find_by(params[:id])
        journal_entry = current_user.journal_entries.build(journal_entry_params)
        if journal_entry.save
            render json: JournalEntrySerializer.new(journal_entry), status: :created
        else
            render json: { errors: journal_entry.errors.full_messages }
        end
    end

    def show 
        current_user = User.find_by(params[:id])
        journal_entry = current_user.journal_entries.find(params[:id])
        render json: JournalEntrySerializer.new(journal_entry)
    end


    def destroy 
        current_user = User.find_by(params[:id])
        journal_entry = current_user.journal_entries.find(params[:id])
        journal_entry.destroy
        render json: { message: "Journal entry deleted" }
    end


    private 

    def current_user
        current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    def journal_entry_params
        params.require(:journal_entry).permit(:name, :content, :user_id)
    end
end
