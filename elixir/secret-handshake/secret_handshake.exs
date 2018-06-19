defmodule SecretHandshake do
  @secret_code %{
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump",
    10000 => "Reverse the order of the operations in the secret handshake"
  }
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())

  @code [1, 10, 100, 1000, 1000]

  def commands(code) do
    binary_converter(code)
    |> Enum.reduce([], fn
      {key, "1"}, acc -> acc ++ [@secret_code[key]]
      {key, _}, acc -> acc
    end)
  end

  def binary_converter(number) do
    list =
      Integer.to_string(number, 2)
      |> String.codepoints()
      |> Enum.reverse()

    Enum.zip(@code, list)
    |> Map.new()
  end
end

# def decoder(key) do
#   # %{1 => one, 10 => ten, 100 => hundred, 1000 => thousand, 10000 => ten_thousand} = @secret_code
#   list_result = binary_converter(6)
#   Enum.map(list_result, fn
#     {key,value} when value == "1" -> @secret_code[key]
#     {key, value} -> ""
#   end)
#   # [one, ten, hundred, thousand, ten_thousand]
# end

# def commands(0), do: []
# def commands(code) do
#   binary_number = binary_converter(code) |> String.to_integer()

#   [@secret_code[binary_number]]
# end

# def binary_converter(number) do
#   Integer.to_string(number, 2)
# end
