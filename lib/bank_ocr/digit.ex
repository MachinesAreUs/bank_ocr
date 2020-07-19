defmodule BankOCR.Digit do
  @one "   " <>
       "  |" <>
       "  |"

  @two " _ " <>
       " _|" <>
       "|_ "

  @three " _ " <>
         " _|" <>
         " _|"

  @four "   " <>
        "|_|" <>
        "  |"

  @five " _ " <>
        "|_ " <>
        " _|"

  @six " _ " <>
       "|_ " <>
       "|_|"

  @seven " _ " <>
         "  |" <>
         "  |"

  @eight " _ " <>
         "|_|" <>
         "|_|"

  @nine " _ " <>
        "|_|" <>
        " _|"

  @digits %{
    @one => "1",
    @two => "2",
    @three => "3",
    @four => "4",
    @five => "5",
    @six => "6",
    @seven => "7",
    @eight => "8",
    @nine => "9"
  }

  def from_str(str) do
    Map.get(@digits, str, "?")
  end
end
