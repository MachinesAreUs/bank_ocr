defmodule Util.Matrix do
  def transpose([]), do: []
  def transpose([[] | _]), do: []
  def transpose(a) do
    [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
  end
end
