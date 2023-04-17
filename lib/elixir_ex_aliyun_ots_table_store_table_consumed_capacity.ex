# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.TableConsumedCapacity do
  @moduledoc false
  defstruct table_name: nil, consumed: nil, reserved_throughput: nil, is_timeseries_meta: nil

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
        |> encode_table_name(msg)
        |> encode_consumed(msg)
        |> encode_reserved_throughput(msg)
        |> encode_is_timeseries_meta(msg)
      end
    )

    []

    [
      defp encode_table_name(acc, msg) do
        try do
          case msg.table_name do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_string(msg.table_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:table_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_consumed(acc, msg) do
        try do
          case msg.consumed do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.consumed)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:consumed, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reserved_throughput(acc, msg) do
        try do
          case msg.reserved_throughput do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.reserved_throughput)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reserved_throughput, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_timeseries_meta(acc, msg) do
        try do
          case msg.is_timeseries_meta do
            nil -> acc
            _ -> [acc, " ", Protox.Encode.encode_bool(msg.is_timeseries_meta)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_timeseries_meta, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.TableConsumedCapacity))
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
              {[table_name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 consumed:
                   Protox.MergeMessage.merge(
                     msg.consumed,
                     ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 reserved_throughput:
                   Protox.MergeMessage.merge(
                     msg.reserved_throughput,
                     ExAliyunOts.TableStore.ReservedThroughput.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_timeseries_meta: value], rest}

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
        ExAliyunOts.TableStore.TableConsumedCapacity,
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
        1 => {:table_name, {:scalar, ""}, :string},
        2 => {:consumed, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        3 =>
          {:reserved_throughput, {:scalar, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        4 => {:is_timeseries_meta, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        consumed: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        is_timeseries_meta: {4, {:scalar, false}, :bool},
        reserved_throughput:
          {3, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        table_name: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :optional,
          name: :table_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "consumed",
          kind: {:scalar, nil},
          label: :optional,
          name: :consumed,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
        },
        %{
          __struct__: Protox.Field,
          json_name: "reservedThroughput",
          kind: {:scalar, nil},
          label: :optional,
          name: :reserved_throughput,
          tag: 3,
          type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isTimeseriesMeta",
          kind: {:scalar, false},
          label: :optional,
          name: :is_timeseries_meta,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:table_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("tableName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("table_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:consumed) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumed",
             kind: {:scalar, nil},
             label: :optional,
             name: :consumed,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
           }}
        end

        def field_def("consumed") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumed",
             kind: {:scalar, nil},
             label: :optional,
             name: :consumed,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
           }}
        end

        []
      ),
      (
        def field_def(:reserved_throughput) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :optional,
             name: :reserved_throughput,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
           }}
        end

        def field_def("reservedThroughput") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :optional,
             name: :reserved_throughput,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
           }}
        end

        def field_def("reserved_throughput") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughput",
             kind: {:scalar, nil},
             label: :optional,
             name: :reserved_throughput,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughput}
           }}
        end
      ),
      (
        def field_def(:is_timeseries_meta) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTimeseriesMeta",
             kind: {:scalar, false},
             label: :optional,
             name: :is_timeseries_meta,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("isTimeseriesMeta") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTimeseriesMeta",
             kind: {:scalar, false},
             label: :optional,
             name: :is_timeseries_meta,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("is_timeseries_meta") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isTimeseriesMeta",
             kind: {:scalar, false},
             label: :optional,
             name: :is_timeseries_meta,
             tag: 4,
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
    def default(:table_name) do
      {:ok, ""}
    end,
    def default(:consumed) do
      {:ok, nil}
    end,
    def default(:reserved_throughput) do
      {:ok, nil}
    end,
    def default(:is_timeseries_meta) do
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
