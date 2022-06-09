defmodule ElixirAlgo.MongoCLI do

  alias  ElixirAlgo.MongoFile

  def create() do
    a = Prompt.text("Enter the record which you want to insert") |> convert_map

    MongoFile.create_record(a)
  end

  def search_similar_value() do
    a = Prompt.text("Search by value")
    MongoFile.similar_value(String.to_integer(a))
  end

  def delete() do
    a = Prompt.text("delete the key")
    MongoFile.delete_record(a)
  end

  def search_by_key() do
    a = Prompt.text("search by key")
    MongoFile.particular_field(a)
  end

  def convert_map(string, func \\ &Function.identity/1) do
    string
    |> String.split()
    |> Enum.chunk_every(2)
    |> Map.new(fn [key, value] -> {func.(key), String.to_integer(value)} end)
  end
end
