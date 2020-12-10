# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.ScoreMode) do
  @moduledoc false
  (
    (
      @spec default() :: :SCORE_MODE_NONE
      def(default()) do
        :SCORE_MODE_NONE
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:SCORE_MODE_NONE)) do
        1
      end,
      def(encode(:SCORE_MODE_AVG)) do
        2
      end,
      def(encode(:SCORE_MODE_MAX)) do
        3
      end,
      def(encode(:SCORE_MODE_TOTAL)) do
        4
      end,
      def(encode(:SCORE_MODE_MIN)) do
        5
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :SCORE_MODE_NONE
      end,
      def(decode(2)) do
        :SCORE_MODE_AVG
      end,
      def(decode(3)) do
        :SCORE_MODE_MAX
      end,
      def(decode(4)) do
        :SCORE_MODE_TOTAL
      end,
      def(decode(5)) do
        :SCORE_MODE_MIN
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [
        {1, :SCORE_MODE_NONE},
        {2, :SCORE_MODE_AVG},
        {3, :SCORE_MODE_MAX},
        {4, :SCORE_MODE_TOTAL},
        {5, :SCORE_MODE_MIN}
      ]
    end
  )
end