class SupportTicketsController < ApplicationController

    before_action :find_ticket, only: [:show, :edit, :update, :destroy]

    def index
        @tickets = SupportTicket.order(created_at: :desc)
    end

    def new
        @ticket = SupportTicket.new
    end

    def create
        @ticket = SupportTicket.new ticket_params
        if @ticket.save
            redirect_to support_ticket_path(@ticket)
        else
            render :new
        end
    end

    def edit
    end

    def show
    end

    def update
        if @ticket.update ticket_params_update
            redirect_to support_ticket_path(@ticket)
        else
            render :edit
        end
    end

    def search
        page = params[:page].to_i
        @string = params[:search]
        @all_tickets = SupportTicket.search(@string).count
        @tickets = SupportTicket.search(@string)#.paginate(page)
    end

    def destroy
        @ticket.destroy
        redirect_to support_tickets_path
    end

    private

    def ticket_params
        params.require(:support_ticket).permit(:name, :email, :department, :message)
    end
    def ticket_params_update
        params.require(:support_ticket).permit(:name, :email, :department, :message, :complete)
    end

    def find_ticket
        @ticket = SupportTicket.find params[:id]
    end
end
