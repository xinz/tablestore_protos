# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.DefinedColumnSchema) do
  @moduledoc false
  (
    defstruct(name: nil, type: nil)

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
          [] |> encode_name(msg) |> encode_type(msg)
        end
      )

      []

      [
        defp(encode_name(acc, msg)) do
          case(msg.name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_type(acc, msg)) do
          case(msg.type) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:type]))

            field_value ->
              [
                acc,
                <<16>>,
                field_value
                |> ExAliyunOts.TableStore.DefinedColumnType.encode()
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DefinedColumnSchema))

          case([:name, :type] -- set_fields) do
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
                field = {:name, value}
                {[:name | set_fields], [field], rest}

              {2, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.DefinedColumnType)

                field = {:type, value}
                {[:type | set_fields], [field], rest}

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
        1 => {:name, {:default, ""}, :string},
        2 => {:type, {:default, :DCT_INTEGER}, {:enum, ExAliyunOts.TableStore.DefinedColumnType}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        name: {1, {:default, ""}, :string},
        type: {2, {:default, :DCT_INTEGER}, {:enum, ExAliyunOts.TableStore.DefinedColumnType}}
      }
    end

    []
    @spec required_fields() :: [:name | :type]
    def(required_fields()) do
      [:name, :type]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:name)) do
        {:ok, ""}
      end,
      def(default(:type)) do
        {:ok, :DCT_INTEGER}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end