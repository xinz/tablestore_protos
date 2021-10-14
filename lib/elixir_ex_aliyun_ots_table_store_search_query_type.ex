# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.QueryType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :MATCH_QUERY
      def(default()) do
        :MATCH_QUERY
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:MATCH_QUERY)) do
          1
        end

        def(encode("MATCH_QUERY")) do
          1
        end
      ),
      (
        def(encode(:MATCH_PHRASE_QUERY)) do
          2
        end

        def(encode("MATCH_PHRASE_QUERY")) do
          2
        end
      ),
      (
        def(encode(:TERM_QUERY)) do
          3
        end

        def(encode("TERM_QUERY")) do
          3
        end
      ),
      (
        def(encode(:RANGE_QUERY)) do
          4
        end

        def(encode("RANGE_QUERY")) do
          4
        end
      ),
      (
        def(encode(:PREFIX_QUERY)) do
          5
        end

        def(encode("PREFIX_QUERY")) do
          5
        end
      ),
      (
        def(encode(:BOOL_QUERY)) do
          6
        end

        def(encode("BOOL_QUERY")) do
          6
        end
      ),
      (
        def(encode(:CONST_SCORE_QUERY)) do
          7
        end

        def(encode("CONST_SCORE_QUERY")) do
          7
        end
      ),
      (
        def(encode(:FUNCTION_SCORE_QUERY)) do
          8
        end

        def(encode("FUNCTION_SCORE_QUERY")) do
          8
        end
      ),
      (
        def(encode(:NESTED_QUERY)) do
          9
        end

        def(encode("NESTED_QUERY")) do
          9
        end
      ),
      (
        def(encode(:WILDCARD_QUERY)) do
          10
        end

        def(encode("WILDCARD_QUERY")) do
          10
        end
      ),
      (
        def(encode(:MATCH_ALL_QUERY)) do
          11
        end

        def(encode("MATCH_ALL_QUERY")) do
          11
        end
      ),
      (
        def(encode(:GEO_BOUNDING_BOX_QUERY)) do
          12
        end

        def(encode("GEO_BOUNDING_BOX_QUERY")) do
          12
        end
      ),
      (
        def(encode(:GEO_DISTANCE_QUERY)) do
          13
        end

        def(encode("GEO_DISTANCE_QUERY")) do
          13
        end
      ),
      (
        def(encode(:GEO_POLYGON_QUERY)) do
          14
        end

        def(encode("GEO_POLYGON_QUERY")) do
          14
        end
      ),
      (
        def(encode(:TERMS_QUERY)) do
          15
        end

        def(encode("TERMS_QUERY")) do
          15
        end
      ),
      (
        def(encode(:EXISTS_QUERY)) do
          16
        end

        def(encode("EXISTS_QUERY")) do
          16
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :MATCH_QUERY
      end,
      def(decode(2)) do
        :MATCH_PHRASE_QUERY
      end,
      def(decode(3)) do
        :TERM_QUERY
      end,
      def(decode(4)) do
        :RANGE_QUERY
      end,
      def(decode(5)) do
        :PREFIX_QUERY
      end,
      def(decode(6)) do
        :BOOL_QUERY
      end,
      def(decode(7)) do
        :CONST_SCORE_QUERY
      end,
      def(decode(8)) do
        :FUNCTION_SCORE_QUERY
      end,
      def(decode(9)) do
        :NESTED_QUERY
      end,
      def(decode(10)) do
        :WILDCARD_QUERY
      end,
      def(decode(11)) do
        :MATCH_ALL_QUERY
      end,
      def(decode(12)) do
        :GEO_BOUNDING_BOX_QUERY
      end,
      def(decode(13)) do
        :GEO_DISTANCE_QUERY
      end,
      def(decode(14)) do
        :GEO_POLYGON_QUERY
      end,
      def(decode(15)) do
        :TERMS_QUERY
      end,
      def(decode(16)) do
        :EXISTS_QUERY
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [
        {1, :MATCH_QUERY},
        {2, :MATCH_PHRASE_QUERY},
        {3, :TERM_QUERY},
        {4, :RANGE_QUERY},
        {5, :PREFIX_QUERY},
        {6, :BOOL_QUERY},
        {7, :CONST_SCORE_QUERY},
        {8, :FUNCTION_SCORE_QUERY},
        {9, :NESTED_QUERY},
        {10, :WILDCARD_QUERY},
        {11, :MATCH_ALL_QUERY},
        {12, :GEO_BOUNDING_BOX_QUERY},
        {13, :GEO_DISTANCE_QUERY},
        {14, :GEO_POLYGON_QUERY},
        {15, :TERMS_QUERY},
        {16, :EXISTS_QUERY}
      ]
    end
  )
end