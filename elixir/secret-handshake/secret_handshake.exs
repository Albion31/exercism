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
  def commands(0), do: []
  def commands(code) do
    binary_number = binary_converter(code) |> String.to_integer()

    [@secret_code[binary_number]]
  end

  def binary_converter(number) do
    Integer.to_string(number, 2)
  end
end
