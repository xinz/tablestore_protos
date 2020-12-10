# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SortOrder) do
  @moduledoc false
  (
    (
      @spec default() :: :SORT_ORDER_ASC
      def(default()) do
        :SORT_ORDER_ASC
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:SORT_ORDER_ASC)) do
        0
      end,
      def(encode(:SORT_ORDER_DESC)) do
        1
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(0)) do
        :SORT_ORDER_ASC
      end,
      def(decode(1)) do
        :SORT_ORDER_DESC
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{0, :SORT_ORDER_ASC}, {1, :SORT_ORDER_DESC}]
    end
  )
end