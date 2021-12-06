# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ChannelStatus) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :OPEN
      def(default()) do
        :OPEN
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:OPEN)) do
          1
        end

        def(encode("OPEN")) do
          1
        end
      ),
      (
        def(encode(:CLOSING)) do
          2
        end

        def(encode("CLOSING")) do
          2
        end
      ),
      (
        def(encode(:CLOSE)) do
          3
        end

        def(encode("CLOSE")) do
          3
        end
      ),
      (
        def(encode(:TERMINATED)) do
          4
        end

        def(encode("TERMINATED")) do
          4
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :OPEN
      end,
      def(decode(2)) do
        :CLOSING
      end,
      def(decode(3)) do
        :CLOSE
      end,
      def(decode(4)) do
        :TERMINATED
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :OPEN}, {2, :CLOSING}, {3, :CLOSE}, {4, :TERMINATED}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:OPEN)) do
          true
        end,
        def(has_constant?(:CLOSING)) do
          true
        end,
        def(has_constant?(:CLOSE)) do
          true
        end,
        def(has_constant?(:TERMINATED)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end