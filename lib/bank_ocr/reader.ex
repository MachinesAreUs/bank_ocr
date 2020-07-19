defmodule BankOCR.Reader do
  def from_file(file_path) do
    file_path
    |> File.stream!()
    |> Stream.chunk_every(4)
    |> Stream.map(&Stream.take(&1, 3))
    |> Stream.map(&BankOCR.Parser.parse/1)
    |> Enum.to_list()
  end
end
