require "json"

class PollsController < ApplicationController
    def show
        @poll = Poll.find(params[:id])
    end

    def new
        @poll = Poll.new
    end

    def create
        @poll = Poll.new(poll_params)
        # get taddr here?
        if(@poll.save)
            redirect_to @poll
        else
            render "new"
        end
    end

    def destroy
        @poll = Poll.find(params[:id])
        @poll.destroy

        redirect_to polls_path
    end

    private def poll_params
        params.require(:poll).permit(:question, :options, :taddr)
    end
end
