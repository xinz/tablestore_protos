# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.UpdateRowRequest) do
  @moduledoc false
  (
    defstruct(
      table_name: nil,
      row_change: nil,
      condition: nil,
      return_content: nil,
      transaction_id: nil
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
          |> encode_table_name(msg)
          |> encode_row_change(msg)
          |> encode_condition(msg)
          |> encode_return_content(msg)
          |> encode_transaction_id(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_row_change(acc, msg)) do
          case(msg.row_change) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:row_change]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_condition(acc, msg)) do
          case(msg.condition) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:condition]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_return_content(acc, msg)) do
          field_value = msg.return_content

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_transaction_id(acc, msg)) do
          field_value = msg.transaction_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "*", Protox.Encode.encode_string(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.UpdateRowRequest))

          case([:table_name, :row_change, :condition] -- set_fields) do
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

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:row_change, value}
                {[:row_change | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.Condition.decode!(delimited)
                field = {:condition, Protox.Message.merge(msg.condition, value)}
                {[:condition | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.ReturnContent.decode!(delimited)
                field = {:return_content, Protox.Message.merge(msg.return_content, value)}
                {[:return_content | set_fields], [field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:transaction_id, value}
                {[:transaction_id | set_fields], [field], rest}

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
        2 => {:row_change, {:default, ""}, :bytes},
        3 => {:condition, {:default, nil}, {:message, ExAliyunOts.TableStore.Condition}},
        4 => {:return_content, {:default, nil}, {:message, ExAliyunOts.TableStore.ReturnContent}},
        5 => {:transaction_id, {:default, ""}, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        condition: {3, {:default, nil}, {:message, ExAliyunOts.TableStore.Condition}},
        return_content: {4, {:default, nil}, {:message, ExAliyunOts.TableStore.ReturnContent}},
        row_change: {2, {:default, ""}, :bytes},
        table_name: {1, {:default, ""}, :string},
        transaction_id: {5, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [(:table_name | :row_change) | :condition]
    def(required_fields()) do
      [:table_name, :row_change, :condition]
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
      def(default(:row_change)) do
        {:ok, ""}
      end,
      def(default(:condition)) do
        {:ok, nil}
      end,
      def(default(:return_content)) do
        {:ok, nil}
      end,
      def(default(:transaction_id)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end