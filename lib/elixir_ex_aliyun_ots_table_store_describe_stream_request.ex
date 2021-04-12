# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.DescribeStreamRequest) do
  @moduledoc false
  (
    defstruct(stream_id: nil, inclusive_start_shard_id: nil, shard_limit: nil)

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
          |> encode_inclusive_start_shard_id(msg)
          |> encode_shard_limit(msg)
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
        defp(encode_inclusive_start_shard_id(acc, msg)) do
          field_value = msg.inclusive_start_shard_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_shard_limit(acc, msg)) do
          field_value = msg.shard_limit

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int32(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DescribeStreamRequest))

          case([:stream_id] -- set_fields) do
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
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:inclusive_start_shard_id, value}
                {[:inclusive_start_shard_id | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:shard_limit, value}
                {[:shard_limit | set_fields], [field], rest}

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
        2 => {:inclusive_start_shard_id, {:default, ""}, :string},
        3 => {:shard_limit, {:default, 0}, :int32}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        inclusive_start_shard_id: {2, {:default, ""}, :string},
        shard_limit: {3, {:default, 0}, :int32},
        stream_id: {1, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:stream_id]
    def(required_fields()) do
      [:stream_id]
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
      def(default(:inclusive_start_shard_id)) do
        {:ok, ""}
      end,
      def(default(:shard_limit)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end