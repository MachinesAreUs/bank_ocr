defmodule BankOCR.Checksum do
  def valid_checksum?(account) do
    checksum(account) == 0
  end

  def checksum(account) do
    account
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.zip(9..1)
    |> Enum.map(fn {x, y} -> x * y end)
    |> Enum.sum
    |> rem(11)
  end
end
