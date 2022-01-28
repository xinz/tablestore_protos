# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.BloomFilterType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :NONE
      def(default()) do
        :NONE
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:NONE)) do
          1
        end

        def(encode("NONE")) do
          1
        end
      ),
      (
        def(encode(:CELL)) do
          2
        end

        def(encode("CELL")) do
          2
        end
      ),
      (
        def(encode(:ROW)) do
          3
        end

        def(encode("ROW")) do
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
        :NONE
      end,
      def(decode(2)) do
        :CELL
      end,
      def(decode(3)) do
        :ROW
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :NONE}, {2, :CELL}, {3, :ROW}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:NONE)) do
          true
        end,
        def(has_constant?(:CELL)) do
          true
        end,
        def(has_constant?(:ROW)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end