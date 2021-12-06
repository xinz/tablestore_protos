# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.FilterType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :FT_SINGLE_COLUMN_VALUE
      def(default()) do
        :FT_SINGLE_COLUMN_VALUE
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:FT_SINGLE_COLUMN_VALUE)) do
          1
        end

        def(encode("FT_SINGLE_COLUMN_VALUE")) do
          1
        end
      ),
      (
        def(encode(:FT_COMPOSITE_COLUMN_VALUE)) do
          2
        end

        def(encode("FT_COMPOSITE_COLUMN_VALUE")) do
          2
        end
      ),
      (
        def(encode(:FT_COLUMN_PAGINATION)) do
          3
        end

        def(encode("FT_COLUMN_PAGINATION")) do
          3
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :FT_SINGLE_COLUMN_VALUE
      end,
      def(decode(2)) do
        :FT_COMPOSITE_COLUMN_VALUE
      end,
      def(decode(3)) do
        :FT_COLUMN_PAGINATION
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :FT_SINGLE_COLUMN_VALUE}, {2, :FT_COMPOSITE_COLUMN_VALUE}, {3, :FT_COLUMN_PAGINATION}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:FT_SINGLE_COLUMN_VALUE)) do
          true
        end,
        def(has_constant?(:FT_COMPOSITE_COLUMN_VALUE)) do
          true
        end,
        def(has_constant?(:FT_COLUMN_PAGINATION)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end