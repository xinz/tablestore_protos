# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ReadRecordsRequest) do
  @moduledoc false
  (
    defstruct(tunnel_id: nil, client_id: nil, channel_id: nil, token: nil)

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
          |> encode_token(msg)
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
        defp(encode_token(acc, msg)) do
          case(msg.token()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:token]))

            field_value ->
              [acc, "\"", Protox.Encode.encode_string(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.ReadRecordsRequest))

          case([:tunnel_id, :client_id, :channel_id, :token] -- set_fields) do
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
                field = {:token, value}
                {[:token | set_fields], [field], rest}

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
        4 => {:token, {:default, ""}, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_id: {3, {:default, ""}, :string},
        client_id: {2, {:default, ""}, :string},
        token: {4, {:default, ""}, :string},
        tunnel_id: {1, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [((:tunnel_id | :client_id) | :channel_id) | :token]
    def(required_fields()) do
      [:tunnel_id, :client_id, :channel_id, :token]
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
      def(default(:token)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end