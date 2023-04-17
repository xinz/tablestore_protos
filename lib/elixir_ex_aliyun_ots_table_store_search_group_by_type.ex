# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.GroupByType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :GROUP_BY_FIELD
      def default() do
        :GROUP_BY_FIELD
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:GROUP_BY_FIELD) do
          1
        end

        def encode("GROUP_BY_FIELD") do
          1
        end
      ),
      (
        def encode(:GROUP_BY_RANGE) do
          2
        end

        def encode("GROUP_BY_RANGE") do
          2
        end
      ),
      (
        def encode(:GROUP_BY_FILTER) do
          3
        end

        def encode("GROUP_BY_FILTER") do
          3
        end
      ),
      (
        def encode(:GROUP_BY_GEO_DISTANCE) do
          4
        end

        def encode("GROUP_BY_GEO_DISTANCE") do
          4
        end
      ),
      (
        def encode(:GROUP_BY_HISTOGRAM) do
          5
        end

        def encode("GROUP_BY_HISTOGRAM") do
          5
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :GROUP_BY_FIELD
      end,
      def decode(2) do
        :GROUP_BY_RANGE
      end,
      def decode(3) do
        :GROUP_BY_FILTER
      end,
      def decode(4) do
        :GROUP_BY_GEO_DISTANCE
      end,
      def decode(5) do
        :GROUP_BY_HISTOGRAM
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {1, :GROUP_BY_FIELD},
        {2, :GROUP_BY_RANGE},
        {3, :GROUP_BY_FILTER},
        {4, :GROUP_BY_GEO_DISTANCE},
        {5, :GROUP_BY_HISTOGRAM}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:GROUP_BY_FIELD) do
          true
        end,
        def has_constant?(:GROUP_BY_RANGE) do
          true
        end,
        def has_constant?(:GROUP_BY_FILTER) do
          true
        end,
        def has_constant?(:GROUP_BY_GEO_DISTANCE) do
          true
        end,
        def has_constant?(:GROUP_BY_HISTOGRAM) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
