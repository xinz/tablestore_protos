# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.CreateTableRequest do
  @moduledoc false
  defstruct table_meta: nil,
            reserved_throughput: nil,
            table_options: nil,
            partitions: [],
            stream_spec: nil,
            sse_spec: nil,
            index_metas: [],
            enable_local_txn: nil

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
        |> encode_reserved_throughput(msg)
        |> encode_table_options(msg)
        |> encode_partitions(msg)
        |> encode_stream_spec(msg)
        |> encode_sse_spec(msg)
        |> encode_index_metas(msg)
        |> encode_enable_local_txn(msg)
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
      defp encode_reserved_throughput(acc, msg) do
        try do
          case msg.reserved_throughput do
            nil -> raise Protox.RequiredFieldsError.new([:reserved_throughput])
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.reserved_throughput)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reserved_throughput, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_table_options(acc, msg) do
        try do
          case msg.table_options do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.table_options)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_options, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_partitions(acc, msg) do
        try do
          case msg.partitions do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:partitions, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_stream_spec(acc, msg) do
        try do
          case msg.stream_spec do
            nil -> acc
            _ -> [acc, "*", Protox.Encode.encode_message(msg.stream_spec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:stream_spec, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sse_spec(acc, msg) do
        try do
          case msg.sse_spec do
            nil -> acc
            _ -> [acc, "2", Protox.Encode.encode_message(msg.sse_spec)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sse_spec, "invalid field value"), __STACKTRACE__
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
                  [acc, ":", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_metas, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_enable_local_txn(acc, msg) do
        try do
          case msg.enable_local_txn do
            nil -> acc
            _ -> [acc, "@", Protox.Encode.encode_bool(msg.enable_local_txn)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable_local_txn, "invalid field value"),
                    __STACKTRACE__
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.CreateTableRequest))

          case [:table_meta, :reserved_throughput] -- set_fields do
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

              {[:reserved_throughput | set_fields],
               [
                 reserved_throughput:
                   Protox.MergeMessage.merge(
                     msg.reserved_throughput,
                     ExAliyunOts.TableStore.ReservedThroughput.decode!(delimited)
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:partitions | set_fields],
               [
                 partitions:
                   msg.partitions ++ [ExAliyunOts.TableStore.PartitionRange.decode!(delimited)]
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:stream_spec | set_fields],
               [
                 stream_spec:
                   Protox.MergeMessage.merge(
                     msg.stream_spec,
                     ExAliyunOts.TableStore.StreamSpecification.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:sse_spec | set_fields],
               [
                 sse_spec:
                   Protox.MergeMessage.merge(
                     msg.sse_spec,
                     ExAliyunOts.TableStore.SSESpecification.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:index_metas | set_fields],
               [
                 index_metas:
                   msg.index_metas ++ [ExAliyunOts.TableStore.IndexMeta.decode!(delimited)]
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[:enable_local_txn | set_fields], [enable_local_txn: value], rest}

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
        ExAliyunOts.TableStore.CreateTableRequest,
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
          {:reserved_throughput, {:scalar, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        3 => {:table_options, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        4 => {:partitions, :unpacked, {:message, ExAliyunOts.TableStore.PartitionRange}},
        5 =>
          {:stream_spec, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamSpecification}},
        6 => {:sse_spec, {:scalar, nil}, {:message, ExAliyunOts.TableStore.SSESpecification}},
        7 => {:index_metas, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}},
        8 => {:enable_local_txn, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        enable_local_txn: {8, {:scalar, false}, :bool},
        index_metas: {7, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}},
        partitions: {4, :unpacked, {:message, ExAliyunOts.TableStore.PartitionRange}},
        reserved_throughput:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        sse_spec: {6, {:scalar, nil}, {:message, ExAliyunOts.TableStore.SSESpecification}},
        stream_spec: {5, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamSpecification}},
        table_meta: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableMeta}},
        table_options: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}}
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
          json_name: "reservedThroughput",
          kind: {:scalar, nil},
          label: :required,
          name: :reserved_throughput,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableOptions",
          kind: {:scalar, nil},
          label: :optional,
          name: :table_options,
          tag: 3,
          type: {:message, ExAliyunOts.TableStore.TableOptions}
        },
        %{
          __struct__: Protox.Field,
          json_name: "partitions",
          kind: :unpacked,
          label: :repeated,
          name: :partitions,
          tag: 4,
          type: {:message, ExAliyunOts.TableStore.PartitionRange}
        },
        %{
          __struct__: Protox.Field,
          json_name: "streamSpec",
          kind: {:scalar, nil},
          label: :optional,
          name: :stream_spec,
          tag: 5,
          type: {:message, ExAliyunOts.TableStore.StreamSpecification}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sseSpec",
          kind: {:scalar, nil},
          label: :optional,
          name: :sse_spec,
          tag: 6,
          type: {:message, ExAliyunOts.TableStore.SSESpecification}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexMetas",
          kind: :unpacked,
          label: :repeated,
          name: :index_metas,
          tag: 7,
          type: {:message, ExAliyunOts.TableStore.IndexMeta}
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableLocalTxn",
          kind: {:scalar, false},
          label: :optional,
          name: :enable_local_txn,
          tag: 8,
          type: :bool
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
        def field_def(:reserved_throughput) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
           }}
        end

        def field_def("reservedThroughput") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
           }}
        end

        def field_def("reserved_throughput") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
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
             label: :optional,
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
             label: :optional,
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
             label: :optional,
             name: :table_options,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end
      ),
      (
        def field_def(:partitions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitions",
             kind: :unpacked,
             label: :repeated,
             name: :partitions,
             tag: 4,
             type: {:message, ExAliyunOts.TableStore.PartitionRange}
           }}
        end

        def field_def("partitions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partitions",
             kind: :unpacked,
             label: :repeated,
             name: :partitions,
             tag: 4,
             type: {:message, ExAliyunOts.TableStore.PartitionRange}
           }}
        end

        []
      ),
      (
        def field_def(:stream_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_spec,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamSpecification}
           }}
        end

        def field_def("streamSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_spec,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamSpecification}
           }}
        end

        def field_def("stream_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_spec,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.StreamSpecification}
           }}
        end
      ),
      (
        def field_def(:sse_spec) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_spec,
             tag: 6,
             type: {:message, ExAliyunOts.TableStore.SSESpecification}
           }}
        end

        def field_def("sseSpec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_spec,
             tag: 6,
             type: {:message, ExAliyunOts.TableStore.SSESpecification}
           }}
        end

        def field_def("sse_spec") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sseSpec",
             kind: {:scalar, nil},
             label: :optional,
             name: :sse_spec,
             tag: 6,
             type: {:message, ExAliyunOts.TableStore.SSESpecification}
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end
      ),
      (
        def field_def(:enable_local_txn) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableLocalTxn",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_local_txn,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("enableLocalTxn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableLocalTxn",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_local_txn,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("enable_local_txn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableLocalTxn",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_local_txn,
             tag: 8,
             type: :bool
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
    @spec required_fields() :: [:table_meta | :reserved_throughput]
    def required_fields() do
      [:table_meta, :reserved_throughput]
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
    def default(:reserved_throughput) do
      {:ok, nil}
    end,
    def default(:table_options) do
      {:ok, nil}
    end,
    def default(:partitions) do
      {:error, :no_default_value}
    end,
    def default(:stream_spec) do
      {:ok, nil}
    end,
    def default(:sse_spec) do
      {:ok, nil}
    end,
    def default(:index_metas) do
      {:error, :no_default_value}
    end,
    def default(:enable_local_txn) do
      {:ok, false}
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
