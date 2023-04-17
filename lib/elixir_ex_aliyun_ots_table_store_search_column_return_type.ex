# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.ColumnReturnType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :RETURN_ALL
      def default() do
        :RETURN_ALL
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:RETURN_ALL) do
          1
        end

        def encode("RETURN_ALL") do
          1
        end
      ),
      (
        def encode(:RETURN_SPECIFIED) do
          2
        end

        def encode("RETURN_SPECIFIED") do
          2
        end
      ),
      (
        def encode(:RETURN_NONE) do
          3
        end

        def encode("RETURN_NONE") do
          3
        end
      ),
      (
        def encode(:RETURN_ALL_FROM_INDEX) do
          4
        end

        def encode("RETURN_ALL_FROM_INDEX") do
          4
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :RETURN_ALL
      end,
      def decode(2) do
        :RETURN_SPECIFIED
      end,
      def decode(3) do
        :RETURN_NONE
      end,
      def decode(4) do
        :RETURN_ALL_FROM_INDEX
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{1, :RETURN_ALL}, {2, :RETURN_SPECIFIED}, {3, :RETURN_NONE}, {4, :RETURN_ALL_FROM_INDEX}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:RETURN_ALL) do
          true
        end,
        def has_constant?(:RETURN_SPECIFIED) do
          true
        end,
        def has_constant?(:RETURN_NONE) do
          true
        end,
        def has_constant?(:RETURN_ALL_FROM_INDEX) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
