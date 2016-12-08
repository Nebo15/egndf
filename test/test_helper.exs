Application.put_env(:egndf, :api_url, {:system, "GNDF_API_URL", "https://api.gndf.io/api/v1/"})
Application.put_env(:egndf, :auth, [
  app_id: {:system, "GNDF_APP_ID", "577f5bfae79e85431c4220b3"},
  consumer_client_id: {:system, "GNDF_CONSUMER_CLIENT_ID", "0f2e8def610e31003e1eea75e6635004885ae61f"},
  consumer_client_secret: {:system, "GNDF_CONSUMER_CLIENT_SECRET", "bf3cd2f8975ec2baf6bcc13145dbbb0b78ffa29b"},
])
ExUnit.start()
