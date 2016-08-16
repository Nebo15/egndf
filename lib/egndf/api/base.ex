defmodule Egndf.Api.Base do
  @moduledoc """
    Basic module for API requests
  """
  use HTTPoison.Base

  @endpoint Application.get_env(:egndf, :api_url, nil)


  def get({:ok, params}, uri) do
    normilize_resp get(@endpoint <> uri, get_req_headers!)
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
    normilize_resp post(@endpoint <> uri, params, get_req_headers!)
  end

  def post({:error, reason}, _uri) do
    {:error, reason}
  end

  def post(_, _) do
    {:error, "param values must be a map and param uri must be a string"}
  end

  defp get_req_headers! do
    case Application.get_env(:egndf, :auth, []) do
      [app_id: app_id, consumer_client_id: user, consumer_client_secret: pwd] ->
        [{"Content-Type", "application/json"},
         {"X-Application", app_id},
         {"Authorization", "Basic " <> Base.encode64(user <> ":" <> pwd)}
         ]
       _ -> raise "Undefined config :auth for :egndf"
    end
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
