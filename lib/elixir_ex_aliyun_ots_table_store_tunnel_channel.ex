# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.Channel) do
  @moduledoc false
  (
    defstruct(channel_id: nil, version: nil, status: nil, detail: nil)

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
          |> encode_version(msg)
          |> encode_status(msg)
          |> encode_detail(msg)
        end
      )

      []

      [
        defp(encode_channel_id(acc, msg)) do
          case(msg.channel_id()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:channel_id]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_version(acc, msg)) do
          case(msg.version()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:version]))

            field_value ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_status(acc, msg)) do
          case(msg.status()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:status]))

            field_value ->
              [
                acc,
                <<24>>,
                field_value
                |> ExAliyunOts.TableStoreTunnel.ChannelStatus.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_detail(acc, msg)) do
          field_value = msg.detail()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_bytes(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.Channel))

          case([:channel_id, :version, :status] -- set_fields) do
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
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:version, value}
                {[:version | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreTunnel.ChannelStatus)

                field = {:status, value}
                {[:status | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:detail, value}
                {[:detail | set_fields], [field], rest}

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
        2 => {:version, {:default, 0}, :int64},
        3 => {:status, {:default, :OPEN}, {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}},
        4 => {:detail, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_id: {1, {:default, ""}, :string},
        detail: {4, {:default, ""}, :bytes},
        status: {3, {:default, :OPEN}, {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}},
        version: {2, {:default, 0}, :int64}
      }
    end

    []
    @spec required_fields() :: [(:channel_id | :version) | :status]
    def(required_fields()) do
      [:channel_id, :version, :status]
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
      def(default(:version)) do
        {:ok, 0}
      end,
      def(default(:status)) do
        {:ok, :OPEN}
      end,
      def(default(:detail)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end