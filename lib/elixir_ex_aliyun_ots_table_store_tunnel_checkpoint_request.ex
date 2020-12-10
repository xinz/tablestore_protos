# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.CheckpointRequest) do
  @moduledoc false
  (
    defstruct(
      tunnel_id: nil,
      client_id: nil,
      channel_id: nil,
      checkpoint: nil,
      sequence_number: nil
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
          |> encode_tunnel_id(msg)
          |> encode_client_id(msg)
          |> encode_channel_id(msg)
          |> encode_checkpoint(msg)
          |> encode_sequence_number(msg)
        end
      )

      []

      [
        defp(encode_tunnel_id(acc, msg)) do
          case(msg.tunnel_id()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_id]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_client_id(acc, msg)) do
          case(msg.client_id()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:client_id]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_channel_id(acc, msg)) do
          case(msg.channel_id()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:channel_id]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_checkpoint(acc, msg)) do
          case(msg.checkpoint()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:checkpoint]))

            field_value ->
              [acc, "\"", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_sequence_number(acc, msg)) do
          case(msg.sequence_number()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:sequence_number]))

            field_value ->
              [acc, "(", Protox.Encode.encode_int64(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.CheckpointRequest))

          case(
            [:tunnel_id, :client_id, :channel_id, :checkpoint, :sequence_number] -- set_fields
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
                field = {:tunnel_id, value}
                {[:tunnel_id | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:client_id, value}
                {[:client_id | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:channel_id, value}
                {[:channel_id | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:checkpoint, value}
                {[:checkpoint | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:sequence_number, value}
                {[:sequence_number | set_fields], [field], rest}

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
        1 => {:tunnel_id, {:default, ""}, :string},
        2 => {:client_id, {:default, ""}, :string},
        3 => {:channel_id, {:default, ""}, :string},
        4 => {:checkpoint, {:default, ""}, :string},
        5 => {:sequence_number, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_id: {3, {:default, ""}, :string},
        checkpoint: {4, {:default, ""}, :string},
        client_id: {2, {:default, ""}, :string},
        sequence_number: {5, {:default, 0}, :int64},
        tunnel_id: {1, {:default, ""}, :string}
      }
    end

    []

    @spec required_fields() :: [
            (((:tunnel_id | :client_id) | :channel_id) | :checkpoint) | :sequence_number
          ]
    def(required_fields()) do
      [:tunnel_id, :client_id, :channel_id, :checkpoint, :sequence_number]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:tunnel_id)) do
        {:ok, ""}
      end,
      def(default(:client_id)) do
        {:ok, ""}
      end,
      def(default(:channel_id)) do
        {:ok, ""}
      end,
      def(default(:checkpoint)) do
        {:ok, ""}
      end,
      def(default(:sequence_number)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end