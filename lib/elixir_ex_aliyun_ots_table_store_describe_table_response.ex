# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.DescribeTableResponse) do
  @moduledoc false
  (
    defstruct(
      table_meta: nil,
      reserved_throughput_details: nil,
      table_options: nil,
      stream_details: nil,
      shard_splits: [],
      index_metas: []
    )

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_table_meta(msg)
          |> encode_reserved_throughput_details(msg)
          |> encode_table_options(msg)
          |> encode_stream_details(msg)
          |> encode_shard_splits(msg)
          |> encode_index_metas(msg)
        end
      )

      []

      [
        defp(encode_table_meta(acc, msg)) do
          case(msg.table_meta()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_meta]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_reserved_throughput_details(acc, msg)) do
          case(msg.reserved_throughput_details()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:reserved_throughput_details]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_table_options(acc, msg)) do
          case(msg.table_options()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_options]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_stream_details(acc, msg)) do
          field_value = msg.stream_details()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "*", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_shard_splits(acc, msg)) do
          case(msg.shard_splits()) do
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
        end,
        defp(encode_index_metas(acc, msg)) do
          case(msg.index_metas()) do
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
        end
      ]

      []
    )

    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def(decode!(bytes)) do
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DescribeTableResponse))

          case([:table_meta, :reserved_throughput_details, :table_options] -- set_fields) do
            [] ->
              msg

            missing_fields ->
              raise(Protox.RequiredFieldsError.new(missing_fields))
          end
        end
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
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.TableMeta.decode!(delimited)
                field = {:table_meta, Protox.Message.merge(msg.table_meta(), value)}
                {[:table_meta | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.ReservedThroughputDetails.decode!(delimited)

                field =
                  {:reserved_throughput_details,
                   Protox.Message.merge(msg.reserved_throughput_details(), value)}

                {[:reserved_throughput_details | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.TableOptions.decode!(delimited)
                field = {:table_options, Protox.Message.merge(msg.table_options(), value)}
                {[:table_options | set_fields], [field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.StreamDetails.decode!(delimited)
                field = {:stream_details, Protox.Message.merge(msg.stream_details(), value)}
                {[:stream_details | set_fields], [field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:shard_splits, msg.shard_splits() ++ List.wrap(value)}
                {[:shard_splits | set_fields], [field], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.IndexMeta.decode!(delimited)
                field = {:index_metas, msg.index_metas() ++ List.wrap(value)}
                {[:index_metas | set_fields], [field], rest}

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

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:table_meta, {:default, nil}, {:message, ExAliyunOts.TableStore.TableMeta}},
        2 =>
          {:reserved_throughput_details, {:default, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        3 => {:table_options, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        5 => {:stream_details, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        6 => {:shard_splits, :unpacked, :bytes},
        8 => {:index_metas, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        index_metas: {8, :unpacked, {:message, ExAliyunOts.TableStore.IndexMeta}},
        reserved_throughput_details:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        shard_splits: {6, :unpacked, :bytes},
        stream_details: {5, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        table_meta: {1, {:default, nil}, {:message, ExAliyunOts.TableStore.TableMeta}},
        table_options: {3, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}}
      }
    end

    []
    @spec required_fields() :: [(:table_meta | :reserved_throughput_details) | :table_options]
    def(required_fields()) do
      [:table_meta, :reserved_throughput_details, :table_options]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:table_meta)) do
        {:ok, nil}
      end,
      def(default(:reserved_throughput_details)) do
        {:ok, nil}
      end,
      def(default(:table_options)) do
        {:ok, nil}
      end,
      def(default(:stream_details)) do
        {:ok, nil}
      end,
      def(default(:shard_splits)) do
        {:error, :no_default_value}
      end,
      def(default(:index_metas)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end