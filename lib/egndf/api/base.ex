defmodule Egndf.Api.Base do
  use HTTPoison.Base

  # ToDo: set via config
  @endpoint "http://gandalf.dev/api/v1/"
  @app_id "57b239a84e5014160766fd61"
  @user "ff57421aca178aed413ab1be60e5528e012c144e"
  @pwd "b12fabf80ecbd5272db756f770350aabe2df52fb"

  def get({:ok, params}, uri) do
    normilize_resp get(@endpoint <> uri, get_req_headers)
  end

  def get({:error, reason}, _uri) do
    {:error, reason}
  end

  def post(values, uri) when is_map(values) do
    values
    |> encode_request_body
    |> post(uri)
    |> decode_request_body
  end

  def post({:ok, params}, uri) do
    normilize_resp post(@endpoint <> uri, params, get_req_headers)
  end

  def post({:error, reason}, _uri) do
    {:error, reason}
  end

  def post(_, _) do
    {:error, "param values must be a map and param uri must be a string"}
  end

  defp get_req_headers do
    [{"Content-Type", "application/json"},
     {"X-Application", @app_id},
     {"Authorization", "Basic " <> Base.encode64(@user <> ":" <> @pwd)}]
  end

  defp encode_request_body(params) when is_map(params) do
    case Poison.encode(params) do
      {:error, _} ->
        {:error, "can not encode request"}
      {:ok, _} = res ->
        res
    end
  end

  defp encode_request_body({:error, reason}) do
    {:error, reason}
  end

  defp encode_request_body(_) do
    {:error, "params must be a map"}
  end

  defp decode_request_body({:ok, body}) do
    case Poison.decode(body) do
      {:error, _} ->
        {:error, "can not decode body response"}
      {:ok, _} = res ->
        res
    end
  end

  defp decode_request_body({:error, reason}) do
    {:error, reason}
  end

  defp normilize_resp(resp) do
    case resp do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
