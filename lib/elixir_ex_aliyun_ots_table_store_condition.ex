# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.Condition) do
  @moduledoc false
  (
    defstruct(row_existence: nil, column_condition: nil)

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
          [] |> encode_row_existence(msg) |> encode_column_condition(msg)
        end
      )

      []

      [
        defp(encode_row_existence(acc, msg)) do
          case(msg.row_existence()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:row_existence]))

            field_value ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStore.RowExistenceExpectation.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_column_condition(acc, msg)) do
          field_value = msg.column_condition()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_bytes(field_value)]
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
          {msg, set_fields} = parse_key_value([], bytes, struct(ExAliyunOts.TableStore.Condition))

          case([:row_existence] -- set_fields) do
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
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.RowExistenceExpectation)

                field = {:row_existence, value}
                {[:row_existence | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:column_condition, value}
                {[:column_condition | set_fields], [field], rest}

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
        1 =>
          {:row_existence, {:default, :IGNORE},
           {:enum, ExAliyunOts.TableStore.RowExistenceExpectation}},
        2 => {:column_condition, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        column_condition: {2, {:default, ""}, :bytes},
        row_existence:
          {1, {:default, :IGNORE}, {:enum, ExAliyunOts.TableStore.RowExistenceExpectation}}
      }
    end

    []
    @spec required_fields() :: [:row_existence]
    def(required_fields()) do
      [:row_existence]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:row_existence)) do
        {:ok, :IGNORE}
      end,
      def(default(:column_condition)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end