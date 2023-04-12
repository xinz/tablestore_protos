# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreTunnel.TunnelType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :BaseData
      def default() do
        :BaseData
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:BaseData) do
          1
        end

        def encode("BaseData") do
          1
        end
      ),
      (
        def encode(:Stream) do
          2
        end

        def encode("Stream") do
          2
        end
      ),
      (
        def encode(:BaseAndStream) do
          3
        end

        def encode("BaseAndStream") do
          3
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :BaseData
      end,
      def decode(2) do
        :Stream
      end,
      def decode(3) do
        :BaseAndStream
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{1, :BaseData}, {2, :Stream}, {3, :BaseAndStream}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:BaseData) do
          true
        end,
        def has_constant?(:Stream) do
          true
        end,
        def has_constant?(:BaseAndStream) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
