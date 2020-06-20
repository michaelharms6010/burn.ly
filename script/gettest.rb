require "http"


res = HTTP.get("https://api.zcha.in/v2/mainnet/accounts/t1zcashburnerpollingaddressecksdeexd")
puts JSON.parse(res).to_s