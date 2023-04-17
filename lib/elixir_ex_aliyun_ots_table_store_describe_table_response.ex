# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.DescribeTableResponse do
  @moduledoc false
  defstruct table_meta: nil,
            reserved_throughput_details: nil,
            table_options: nil,
            table_status: nil,
            stream_details: nil,
            shard_splits: [],
            sse_details: nil,
            index_metas: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        []
        |> encode_table_meta(msg)
        |> encode_reserved_throughput_details(msg)
        |> encode_table_options(msg)
        |> encode_table_status(msg)
        |> encode_stream_details(msg)
        |> encode_shard_splits(msg)
        |> encode_sse_details(msg)
        |> encode_index_metas(msg)
      end
    )

    []

    [
      defp encode_table_meta(acc, msg) do
        try do
          case msg.table_meta do
            nil -> raise Protox.RequiredFieldsError.new([:table_meta])
            _ -> [acc, "\n", Protox.Encode.encode_message(msg.table_meta)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_meta, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reserved_throughput_details(acc, msg) do
        try do
          case msg.reserved_throughput_details do
            nil -> raise Protox.RequiredFieldsError.new([:reserved_throughput_details])
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.reserved_throughput_details)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reserved_throughput_details, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_options(acc, msg) do
        try do
          case msg.table_options do
            nil -> raise Protox.RequiredFieldsError.new([:table_options])
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.table_options)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_options, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_status(acc, msg) do
        try do
          case msg.table_status do
            nil ->
              raise Protox.RequiredFieldsError.new([:table_status])

            _ ->
              [
                acc,
                " ",
                msg.table_status
                |> ExAliyunOts.TableStore.TableStatus.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_status, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stream_details(acc, msg) do
        try do
          case msg.stream_details do
            nil -> acc
            _ -> [acc, "*", Protox.Encode.encode_message(msg.stream_details)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stream_details, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_shard_splits(acc, msg) do
        try do
          case msg.shard_splits do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_bytes(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shard_splits, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sse_details(acc, msg) do
        try do
          case msg.sse_details do
            nil -> acc
            _ -> [acc, ":", Protox.Encode.encode_message(msg.sse_details)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sse_details, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_metas(acc, msg) do
        try do
          case msg.index_metas do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_metas, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DescribeTableResponse))

          case [:table_meta, :reserved_throughput_details, :table_options, :table_status] --
                 set_fields do
            [] -> msg
            missing_fields -> raise Protox.RequiredFieldsError.new(missing_fields)
          end
        end
      )
    )

    (
      @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
      defp parse_key_value(set_fields, <<>>, msg) do
        {msg, set_fields}
      end

      defp parse_key_value(set_fields, bytes, msg) do
        {new_set_fields, field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:table_meta | set_fields],
               [
                 table_meta:
                   Protox.MergeMessage.merge(
                     msg.table_meta,
                     ExAliyunOts.TableStore.TableMeta.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:reserved_throughput_details | set_fields],
               [
                 reserved_throughput_details:
                   Protox.MergeMessage.merge(
                     msg.reserved_throughput_details,
                     ExAliyunOts.TableStore.ReservedThroughputDetails.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:table_options | set_fields],
               [
                 table_options:
                   Protox.MergeMessage.merge(
                     msg.table_options,
                     ExAliyunOts.TableStore.TableOptions.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.TableStatus)
              {[:table_status | set_fields], [table_status: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:stream_details | set_fields],
               [
                 stream_details:
                   Protox.MergeMessage.merge(
                     msg.stream_details,
                     ExAliyunOts.TableStore.StreamDetails.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:shard_splits | set_fields], [shard_splits: msg.shard_splits ++ [delimited]],
               rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:sse_details | set_fields],
               [
                 sse_details:
                   Protox.MergeMessage.merge(
                     msg.sse_details,
                     ExAliyunOts.TableStore.SSEDetails.decode!(delimited)
                   )
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:index_metas | set_fields],
               [
                 index_metas:
                   msg.index_metas ++ [ExAliyunOts.TableStore.IndexMeta.decode!(delimited)]
               ], rest}

            {tag, wire_type, rest} ->
              {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {set_fields, [], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(new_set_fields, rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStore.DescribeTableResponse,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:table_meta, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableMeta}},
        2 =>
          {:reserved_throughput_details, {:scalar, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        3 => {:table_options, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        4 => {:table_status, {:scalar, :ACTIVE}, {:enum, ExAliyunOts.TableStore.TableStatus}},
        5 => {:stream_details, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        6 => {:shard_splits, :unpacked, :bytes},
        7 => {:sse_details, {:scalar, nil}, {:message, ExAliyunOts.TableStore.SSEDetails}},
        8 => {:index_metas, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        index_metas: {8, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}},
        reserved_throughput_details:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        shard_splits: {6, :unpacked, :bytes},
        sse_details: {7, {:scalar, nil}, {:message, ExAliyunOts.TableStore.SSEDetails}},
        stream_details: {5, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        table_meta: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableMeta}},
        table_options: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        table_status: {4, {:scalar, :ACTIVE}, {:enum, ExAliyunOts.TableStore.TableStatus}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableMeta",
          kind: {:scalar, nil},
          label: :required,
          name: :table_meta,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.TableMeta}
        },
        %{
          __struct__: Protox.Field,
          json_name: "reservedThroughputDetails",
          kind: {:scalar, nil},
          label: :required,
          name: :reserved_throughput_details,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableOptions",
          kind: {:scalar, nil},
          label: :required,
          name: :table_options,
          tag: 3,
          type: {:message, ExAliyunOts.TableStore.TableOptions}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableStatus",
          kind: {:scalar, :ACTIVE},
          label: :required,
          name: :table_status,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStore.TableStatus}
        },
        %{
          __struct__: Protox.Field,
          json_name: "streamDetails",
          kind: {:scalar, nil},
          label: :optional,
          name: :stream_details,
          tag: 5,
          type: {:message, ExAliyunOts.TableStore.StreamDetails}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shardSplits",
          kind: :unpacked,
          label: :repeated,
          name: :shard_splits,
          tag: 6,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "sseDetails",
          kind: {:scalar, nil},
          label: :optional,
          name: :sse_details,
          tag: 7,
          type: {:message, ExAliyunOts.TableStore.SSEDetails}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexMetas",
          kind: :unpacked,
          label: :repeated,
          name: :index_metas,
          tag: 8,
          type: {:message, ExAliyunOts.TableStore.IndexMeta}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:table_meta) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :table_meta,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableMeta}
           }}
        end

        def field_def("tableMeta") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :table_meta,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableMeta}
           }}
        end

        def field_def("table_meta") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :table_meta,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableMeta}
           }}
        end
      ),
      (
        def field_def(:reserved_throughput_details) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end

        def field_def("reservedThroughputDetails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end

        def field_def("reserved_throughput_details") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end
      ),
      (
        def field_def(:table_options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end

        def field_def("tableOptions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end

        def field_def("table_options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end
      ),
      (
        def field_def(:table_status) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableStatus",
             kind: {:scalar, :ACTIVE},
             label: :required,
             name: :table_status,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.TableStatus}
           }}
        end

        def field_def("tableStatus") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableStatus",
             kind: {:scalar, :ACTIVE},
             label: :required,
             name: :table_status,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.TableStatus}
           }}
        end

        def field_def("table_status") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableStatus",
             kind: {:scalar, :ACTIVE},
             label: :required,
             name: :table_status,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.TableStatus}
           }}
        end
      ),
      (
        def field_def(:stream_details) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end

        def field_def("streamDetails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end

        def field_def("stream_details") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end
      ),
      (
        def field_def(:shard_splits) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardSplits",
             kind: :unpacked,
             label: :repeated,
             name: :shard_splits,
             tag: 6,
             type: :bytes
           }}
        end

        def field_def("shardSplits") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardSplits",
             kind: :unpacked,
             label: :repeated,
             name: :shard_splits,
             tag: 6,
             type: :bytes
           }}
        end

        def field_def("shard_splits") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardSplits",
             kind: :unpacked,
             label: :repeated,
             name: :shard_splits,
             tag: 6,
             type: :bytes
           }}
        end
      ),
      (
        def field_def(:sse_details) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_details,
             tag: 7,
             type: {:message, ExAliyunOts.TableStore.SSEDetails}
           }}
        end

        def field_def("sseDetails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_details,
             tag: 7,
             type: {:message, ExAliyunOts.TableStore.SSEDetails}
           }}
        end

        def field_def("sse_details") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_details,
             tag: 7,
             type: {:message, ExAliyunOts.TableStore.SSEDetails}
           }}
        end
      ),
      (
        def field_def(:index_metas) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMetas",
             kind: :unpacked,
             label: :repeated,
             name: :index_metas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end

        def field_def("indexMetas") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMetas",
             kind: :unpacked,
             label: :repeated,
             name: :index_metas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end

        def field_def("index_metas") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMetas",
             kind: :unpacked,
             label: :repeated,
             name: :index_metas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: [
            ((:table_meta | :reserved_throughput_details) | :table_options) | :table_status
          ]
    def required_fields() do
      [:table_meta, :reserved_throughput_details, :table_options, :table_status]
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:table_meta) do
      {:ok, nil}
    end,
    def default(:reserved_throughput_details) do
      {:ok, nil}
    end,
    def default(:table_options) do
      {:ok, nil}
    end,
    def default(:table_status) do
      {:ok, :ACTIVE}
    end,
    def default(:stream_details) do
      {:ok, nil}
    end,
    def default(:shard_splits) do
      {:error, :no_default_value}
    end,
    def default(:sse_details) do
      {:ok, nil}
    end,
    def default(:index_metas) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
