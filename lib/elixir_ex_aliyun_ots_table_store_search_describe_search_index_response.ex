# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse do
  @moduledoc false
  defstruct schema: nil,
            sync_stat: nil,
            metering_info: nil,
            brother_index_name: nil,
            query_flow_weight: [],
            create_time: nil,
            time_to_live: nil

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
        |> encode_schema(msg)
        |> encode_sync_stat(msg)
        |> encode_metering_info(msg)
        |> encode_brother_index_name(msg)
        |> encode_query_flow_weight(msg)
        |> encode_create_time(msg)
        |> encode_time_to_live(msg)
      end
    )

    []

    [
      defp encode_schema(acc, msg) do
        try do
          case msg.schema do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_message(msg.schema)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:schema, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sync_stat(acc, msg) do
        try do
          case msg.sync_stat do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.sync_stat)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sync_stat, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_metering_info(acc, msg) do
        try do
          case msg.metering_info do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.metering_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:metering_info, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_brother_index_name(acc, msg) do
        try do
          case msg.brother_index_name do
            nil -> acc
            _ -> [acc, "\"", Protox.Encode.encode_string(msg.brother_index_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:brother_index_name, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_query_flow_weight(acc, msg) do
        try do
          case msg.query_flow_weight do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query_flow_weight, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_create_time(acc, msg) do
        try do
          case msg.create_time do
            nil -> acc
            _ -> [acc, "0", Protox.Encode.encode_int64(msg.create_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_time_to_live(acc, msg) do
        try do
          case msg.time_to_live do
            nil -> acc
            _ -> [acc, "8", Protox.Encode.encode_int32(msg.time_to_live)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:time_to_live, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 schema:
                   Protox.MergeMessage.merge(
                     msg.schema,
                     ExAliyunOts.TableStoreSearch.IndexSchema.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 sync_stat:
                   Protox.MergeMessage.merge(
                     msg.sync_stat,
                     ExAliyunOts.TableStoreSearch.SyncStat.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 metering_info:
                   Protox.MergeMessage.merge(
                     msg.metering_info,
                     ExAliyunOts.TableStoreSearch.MeteringInfo.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[brother_index_name: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 query_flow_weight:
                   msg.query_flow_weight ++
                     [ExAliyunOts.TableStoreSearch.QueryFlowWeight.decode!(delimited)]
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[create_time: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[time_to_live: value], rest}

            {tag, wire_type, rest} ->
              {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {[], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
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
        ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse,
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
        1 => {:schema, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}},
        2 => {:sync_stat, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SyncStat}},
        3 =>
          {:metering_info, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}},
        4 => {:brother_index_name, {:scalar, ""}, :string},
        5 =>
          {:query_flow_weight, :unpacked,
           {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}},
        6 => {:create_time, {:scalar, 0}, :int64},
        7 => {:time_to_live, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        brother_index_name: {4, {:scalar, ""}, :string},
        create_time: {6, {:scalar, 0}, :int64},
        metering_info: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}},
        query_flow_weight:
          {5, :unpacked, {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}},
        schema: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}},
        sync_stat: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SyncStat}},
        time_to_live: {7, {:scalar, 0}, :int32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "schema",
          kind: {:scalar, nil},
          label: :optional,
          name: :schema,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
        },
        %{
          __struct__: Protox.Field,
          json_name: "syncStat",
          kind: {:scalar, nil},
          label: :optional,
          name: :sync_stat,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
        },
        %{
          __struct__: Protox.Field,
          json_name: "meteringInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :metering_info,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "brotherIndexName",
          kind: {:scalar, ""},
          label: :optional,
          name: :brother_index_name,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "queryFlowWeight",
          kind: :unpacked,
          label: :repeated,
          name: :query_flow_weight,
          tag: 5,
          type: {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :create_time,
          tag: 6,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "timeToLive",
          kind: {:scalar, 0},
          label: :optional,
          name: :time_to_live,
          tag: 7,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:schema) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: {:scalar, nil},
             label: :optional,
             name: :schema,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
           }}
        end

        def field_def("schema") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: {:scalar, nil},
             label: :optional,
             name: :schema,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
           }}
        end

        []
      ),
      (
        def field_def(:sync_stat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end

        def field_def("syncStat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end

        def field_def("sync_stat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end
      ),
      (
        def field_def(:metering_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "meteringInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :metering_info,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}
           }}
        end

        def field_def("meteringInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "meteringInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :metering_info,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}
           }}
        end

        def field_def("metering_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "meteringInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :metering_info,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.MeteringInfo}
           }}
        end
      ),
      (
        def field_def(:brother_index_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "brotherIndexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :brother_index_name,
             tag: 4,
             type: :string
           }}
        end

        def field_def("brotherIndexName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "brotherIndexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :brother_index_name,
             tag: 4,
             type: :string
           }}
        end

        def field_def("brother_index_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "brotherIndexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :brother_index_name,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:query_flow_weight) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "queryFlowWeight",
             kind: :unpacked,
             label: :repeated,
             name: :query_flow_weight,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}
           }}
        end

        def field_def("queryFlowWeight") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "queryFlowWeight",
             kind: :unpacked,
             label: :repeated,
             name: :query_flow_weight,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}
           }}
        end

        def field_def("query_flow_weight") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "queryFlowWeight",
             kind: :unpacked,
             label: :repeated,
             name: :query_flow_weight,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.QueryFlowWeight}
           }}
        end
      ),
      (
        def field_def(:create_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :int64
           }}
        end

        def field_def("createTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :int64
           }}
        end

        def field_def("create_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :int64
           }}
        end
      ),
      (
        def field_def(:time_to_live) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("timeToLive") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 7,
             type: :int32
           }}
        end

        def field_def("time_to_live") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 7,
             type: :int32
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
    @spec required_fields() :: []
    def required_fields() do
      []
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
    def default(:schema) do
      {:ok, nil}
    end,
    def default(:sync_stat) do
      {:ok, nil}
    end,
    def default(:metering_info) do
      {:ok, nil}
    end,
    def default(:brother_index_name) do
      {:ok, ""}
    end,
    def default(:query_flow_weight) do
      {:error, :no_default_value}
    end,
    def default(:create_time) do
      {:ok, 0}
    end,
    def default(:time_to_live) do
      {:ok, 0}
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
