defmodule BankOCR.MatrixTest do
  use ExUnit.Case
  alias BankOCR.Matrix

  test "transposes 3x3 matrix" do
    orig = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]

    expected = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]

    assert Matrix.transpose(orig) == expected
  end

  test "transposes 5x5 matrix" do
    orig = [
      [1, 0, 0, 0, 0],
      [1, 1, 0, 0, 0],
      [1, 1, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1]
    ]

    expected = [
      [1, 1, 1, 1, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 1, 1, 1],
      [0, 0, 0, 1, 1],
      [0, 0, 0, 0, 1]
    ]

    assert Matrix.transpose(orig) == expected
  end
end

