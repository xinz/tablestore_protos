# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ActionType) do
  @moduledoc false
  (
    (
      @spec default() :: :PUT_ROW
      def(default()) do
        :PUT_ROW
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:PUT_ROW)) do
        1
      end,
      def(encode(:UPDATE_ROW)) do
        2
      end,
      def(encode(:DELETE_ROW)) do
        3
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :PUT_ROW
      end,
      def(decode(2)) do
        :UPDATE_ROW
      end,
      def(decode(3)) do
        :DELETE_ROW
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{1, :PUT_ROW}, {2, :UPDATE_ROW}, {3, :DELETE_ROW}]
    end
  )
end