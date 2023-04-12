# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.SQLStatementType do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :SQL_SELECT
      def default() do
        :SQL_SELECT
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:SQL_SELECT) do
          1
        end

        def encode("SQL_SELECT") do
          1
        end
      ),
      (
        def encode(:SQL_CREATE_TABLE) do
          2
        end

        def encode("SQL_CREATE_TABLE") do
          2
        end
      ),
      (
        def encode(:SQL_SHOW_TABLE) do
          3
        end

        def encode("SQL_SHOW_TABLE") do
          3
        end
      ),
      (
        def encode(:SQL_DESCRIBE_TABLE) do
          4
        end

        def encode("SQL_DESCRIBE_TABLE") do
          4
        end
      ),
      (
        def encode(:SQL_DROP_TABLE) do
          5
        end

        def encode("SQL_DROP_TABLE") do
          5
        end
      ),
      (
        def encode(:SQL_ALTER_TABLE) do
          6
        end

        def encode("SQL_ALTER_TABLE") do
          6
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(1) do
        :SQL_SELECT
      end,
      def decode(2) do
        :SQL_CREATE_TABLE
      end,
      def decode(3) do
        :SQL_SHOW_TABLE
      end,
      def decode(4) do
        :SQL_DESCRIBE_TABLE
      end,
      def decode(5) do
        :SQL_DROP_TABLE
      end,
      def decode(6) do
        :SQL_ALTER_TABLE
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {1, :SQL_SELECT},
        {2, :SQL_CREATE_TABLE},
        {3, :SQL_SHOW_TABLE},
        {4, :SQL_DESCRIBE_TABLE},
        {5, :SQL_DROP_TABLE},
        {6, :SQL_ALTER_TABLE}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:SQL_SELECT) do
          true
        end,
        def has_constant?(:SQL_CREATE_TABLE) do
          true
        end,
        def has_constant?(:SQL_SHOW_TABLE) do
          true
        end,
        def has_constant?(:SQL_DESCRIBE_TABLE) do
          true
        end,
        def has_constant?(:SQL_DROP_TABLE) do
          true
        end,
        def has_constant?(:SQL_ALTER_TABLE) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
