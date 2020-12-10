# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.TunnelType) do
  @moduledoc false
  (
    (
      @spec default() :: :BaseData
      def(default()) do
        :BaseData
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:BaseData)) do
        1
      end,
      def(encode(:Stream)) do
        2
      end,
      def(encode(:BaseAndStream)) do
        3
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :BaseData
      end,
      def(decode(2)) do
        :Stream
      end,
      def(decode(3)) do
        :BaseAndStream
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{1, :BaseData}, {2, :Stream}, {3, :BaseAndStream}]
    end
  )
end