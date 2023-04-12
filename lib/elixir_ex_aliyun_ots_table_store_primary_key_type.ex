# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.PrimaryKeyType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :INTEGER
      def default() do
        :INTEGER
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:INTEGER) do
          1
        end

        def encode("INTEGER") do
          1
        end
      ),
      (
        def encode(:STRING) do
          2
        end

        def encode("STRING") do
          2
        end
      ),
      (
        def encode(:BINARY) do
          3
        end

        def encode("BINARY") do
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
        :INTEGER
      end,
      def decode(2) do
        :STRING
      end,
      def decode(3) do
        :BINARY
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{1, :INTEGER}, {2, :STRING}, {3, :BINARY}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:INTEGER) do
          true
        end,
        def has_constant?(:STRING) do
          true
        end,
        def has_constant?(:BINARY) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
