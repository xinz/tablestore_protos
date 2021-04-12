# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.ColumnsToGet) do
  @moduledoc false
  (
    defstruct(return_type: nil, column_names: [])

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
          [] |> encode_return_type(msg) |> encode_column_names(msg)
        end
      )

      []

      [
        defp(encode_return_type(acc, msg)) do
          field_value = msg.return_type

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStoreSearch.ColumnReturnType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_column_names(acc, msg)) do
          case(msg.column_names) do
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.ColumnsToGet))
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
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.ColumnReturnType)

                field = {:return_type, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:column_names, msg.column_names ++ List.wrap(value)}
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
        1 =>
          {:return_type, {:default, :RETURN_ALL},
           {:enum, ExAliyunOts.TableStoreSearch.ColumnReturnType}},
        2 => {:column_names, :unpacked, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        column_names: {2, :unpacked, :string},
        return_type:
          {1, {:default, :RETURN_ALL}, {:enum, ExAliyunOts.TableStoreSearch.ColumnReturnType}}
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
      def(default(:return_type)) do
        {:ok, :RETURN_ALL}
      end,
      def(default(:column_names)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end