# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.FieldType) do
  @moduledoc false
  (
    (
      @spec default() :: :LONG
      def(default()) do
        :LONG
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:LONG)) do
        1
      end,
      def(encode(:DOUBLE)) do
        2
      end,
      def(encode(:BOOLEAN)) do
        3
      end,
      def(encode(:KEYWORD)) do
        4
      end,
      def(encode(:TEXT)) do
        5
      end,
      def(encode(:NESTED)) do
        6
      end,
      def(encode(:GEO_POINT)) do
        7
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :LONG
      end,
      def(decode(2)) do
        :DOUBLE
      end,
      def(decode(3)) do
        :BOOLEAN
      end,
      def(decode(4)) do
        :KEYWORD
      end,
      def(decode(5)) do
        :TEXT
      end,
      def(decode(6)) do
        :NESTED
      end,
      def(decode(7)) do
        :GEO_POINT
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [
        {1, :LONG},
        {2, :DOUBLE},
        {3, :BOOLEAN},
        {4, :KEYWORD},
        {5, :TEXT},
        {6, :NESTED},
        {7, :GEO_POINT}
      ]
    end
  )
end