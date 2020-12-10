# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.IndexSetting) do
  @moduledoc false
  (
    defstruct(number_of_shards: nil, routing_fields: [], routing_partition_size: nil)

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
          |> encode_number_of_shards(msg)
          |> encode_routing_fields(msg)
          |> encode_routing_partition_size(msg)
        end
      )

      []

      [
        defp(encode_number_of_shards(acc, msg)) do
          field_value = msg.number_of_shards()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_routing_fields(acc, msg)) do
          case(msg.routing_fields()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_string(value)]
                end)
              ]
          end
        end,
        defp(encode_routing_partition_size(acc, msg)) do
          field_value = msg.routing_partition_size()

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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.IndexSetting))
        end
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:number_of_shards, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:routing_fields, msg.routing_fields() ++ List.wrap(value)}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:routing_partition_size, value}
                {[field], rest}

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

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:number_of_shards, {:default, 0}, :int32},
        2 => {:routing_fields, :unpacked, :string},
        3 => {:routing_partition_size, {:default, 0}, :int32}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        number_of_shards: {1, {:default, 0}, :int32},
        routing_fields: {2, :unpacked, :string},
        routing_partition_size: {3, {:default, 0}, :int32}
      }
    end

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
      def(default(:number_of_shards)) do
        {:ok, 0}
      end,
      def(default(:routing_fields)) do
        {:error, :no_default_value}
      end,
      def(default(:routing_partition_size)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end