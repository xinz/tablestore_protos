# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.UpdateTableResponse) do
  @moduledoc false
  (
    defstruct(reserved_throughput_details: nil, table_options: nil, stream_details: nil)

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_reserved_throughput_details(msg)
          |> encode_table_options(msg)
          |> encode_stream_details(msg)
        end
      )

      []

      [
        defp(encode_reserved_throughput_details(acc, msg)) do
          try do
            case(msg.reserved_throughput_details) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:reserved_throughput_details]))

              _ ->
                [acc, "\n", Protox.Encode.encode_message(msg.reserved_throughput_details)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:reserved_throughput_details, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_table_options(acc, msg)) do
          try do
            case(msg.table_options) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:table_options]))

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.table_options)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:table_options, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_stream_details(acc, msg)) do
          try do
            case(msg.stream_details) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_message(msg.stream_details)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:stream_details, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      []
    )

    (
      (
        @spec decode(binary) :: {:ok, struct} | {:error, any}
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            {msg, set_fields} =
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.UpdateTableResponse))

            case([:reserved_throughput_details, :table_options] -- set_fields) do
              [] ->
                msg

              missing_fields ->
                raise(Protox.RequiredFieldsError.new(missing_fields))
            end
          end
        )
      )

      (
        @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
        defp(parse_key_value(set_fields, <<>>, msg)) do
          {msg, set_fields}
        end

        defp(parse_key_value(set_fields, bytes, msg)) do
          {new_set_fields, field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:reserved_throughput_details | set_fields],
                 [
                   reserved_throughput_details:
                     Protox.Message.merge(
                       msg.reserved_throughput_details,
                       ExAliyunOts.TableStore.ReservedThroughputDetails.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:table_options | set_fields],
                 [
                   table_options:
                     Protox.Message.merge(
                       msg.table_options,
                       ExAliyunOts.TableStore.TableOptions.decode!(delimited)
                     )
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:stream_details | set_fields],
                 [
                   stream_details:
                     Protox.Message.merge(
                       msg.stream_details,
                       ExAliyunOts.TableStore.StreamDetails.decode!(delimited)
                     )
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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: iodata() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStore.UpdateTableResponse,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 =>
          {:reserved_throughput_details, {:scalar, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        2 => {:table_options, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        3 => {:stream_details, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        reserved_throughput_details:
          {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        stream_details: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        table_options: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TableOptions}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "reservedThroughputDetails",
          kind: {:scalar, nil},
          label: :required,
          name: :reserved_throughput_details,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableOptions",
          kind: {:scalar, nil},
          label: :required,
          name: :table_options,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.TableOptions}
        },
        %{
          __struct__: Protox.Field,
          json_name: "streamDetails",
          kind: {:scalar, nil},
          label: :optional,
          name: :stream_details,
          tag: 3,
          type: {:message, ExAliyunOts.TableStore.StreamDetails}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:reserved_throughput_details)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end

        def(field_def("reservedThroughputDetails")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end

        def(field_def("reserved_throughput_details")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedThroughputDetails",
             kind: {:scalar, nil},
             label: :required,
             name: :reserved_throughput_details,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}
           }}
        end
      ),
      (
        def(field_def(:table_options)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end

        def(field_def("tableOptions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end

        def(field_def("table_options")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableOptions",
             kind: {:scalar, nil},
             label: :required,
             name: :table_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.TableOptions}
           }}
        end
      ),
      (
        def(field_def(:stream_details)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end

        def(field_def("streamDetails")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end

        def(field_def("stream_details")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamDetails",
             kind: {:scalar, nil},
             label: :optional,
             name: :stream_details,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.StreamDetails}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:reserved_throughput_details | :table_options]
    def(required_fields()) do
      [:reserved_throughput_details, :table_options]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:reserved_throughput_details)) do
        {:ok, nil}
      end,
      def(default(:table_options)) do
        {:ok, nil}
      end,
      def(default(:stream_details)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end