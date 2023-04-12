# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.IndexType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :IT_GLOBAL_INDEX
      def default() do
        :IT_GLOBAL_INDEX
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:IT_GLOBAL_INDEX) do
          0
        end

        def encode("IT_GLOBAL_INDEX") do
          0
        end
      ),
      (
        def encode(:IT_LOCAL_INDEX) do
          1
        end

        def encode("IT_LOCAL_INDEX") do
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
        :IT_GLOBAL_INDEX
      end,
      def decode(1) do
        :IT_LOCAL_INDEX
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [{0, :IT_GLOBAL_INDEX}, {1, :IT_LOCAL_INDEX}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:IT_GLOBAL_INDEX) do
          true
        end,
        def has_constant?(:IT_LOCAL_INDEX) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
