# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ChannelInfo) do
  @moduledoc false
  (
    defstruct(
      channel_id: nil,
      channel_type: nil,
      channel_status: nil,
      client_id: nil,
      channel_rpo: nil,
      channel_count: nil
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
          |> encode_channel_id(msg)
          |> encode_channel_type(msg)
          |> encode_channel_status(msg)
          |> encode_client_id(msg)
          |> encode_channel_rpo(msg)
          |> encode_channel_count(msg)
        end
      )

      []

      [
        defp(encode_channel_id(acc, msg)) do
          case(msg.channel_id) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:channel_id]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_channel_type(acc, msg)) do
          field_value = msg.channel_type

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_channel_status(acc, msg)) do
          field_value = msg.channel_status

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_client_id(acc, msg)) do
          field_value = msg.client_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_channel_rpo(acc, msg)) do
          field_value = msg.channel_rpo

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_channel_count(acc, msg)) do
          field_value = msg.channel_count

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "0", Protox.Encode.encode_int64(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.ChannelInfo))

          case([:channel_id] -- set_fields) do
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
                field = {:channel_id, value}
                {[:channel_id | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:channel_type, value}
                {[:channel_type | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:channel_status, value}
                {[:channel_status | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:client_id, value}
                {[:client_id | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:channel_rpo, value}
                {[:channel_rpo | set_fields], [field], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:channel_count, value}
                {[:channel_count | set_fields], [field], rest}

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
        1 => {:channel_id, {:default, ""}, :string},
        2 => {:channel_type, {:default, ""}, :string},
        3 => {:channel_status, {:default, ""}, :string},
        4 => {:client_id, {:default, ""}, :string},
        5 => {:channel_rpo, {:default, 0}, :int64},
        6 => {:channel_count, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_count: {6, {:default, 0}, :int64},
        channel_id: {1, {:default, ""}, :string},
        channel_rpo: {5, {:default, 0}, :int64},
        channel_status: {3, {:default, ""}, :string},
        channel_type: {2, {:default, ""}, :string},
        client_id: {4, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:channel_id]
    def(required_fields()) do
      [:channel_id]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:channel_id)) do
        {:ok, ""}
      end,
      def(default(:channel_type)) do
        {:ok, ""}
      end,
      def(default(:channel_status)) do
        {:ok, ""}
      end,
      def(default(:client_id)) do
        {:ok, ""}
      end,
      def(default(:channel_rpo)) do
        {:ok, 0}
      end,
      def(default(:channel_count)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end