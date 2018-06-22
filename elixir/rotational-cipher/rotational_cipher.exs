defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  numbers = Enum.to_list(0..25)
  alphabet = Enum.map(?a..?z, fn x -> <<x::utf8>> end)
  @code Map.new(Enum.zip(alphabet, numbers))

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    array_of_numbers =
      text
      |> String.codepoints()
      |> Enum.map(fn x -> rem(@code[x] + shift, 26) end)

    array_of_numbers
    |> Enum.map(fn x -> converter(x) end)
    |> List.to_string()
  end

  def converter(new_number) do
    @code
    |> Enum.find(fn {letter, number} -> number == new_number end)
    |> elem(0)
  end
end
