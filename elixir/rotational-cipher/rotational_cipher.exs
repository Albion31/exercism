defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  numbers_list = Enum.to_list(0..25)
  alphabet_list = Enum.map(?a..?z, fn x -> <<x::utf8>> end)
  @code_map Map.new(Enum.zip(alphabet_list, numbers_list))

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
      text
      |> String.codepoints()
      |> Enum.map(fn x -> rem(@code_map[x] + shift, 26) end)
      |> Enum.map(fn x -> converter(x) end)
      |> List.to_string()
  end

  def converter(new_number) do
    @code_map
    |> Enum.find(fn {_, number} -> number == new_number end)
    |> elem(0)
  end
end
