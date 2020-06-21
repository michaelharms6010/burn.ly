require "json"

class PollsController < ApplicationController
    helper VotesHelper
    def index
        @polls = Poll.all
    end
    def show
        @poll = Poll.find(params[:id])
        @user = User.find(@poll.user_id)
    end

    def new
        @poll = Poll.new
    end

    def create
        @poll = Poll.new(poll_params)
        @poll.user_id = current_user.id
        @poll.options = @poll.options.split(",").map do |option|
            option = option.strip
            option += ":^:" + random_burner_taddr()
        end
        @poll.options = JSON.parse(@poll.options).join(",")
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

    private def random_burner_taddr()
        head = "t1"
        middle = "burnvotertaddrxdlmaoepic"
        tail = [*("A"),*('C'..'H'),*("J".."N"),*("P".."Z"), *("a"),*('c'..'h'),*("j".."n"),*("p".."z"),*('0'),*("2".."9")].shuffle[0,9].join
        
        taddr = (head + middle + tail)
        return taddr if taddr.length == 35
        "Invalid taddr generated"
    end

end
