defmodule Scripbox.MongoFile do
  require Logger

  def create_record(key) do
    File.write("../hello", Poison.encode!(key), [:binary])
    Logger.debug("you have created a json file")
  end

  def delete_record(key) do
    a = File.read!("../hello")
    |> Poison.decode!()
    |> Map.delete(key)

    File.write("../hello", Poison.encode!(a), [:binary])
  end

  def similar_value(value) do
    result = File.read!("../hello")
    |> Poison.decode!()
    |> Map.filter(fn {_key, val} -> val == value end)
    |> Poison.encode!()
    Logger.debug("Filter by Values: #{result}")
  end

  # def particular_field(_f) do
  #   result = File.read!("../hello")
  #   |> Poison.decode!()

  #   Logger.debug("Filter by particular field: #{result}")
  # end

  def particular_field(field) do
   result = File.read!("../hello")
    |> Poison.decode!()
    |> Map.filter(fn {key, _val} -> key == field end)
    |> Poison.encode!()

    Logger.debug("Filter by particular field: #{result}")
  end
end
