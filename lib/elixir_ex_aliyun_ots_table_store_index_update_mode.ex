# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.IndexUpdateMode do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :IUM_ASYNC_INDEX
      def default() do
        :IUM_ASYNC_INDEX
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:IUM_ASYNC_INDEX) do
          0
        end

        def encode("IUM_ASYNC_INDEX") do
          0
        end
      ),
      (
        def encode(:IUM_SYNC_INDEX) do
          1
        end

        def encode("IUM_SYNC_INDEX") do
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
        :IUM_ASYNC_INDEX
      end,
      def decode(1) do
        :IUM_SYNC_INDEX
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{0, :IUM_ASYNC_INDEX}, {1, :IUM_SYNC_INDEX}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:IUM_ASYNC_INDEX) do
          true
        end,
        def has_constant?(:IUM_SYNC_INDEX) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
