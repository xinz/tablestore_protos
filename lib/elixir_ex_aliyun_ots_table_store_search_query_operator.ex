# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.QueryOperator) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :OR
      def(default()) do
        :OR
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:OR)) do
          1
        end

        def(encode("OR")) do
          1
        end
      ),
      (
        def(encode(:AND)) do
          2
        end

        def(encode("AND")) do
          2
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :OR
      end,
      def(decode(2)) do
        :AND
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :OR}, {2, :AND}]
    end
  )
end