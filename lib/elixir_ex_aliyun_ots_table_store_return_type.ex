# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ReturnType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :RT_NONE
      def(default()) do
        :RT_NONE
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:RT_NONE)) do
          0
        end

        def(encode("RT_NONE")) do
          0
        end
      ),
      (
        def(encode(:RT_PK)) do
          1
        end

        def(encode("RT_PK")) do
          1
        end
      ),
      (
        def(encode(:RT_AFTER_MODIFY)) do
          2
        end

        def(encode("RT_AFTER_MODIFY")) do
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
        :RT_NONE
      end,
      def(decode(1)) do
        :RT_PK
      end,
      def(decode(2)) do
        :RT_AFTER_MODIFY
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{0, :RT_NONE}, {1, :RT_PK}, {2, :RT_AFTER_MODIFY}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:RT_NONE)) do
          true
        end,
        def(has_constant?(:RT_PK)) do
          true
        end,
        def(has_constant?(:RT_AFTER_MODIFY)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end