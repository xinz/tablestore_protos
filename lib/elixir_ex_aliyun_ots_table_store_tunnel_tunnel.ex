# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.Tunnel) do
  @moduledoc false
  (
    defstruct(table_name: nil, tunnel_name: nil, tunnel_type: nil)

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
          [] |> encode_table_name(msg) |> encode_tunnel_name(msg) |> encode_tunnel_type(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_tunnel_name(acc, msg)) do
          case(msg.tunnel_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_name]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_tunnel_type(acc, msg)) do
          case(msg.tunnel_type()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_type]))

            field_value ->
              [
                acc,
                " ",
                field_value
                |> ExAliyunOts.TableStoreTunnel.TunnelType.encode()
                |> Protox.Encode.encode_enum()
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.Tunnel))

          case([:table_name, :tunnel_name, :tunnel_type] -- set_fields) do
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
                field = {:table_name, value}
                {[:table_name | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:tunnel_name, value}
                {[:tunnel_name | set_fields], [field], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreTunnel.TunnelType)

                field = {:tunnel_type, value}
                {[:tunnel_type | set_fields], [field], rest}

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
        1 => {:table_name, {:default, ""}, :string},
        3 => {:tunnel_name, {:default, ""}, :string},
        4 =>
          {:tunnel_type, {:default, :BaseData}, {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        table_name: {1, {:default, ""}, :string},
        tunnel_name: {3, {:default, ""}, :string},
        tunnel_type: {4, {:default, :BaseData}, {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}}
      }
    end

    []
    @spec required_fields() :: [(:table_name | :tunnel_name) | :tunnel_type]
    def(required_fields()) do
      [:table_name, :tunnel_name, :tunnel_type]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:tunnel_name)) do
        {:ok, ""}
      end,
      def(default(:tunnel_type)) do
        {:ok, :BaseData}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end