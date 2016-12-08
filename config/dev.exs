use Mix.Config
config :egndf,
  api_url: {:system, "GNDF_API_URL", "http://gandalf.dev/api/v1/"},
  auth: [
    app_id: {:system, "GNDF_APP_ID", "57b2c934ce3c0c04f63f9291"},
    consumer_client_id: {:system, "GNDF_CONSUMER_CLIENT_ID", "1683d514ab502605205b34b0d889c0e6fc10f0de"},
    consumer_client_secret: {:system, "GNDF_CONSUMER_CLIENT_SECRET", "4829d3e706e753d3bd1dab9b0e27c4fa81393c92"},
  ]
