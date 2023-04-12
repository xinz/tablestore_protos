# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.GeoDistanceType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :GEO_DISTANCE_ARC
      def default() do
        :GEO_DISTANCE_ARC
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:GEO_DISTANCE_ARC) do
          0
        end

        def encode("GEO_DISTANCE_ARC") do
          0
        end
      ),
      (
        def encode(:GEO_DISTANCE_PLANE) do
          1
        end

        def encode("GEO_DISTANCE_PLANE") do
          1
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(0) do
        :GEO_DISTANCE_ARC
      end,
      def decode(1) do
        :GEO_DISTANCE_PLANE
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{0, :GEO_DISTANCE_ARC}, {1, :GEO_DISTANCE_PLANE}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:GEO_DISTANCE_ARC) do
          true
        end,
        def has_constant?(:GEO_DISTANCE_PLANE) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
