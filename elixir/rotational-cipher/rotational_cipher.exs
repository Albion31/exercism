defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  numbers_list_2 = Enum.to_list(0..51)
  numbers_list_lowercase = Enum.to_list(0..25)
  numbers_list_uppercase = Enum.to_list(26..51)
  alphabet_list_lowercase = Enum.map(?a..?z, fn x -> <<x::utf8>> end)
  alphabet_list_uppercase = Enum.map(?A..?Z, fn x -> <<x::utf8>> end)
  both_alphabet = Enum.concat(alphabet_list_lowercase, alphabet_list_uppercase)
  @code_map_lowercase Map.new(Enum.zip(alphabet_list_lowercase, numbers_list_lowercase))
  @code_map_uppercase Map.new(Enum.zip(alphabet_list_uppercase, numbers_list_uppercase)) |> IO.inspect
  @code_all Map.new(Enum.zip(both_alphabet, numbers_list_2))

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  # def rotate(text,26), do: text
  def rotate(text, shift) do
    text
    |> String.codepoints()
    |> Enum.map(fn x -> rem(@code_all[x] + (shift+52), 52) end)
    |> Enum.map(fn x -> converter(x) end)
    |> List.to_string()
  end

  # def check_capitalisation(letter) do
  #   if letter =~ ~r/^\p{Lu}$/u do
  #     IO.puts("UPPER")
  #     @code_map_uppercase[letter] |> IO.inspect()
  #   else
  #     IO.puts("LOWER")
  #     @code_map_lowercase[letter] |> IO.inspect
  #   end
  # end

  def converter(new_number) do
    @code_all
    |> Enum.find(fn {_, number} -> number == new_number end)
    |> elem(0)
  end
end
