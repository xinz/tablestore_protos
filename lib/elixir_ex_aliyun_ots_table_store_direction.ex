# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.Direction) do
  @moduledoc false
  (
    (
      @spec default() :: :FORWARD
      def(default()) do
        :FORWARD
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:FORWARD)) do
        0
      end,
      def(encode(:BACKWARD)) do
        1
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(0)) do
        :FORWARD
      end,
      def(decode(1)) do
        :BACKWARD
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{0, :FORWARD}, {1, :BACKWARD}]
    end
  )
end