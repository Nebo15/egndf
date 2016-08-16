use Mix.Config

config :egndf, :api_url, "https://gndf.io/api/v1/"

# Set auth config for consumer API

# config :egndf, :auth, [
#   app_id: "57b2c934ce3c0c04f63f9291",
#   consumer_client_id: "1683d514ab502605205b34b0d889c0e6fc10f0de",
#   consumer_client_secret: "4829d3e706e753d3bd1dab9b0e27c4fa81393c92",
# ]

import_config "#{Mix.env}.exs"
