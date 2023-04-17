# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.SSEKeyType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :SSE_KMS_SERVICE
      def default() do
        :SSE_KMS_SERVICE
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:SSE_KMS_SERVICE) do
          1
        end

        def encode("SSE_KMS_SERVICE") do
          1
        end
      ),
      (
        def encode(:SSE_BYOK) do
          2
        end

        def encode("SSE_BYOK") do
          2
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :SSE_KMS_SERVICE
      end,
      def decode(2) do
        :SSE_BYOK
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{1, :SSE_KMS_SERVICE}, {2, :SSE_BYOK}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:SSE_KMS_SERVICE) do
          true
        end,
        def has_constant?(:SSE_BYOK) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
