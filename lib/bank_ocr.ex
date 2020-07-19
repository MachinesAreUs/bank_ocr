defmodule BankOCR do
  def process(file_path) do
    file_path
    |> BankOCR.Reader.from_file()
    |> Enum.map(&BankOCR.Evaluator.evaluate/1)
    |> print()
  end

  def print(items) do
    Enum.each(items, fn {account, status} ->
      IO.puts("#{account} #{status}")
    end)
  end
end
