# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.IndexOptions) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :DOCS
      def(default()) do
        :DOCS
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:DOCS)) do
          1
        end

        def(encode("DOCS")) do
          1
        end
      ),
      (
        def(encode(:FREQS)) do
          2
        end

        def(encode("FREQS")) do
          2
        end
      ),
      (
        def(encode(:POSITIONS)) do
          3
        end

        def(encode("POSITIONS")) do
          3
        end
      ),
      (
        def(encode(:OFFSETS)) do
          4
        end

        def(encode("OFFSETS")) do
          4
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(1)) do
        :DOCS
      end,
      def(decode(2)) do
        :FREQS
      end,
      def(decode(3)) do
        :POSITIONS
      end,
      def(decode(4)) do
        :OFFSETS
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{1, :DOCS}, {2, :FREQS}, {3, :POSITIONS}, {4, :OFFSETS}]
    end
  )
end