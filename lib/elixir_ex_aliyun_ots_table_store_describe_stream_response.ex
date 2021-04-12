# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.DescribeStreamResponse) do
  @moduledoc false
  (
    defstruct(
      stream_id: nil,
      expiration_time: nil,
      table_name: nil,
      creation_time: nil,
      stream_status: nil,
      shards: [],
      next_shard_id: nil
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
          |> encode_stream_id(msg)
          |> encode_expiration_time(msg)
          |> encode_table_name(msg)
          |> encode_creation_time(msg)
          |> encode_stream_status(msg)
          |> encode_shards(msg)
          |> encode_next_shard_id(msg)
        end
      )

      []

      [
        defp(encode_stream_id(acc, msg)) do
          case(msg.stream_id) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:stream_id]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_expiration_time(acc, msg)) do
          case(msg.expiration_time) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:expiration_time]))

            field_value ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_creation_time(acc, msg)) do
          case(msg.creation_time) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:creation_time]))

            field_value ->
              [acc, " ", Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_stream_status(acc, msg)) do
          case(msg.stream_status) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:stream_status]))

            field_value ->
              [
                acc,
                "(",
                field_value
                |> ExAliyunOts.TableStore.StreamStatus.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_shards(acc, msg)) do
          case(msg.shards) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_next_shard_id(acc, msg)) do
          field_value = msg.next_shard_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, ":", Protox.Encode.encode_string(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DescribeStreamResponse))

          case(
            [:stream_id, :expiration_time, :table_name, :creation_time, :stream_status] --
              set_fields
          ) do
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
                value = delimited
                field = {:stream_id, value}
                {[:stream_id | set_fields], [field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:expiration_time, value}
                {[:expiration_time | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:table_name, value}
                {[:table_name | set_fields], [field], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:creation_time, value}
                {[:creation_time | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.StreamStatus)

                field = {:stream_status, value}
                {[:stream_status | set_fields], [field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.StreamShard.decode!(delimited)
                field = {:shards, msg.shards ++ List.wrap(value)}
                {[:shards | set_fields], [field], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:next_shard_id, value}
                {[:next_shard_id | set_fields], [field], rest}

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
        1 => {:stream_id, {:default, ""}, :string},
        2 => {:expiration_time, {:default, 0}, :int32},
        3 => {:table_name, {:default, ""}, :string},
        4 => {:creation_time, {:default, 0}, :int64},
        5 =>
          {:stream_status, {:default, :STREAM_ENABLING},
           {:enum, ExAliyunOts.TableStore.StreamStatus}},
        6 => {:shards, :unpacked, {:message, ExAliyunOts.TableStore.StreamShard}},
        7 => {:next_shard_id, {:default, ""}, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        creation_time: {4, {:default, 0}, :int64},
        expiration_time: {2, {:default, 0}, :int32},
        next_shard_id: {7, {:default, ""}, :string},
        shards: {6, :unpacked, {:message, ExAliyunOts.TableStore.StreamShard}},
        stream_id: {1, {:default, ""}, :string},
        stream_status:
          {5, {:default, :STREAM_ENABLING}, {:enum, ExAliyunOts.TableStore.StreamStatus}},
        table_name: {3, {:default, ""}, :string}
      }
    end

    []

    @spec required_fields() :: [
            (((:stream_id | :expiration_time) | :table_name) | :creation_time) | :stream_status
          ]
    def(required_fields()) do
      [:stream_id, :expiration_time, :table_name, :creation_time, :stream_status]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:expiration_time)) do
        {:ok, 0}
      end,
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:creation_time)) do
        {:ok, 0}
      end,
      def(default(:stream_status)) do
        {:ok, :STREAM_ENABLING}
      end,
      def(default(:shards)) do
        {:error, :no_default_value}
      end,
      def(default(:next_shard_id)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end