defmodule BankOCR.ChecksumTest do
  use ExUnit.Case
  alias BankOCR.Checksum

  @correct_checksum_accounts [
    "123456789",
    "000000000",
    "457508000",
    "345882865",
    "000000051"
  ]

  Enum.each(@correct_checksum_accounts, fn acc ->
    @acc acc
    test "identifies correct checksum for #{@acc}" do
      assert Checksum.valid_checksum?(@acc)
    end
  end)

  @wrong_checksum_accounts [
    "111111111",
    "222222222",
    "333333333",
    "444444444",
    "555555555",
    "666666666",
    "777777777",
    "888888888",
    "999999999"
  ]

  Enum.each(@wrong_checksum_accounts, fn acc ->
    @acc acc
    test "identifies wrong checksum for #{@acc}" do
      refute Checksum.valid_checksum?(@acc)
    end
  end)
end
