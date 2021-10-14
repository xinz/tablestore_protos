# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetStreamRecordResponse) do
  @moduledoc false
  (
    defstruct(stream_records: [], next_shard_iterator: nil)

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
          [] |> encode_stream_records(msg) |> encode_next_shard_iterator(msg)
        end
      )

      []

      [
        defp(encode_stream_records(acc, msg)) do
          try do
            case(msg.stream_records) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\n", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:stream_records, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_next_shard_iterator(acc, msg)) do
          try do
            case(msg.next_shard_iterator) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.next_shard_iterator)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:next_shard_iterator, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.GetStreamRecordResponse))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   stream_records:
                     msg.stream_records ++
                       [
                         ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord.decode!(
                           delimited
                         )
                       ]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[next_shard_iterator: delimited], rest}

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
          ExAliyunOts.TableStore.GetStreamRecordResponse,
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
          {:stream_records, :unpacked,
           {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}},
        2 => {:next_shard_iterator, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        next_shard_iterator: {2, {:scalar, ""}, :string},
        stream_records:
          {1, :unpacked, {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "streamRecords",
          kind: :unpacked,
          label: :repeated,
          name: :stream_records,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nextShardIterator",
          kind: {:scalar, ""},
          label: :optional,
          name: :next_shard_iterator,
          tag: 2,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:stream_records)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamRecords",
             kind: :unpacked,
             label: :repeated,
             name: :stream_records,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}
           }}
        end

        def(field_def("streamRecords")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamRecords",
             kind: :unpacked,
             label: :repeated,
             name: :stream_records,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}
           }}
        end

        def(field_def("stream_records")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamRecords",
             kind: :unpacked,
             label: :repeated,
             name: :stream_records,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord}
           }}
        end
      ),
      (
        def(field_def(:next_shard_iterator)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextShardIterator",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_shard_iterator,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("nextShardIterator")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextShardIterator",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_shard_iterator,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("next_shard_iterator")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextShardIterator",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_shard_iterator,
             tag: 2,
             type: :string
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:stream_records)) do
        {:error, :no_default_value}
      end,
      def(default(:next_shard_iterator)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end