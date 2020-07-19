defmodule BankOCR.EvaluatorTest do
  use ExUnit.Case

  @accounts [
    {"123456789", :OK},
    {"000000051", :OK},
    {"912345678", :ERR},
    {"891234567", :ERR},
    {"789123456", :ERR},
    {"678912345", :ERR},
    {"?23456789", :ILL},
    {"9?2345678", :ILL},
    {"89?234567", :ILL},
    {"789?23456", :ILL},
    {"6789?2345", :ILL}
  ]

  Enum.each(@accounts, fn {acc, evaluation} ->
    @acc acc
    @evaluation evaluation
    test "classify account #{@acc}" do
      assert BankOCR.Evaluator.evaluate(@acc) == {@acc, @evaluation}
    end
  end)
end
