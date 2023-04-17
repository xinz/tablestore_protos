# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.SQLPayloadVersion do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :SQL_PLAIN_BUFFER
      def default() do
        :SQL_PLAIN_BUFFER
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:SQL_PLAIN_BUFFER) do
          1
        end

        def encode("SQL_PLAIN_BUFFER") do
          1
        end
      ),
      (
        def encode(:SQL_FLAT_BUFFERS) do
          2
        end

        def encode("SQL_FLAT_BUFFERS") do
          2
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :SQL_PLAIN_BUFFER
      end,
      def decode(2) do
        :SQL_FLAT_BUFFERS
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{1, :SQL_PLAIN_BUFFER}, {2, :SQL_FLAT_BUFFERS}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:SQL_PLAIN_BUFFER) do
          true
        end,
        def has_constant?(:SQL_FLAT_BUFFERS) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
