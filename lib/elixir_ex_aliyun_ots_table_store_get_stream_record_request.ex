# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetStreamRecordRequest) do
  @moduledoc false
  (
    defstruct(shard_iterator: nil, limit: nil)

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
          [] |> encode_shard_iterator(msg) |> encode_limit(msg)
        end
      )

      []

      [
        defp(encode_shard_iterator(acc, msg)) do
          case(msg.shard_iterator) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:shard_iterator]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_limit(acc, msg)) do
          field_value = msg.limit

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.GetStreamRecordRequest))

          case([:shard_iterator] -- set_fields) do
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
                field = {:shard_iterator, value}
                {[:shard_iterator | set_fields], [field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:limit, value}
                {[:limit | set_fields], [field], rest}

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
      %{1 => {:shard_iterator, {:default, ""}, :string}, 2 => {:limit, {:default, 0}, :int32}}
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{limit: {2, {:default, 0}, :int32}, shard_iterator: {1, {:default, ""}, :string}}
    end

    []
    @spec required_fields() :: [:shard_iterator]
    def(required_fields()) do
      [:shard_iterator]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:shard_iterator)) do
        {:ok, ""}
      end,
      def(default(:limit)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end