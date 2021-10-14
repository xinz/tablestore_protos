# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.AggregationType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :AGG_AVG
      def(default()) do
        :AGG_AVG
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:AGG_AVG)) do
          1
        end

        def(encode("AGG_AVG")) do
          1
        end
      ),
      (
        def(encode(:AGG_DISTINCT_COUNT)) do
          6
        end

        def(encode("AGG_DISTINCT_COUNT")) do
          6
        end
      ),
      (
        def(encode(:AGG_MAX)) do
          2
        end

        def(encode("AGG_MAX")) do
          2
        end
      ),
      (
        def(encode(:AGG_MIN)) do
          3
        end

        def(encode("AGG_MIN")) do
          3
        end
      ),
      (
        def(encode(:AGG_SUM)) do
          4
        end

        def(encode("AGG_SUM")) do
          4
        end
      ),
      (
        def(encode(:AGG_COUNT)) do
          5
        end

        def(encode("AGG_COUNT")) do
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
        :AGG_AVG
      end,
      def(decode(2)) do
        :AGG_MAX
      end,
      def(decode(3)) do
        :AGG_MIN
      end,
      def(decode(4)) do
        :AGG_SUM
      end,
      def(decode(5)) do
        :AGG_COUNT
      end,
      def(decode(6)) do
        :AGG_DISTINCT_COUNT
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [
        {1, :AGG_AVG},
        {6, :AGG_DISTINCT_COUNT},
        {2, :AGG_MAX},
        {3, :AGG_MIN},
        {4, :AGG_SUM},
        {5, :AGG_COUNT}
      ]
    end
  )
end