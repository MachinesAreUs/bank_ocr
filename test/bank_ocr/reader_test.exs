defmodule BankOCR.ReaderTest do
  use ExUnit.Case
  alias BankOCR.Reader

  test "read file with 1 account" do
    assert Reader.from_file("./data/account.txt") == ["123456789"]
  end

  test "read file with 5 valid accounts" do
    assert Reader.from_file("./data/accounts.txt") == [
             "123456789",
             "912345678",
             "891234567",
             "789123456",
             "678912345"
           ]
  end

  test "read file with 5 illegible accounts" do
    assert Reader.from_file("./data/accounts_illegible.txt") == [
             "?23456789",
             "9?2345678",
             "89?234567",
             "789?23456",
             "6789?2345"
           ]
  end
end
