defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  numbers = Enum.to_list(0..25)
  alphabet = Enum.map(?a..?z, fn(x) -> <<x :: utf8>> end)
  @code Map.new(Enum.zip(alphabet, numbers))

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
   new_number = @code[text] + shift

   @code
    |> Enum.find(fn {key, value} -> value == new_number end)
    |> elem(0)
  end
end

