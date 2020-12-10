# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.LogicalOperator) do
  @moduledoc false
  (
    (
      @spec default() :: :LO_NOT
      def(default()) do
        :LO_NOT
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:LO_NOT)) do
        1
      end,
      def(encode(:LO_AND)) do
        2
      end,
      def(encode(:LO_OR)) do
        3
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :LO_NOT
      end,
      def(decode(2)) do
        :LO_AND
      end,
      def(decode(3)) do
        :LO_OR
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{1, :LO_NOT}, {2, :LO_AND}, {3, :LO_OR}]
    end
  )
end