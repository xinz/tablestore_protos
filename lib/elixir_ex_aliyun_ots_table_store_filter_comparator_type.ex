# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.ComparatorType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :CT_EQUAL
      def(default()) do
        :CT_EQUAL
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:CT_EQUAL)) do
          1
        end

        def(encode("CT_EQUAL")) do
          1
        end
      ),
      (
        def(encode(:CT_NOT_EQUAL)) do
          2
        end

        def(encode("CT_NOT_EQUAL")) do
          2
        end
      ),
      (
        def(encode(:CT_GREATER_THAN)) do
          3
        end

        def(encode("CT_GREATER_THAN")) do
          3
        end
      ),
      (
        def(encode(:CT_GREATER_EQUAL)) do
          4
        end

        def(encode("CT_GREATER_EQUAL")) do
          4
        end
      ),
      (
        def(encode(:CT_LESS_THAN)) do
          5
        end

        def(encode("CT_LESS_THAN")) do
          5
        end
      ),
      (
        def(encode(:CT_LESS_EQUAL)) do
          6
        end

        def(encode("CT_LESS_EQUAL")) do
          6
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :CT_EQUAL
      end,
      def(decode(2)) do
        :CT_NOT_EQUAL
      end,
      def(decode(3)) do
        :CT_GREATER_THAN
      end,
      def(decode(4)) do
        :CT_GREATER_EQUAL
      end,
      def(decode(5)) do
        :CT_LESS_THAN
      end,
      def(decode(6)) do
        :CT_LESS_EQUAL
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [
        {1, :CT_EQUAL},
        {2, :CT_NOT_EQUAL},
        {3, :CT_GREATER_THAN},
        {4, :CT_GREATER_EQUAL},
        {5, :CT_LESS_THAN},
        {6, :CT_LESS_EQUAL}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:CT_EQUAL)) do
          true
        end,
        def(has_constant?(:CT_NOT_EQUAL)) do
          true
        end,
        def(has_constant?(:CT_GREATER_THAN)) do
          true
        end,
        def(has_constant?(:CT_GREATER_EQUAL)) do
          true
        end,
        def(has_constant?(:CT_LESS_THAN)) do
          true
        end,
        def(has_constant?(:CT_LESS_EQUAL)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end