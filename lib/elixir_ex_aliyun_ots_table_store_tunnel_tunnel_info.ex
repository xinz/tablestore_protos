# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.TunnelInfo) do
  @moduledoc false
  (
    defstruct(
      tunnel_id: nil,
      tunnel_type: nil,
      table_name: nil,
      instance_name: nil,
      stream_id: nil,
      stage: nil,
      expired: nil,
      tunnel_name: nil,
      public: nil
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
          |> encode_tunnel_type(msg)
          |> encode_table_name(msg)
          |> encode_instance_name(msg)
          |> encode_stream_id(msg)
          |> encode_stage(msg)
          |> encode_expired(msg)
          |> encode_tunnel_name(msg)
          |> encode_public(msg)
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
        defp(encode_tunnel_type(acc, msg)) do
          case(msg.tunnel_type()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_type]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_instance_name(acc, msg)) do
          case(msg.instance_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:instance_name]))

            field_value ->
              [acc, "\"", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_stream_id(acc, msg)) do
          case(msg.stream_id()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:stream_id]))

            field_value ->
              [acc, "*", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_stage(acc, msg)) do
          case(msg.stage()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:stage]))

            field_value ->
              [acc, "2", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_expired(acc, msg)) do
          field_value = msg.expired()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "8", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_tunnel_name(acc, msg)) do
          field_value = msg.tunnel_name()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "B", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_public(acc, msg)) do
          field_value = msg.public()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "H", Protox.Encode.encode_bool(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.TunnelInfo))

          case(
            [:tunnel_id, :tunnel_type, :table_name, :instance_name, :stream_id, :stage] --
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
                field = {:tunnel_id, value}
                {[:tunnel_id | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:tunnel_type, value}
                {[:tunnel_type | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:table_name, value}
                {[:table_name | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:instance_name, value}
                {[:instance_name | set_fields], [field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:stream_id, value}
                {[:stream_id | set_fields], [field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:stage, value}
                {[:stage | set_fields], [field], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:expired, value}
                {[:expired | set_fields], [field], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:tunnel_name, value}
                {[:tunnel_name | set_fields], [field], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:public, value}
                {[:public | set_fields], [field], rest}

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
        2 => {:tunnel_type, {:default, ""}, :string},
        3 => {:table_name, {:default, ""}, :string},
        4 => {:instance_name, {:default, ""}, :string},
        5 => {:stream_id, {:default, ""}, :string},
        6 => {:stage, {:default, ""}, :string},
        7 => {:expired, {:default, false}, :bool},
        8 => {:tunnel_name, {:default, ""}, :string},
        9 => {:public, {:default, false}, :bool}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        expired: {7, {:default, false}, :bool},
        instance_name: {4, {:default, ""}, :string},
        public: {9, {:default, false}, :bool},
        stage: {6, {:default, ""}, :string},
        stream_id: {5, {:default, ""}, :string},
        table_name: {3, {:default, ""}, :string},
        tunnel_id: {1, {:default, ""}, :string},
        tunnel_name: {8, {:default, ""}, :string},
        tunnel_type: {2, {:default, ""}, :string}
      }
    end

    []

    @spec required_fields() :: [
            ((((:tunnel_id | :tunnel_type) | :table_name) | :instance_name) | :stream_id) | :stage
          ]
    def(required_fields()) do
      [:tunnel_id, :tunnel_type, :table_name, :instance_name, :stream_id, :stage]
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
      def(default(:tunnel_type)) do
        {:ok, ""}
      end,
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:instance_name)) do
        {:ok, ""}
      end,
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:stage)) do
        {:ok, ""}
      end,
      def(default(:expired)) do
        {:ok, false}
      end,
      def(default(:tunnel_name)) do
        {:ok, ""}
      end,
      def(default(:public)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end