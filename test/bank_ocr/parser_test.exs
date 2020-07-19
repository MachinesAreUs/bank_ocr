defmodule BankOCR.ParserTest do
  use ExUnit.Case
  alias BankOCR.Parser

  @basic_input [
    "    _  _     _  _  _  _  _ ",
    "  | _| _||_||_ |_   ||_||_|",
    "  ||_  _|  | _||_|  ||_| _|"
  ]

  @twisted_input [
    "    _  _     _  _  _  _  _ ",
    " _| _| _|| ||_ |     |_|| |",
    "  ||_   |  | _||_|  ||_| _|"
  ]

  @digits 1..9

  Enum.each(@digits, fn digit ->
    @digit digit
    test "reads nth digit: #{@digit}" do
      assert Parser.nth_digit(@basic_input, @digit) == Integer.to_string(@digit)
    end
  end)

  @illegible_digits [1, 3, 4, 6, 7, 9]

  Enum.each(@illegible_digits, fn digit ->
    @digit digit
    test "wrong nth digit #{@digit} is returnes as '?'" do
      assert Parser.nth_digit(@twisted_input, @digit) == "?"
    end
  end)

  test "reads complete account number" do
    assert Parser.parse(@basic_input) == "123456789"
  end

  test "reads illegible account number" do
    assert Parser.parse(@twisted_input) == "?2??5??8?"
  end
end
