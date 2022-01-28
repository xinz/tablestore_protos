# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TableStatus) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :ACTIVE
      def(default()) do
        :ACTIVE
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:ACTIVE)) do
          1
        end

        def(encode("ACTIVE")) do
          1
        end
      ),
      (
        def(encode(:INACTIVE)) do
          2
        end

        def(encode("INACTIVE")) do
          2
        end
      ),
      (
        def(encode(:LOADING)) do
          3
        end

        def(encode("LOADING")) do
          3
        end
      ),
      (
        def(encode(:UNLOADING)) do
          4
        end

        def(encode("UNLOADING")) do
          4
        end
      ),
      (
        def(encode(:UPDATING)) do
          5
        end

        def(encode("UPDATING")) do
          5
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :ACTIVE
      end,
      def(decode(2)) do
        :INACTIVE
      end,
      def(decode(3)) do
        :LOADING
      end,
      def(decode(4)) do
        :UNLOADING
      end,
      def(decode(5)) do
        :UPDATING
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :ACTIVE}, {2, :INACTIVE}, {3, :LOADING}, {4, :UNLOADING}, {5, :UPDATING}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:ACTIVE)) do
          true
        end,
        def(has_constant?(:INACTIVE)) do
          true
        end,
        def(has_constant?(:LOADING)) do
          true
        end,
        def(has_constant?(:UNLOADING)) do
          true
        end,
        def(has_constant?(:UPDATING)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end