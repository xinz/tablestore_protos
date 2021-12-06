# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.RowExistenceExpectation) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :IGNORE
      def(default()) do
        :IGNORE
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:IGNORE)) do
          0
        end

        def(encode("IGNORE")) do
          0
        end
      ),
      (
        def(encode(:EXPECT_EXIST)) do
          1
        end

        def(encode("EXPECT_EXIST")) do
          1
        end
      ),
      (
        def(encode(:EXPECT_NOT_EXIST)) do
          2
        end

        def(encode("EXPECT_NOT_EXIST")) do
          2
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(0)) do
        :IGNORE
      end,
      def(decode(1)) do
        :EXPECT_EXIST
      end,
      def(decode(2)) do
        :EXPECT_NOT_EXIST
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{0, :IGNORE}, {1, :EXPECT_EXIST}, {2, :EXPECT_NOT_EXIST}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:IGNORE)) do
          true
        end,
        def(has_constant?(:EXPECT_EXIST)) do
          true
        end,
        def(has_constant?(:EXPECT_NOT_EXIST)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end