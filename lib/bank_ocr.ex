defmodule BankOCR do
  def process(file_path) do
    file_path
    |> BankOCR.Reader.from_file()
    |> Enum.map(&BankOCR.Evaluator.evaluate/1)
    |> Enum.each(&print/1)
  end

  def print({account, evaluation}) do
    IO.puts("#{account} #{evaluation}")
  end
end
