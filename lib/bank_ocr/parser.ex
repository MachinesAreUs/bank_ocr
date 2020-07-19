defmodule BankOCR.Parser do
  @moduledoc """
  Parses all the digits in a set of lines. Optioonally it parses
  only the nth digit from a set of lines.
  """

  def parse(lines) do
    1..9
    |> Enum.map(&nth_digit(lines, &1))
    |> Enum.join()
  end

  def nth_digit(lines, n) do
    lines
    |> nth_digit_str(n)
    |> BankOCR.Digit.from_str()
  end

  def nth_digit_str(lines, n) do
    lines
    |> Enum.map(&String.to_charlist/1)
    |> Enum.zip()
    |> Enum.drop((n - 1) * 3)
    |> Enum.take(3)
    |> Enum.map(&Tuple.to_list(&1))
    |> Util.Matrix.transpose()
    |> Enum.join()
  end
end
