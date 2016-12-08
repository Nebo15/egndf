defmodule Egndf.Api.Base do
  @moduledoc """
  Basic module for API requests
  """
  use Confex, otp_app: :egndf
  use HTTPoison.Base

  def send_get(path) do
    path
    |> get_uri
    |> get(get_req_headers!)
    |> normalize_resp
    |> decode_request_body
  end

  def send_post(values, path) when is_map(values) do
    values
    |> encode_request_body
    |> send_post(path)
    |> decode_request_body
  end

  def send_post({:ok, params}, path) do
    path
    |> get_uri
    |> post(params, get_req_headers!)
    |> normalize_resp
  end

  def send_post({:error, reason}, _path) do
    {:error, reason}
  end

  def send_post(_, _) do
    {:error, "param values must be a map and param uri must be a string"}
  end

  defp get_req_headers! do
    case Confex.get_map(:egndf, :auth, []) do
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
        {:error, "cannot encode request"}
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
        {:error, "cannot decode body response: " <> body}
      {:ok, _} = res ->
        res
    end
  end

  defp decode_request_body({:error, reason}) do
    {:error, reason}
  end

  defp normalize_resp(resp) do
    case resp do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp get_uri(path) do
    case Confex.get(:egndf, :api_url, nil) do
      uri when is_binary(uri) ->
        uri <> path
      _ ->
        raise "Undefined config :api_url for :egndf"
    end
  end
end
