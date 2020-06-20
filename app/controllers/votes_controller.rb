require "json"

# Valid burner addy - t1zcashburnerpollingaddressecksdeexd
# https://api.zcha.in/v2/mainnet/accounts/t1WLeAK9npDSRg7SAM5DMJSeYk45aCvpcdy
class VotesController < ApplicationController

    #These votes will be created by deposits to any taddr associated with a poll.
    # As soon as  a new transaction comes in, it should be burned.
end
