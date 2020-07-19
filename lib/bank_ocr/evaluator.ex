defmodule BankOCR.Evaluator do
  def evaluate(account) do
    if illegible_digits?(account) do
      {account, :ILL}
    else
      if valid_checksum?(account) do
        {account, :OK}
      else
        {account, :ERR}
      end
    end
  end

  defp illegible_digits?(account), do: String.contains?(account, "?")

  defp valid_checksum?(account), do: BankOCR.Checksum.valid_checksum?(account)
end
