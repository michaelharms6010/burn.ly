class WelcomeController < ApplicationController
    def show
        `zecwallet-cli.exe list`
    end
end