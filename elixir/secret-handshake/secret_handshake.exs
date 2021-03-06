defmodule SecretHandshake do
  @secret_code %{
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump",
    10000 => "Reverse the order of the operations in the secret handshake"
  }

  @key_code [1, 10, 100, 1000, 10000]

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
  def commands(code) do
    binary_converter(code)
    |> Enum.reduce([], fn
      {10000, "1"}, acc -> Enum.reverse(acc)
      {key, "1"}, acc -> acc ++ [@secret_code[key]]
      {key, _}, acc -> acc
    end)
  end

  @spec binary_converter(number :: integer) :: map
  def binary_converter(number) do
    list =
      Integer.to_string(number, 2)
      |> String.codepoints()
      |> Enum.reverse()

    Enum.zip(@key_code, list)
    |> Map.new()
  end
end
