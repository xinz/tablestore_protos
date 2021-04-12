# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.RowInBatchWriteRowResponse) do
  @moduledoc false
  (
    defstruct(is_ok: nil, error: nil, consumed: nil, row: nil)

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
          [] |> encode_is_ok(msg) |> encode_error(msg) |> encode_consumed(msg) |> encode_row(msg)
        end
      )

      []

      [
        defp(encode_is_ok(acc, msg)) do
          case(msg.is_ok) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:is_ok]))

            field_value ->
              [acc, "\b", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_error(acc, msg)) do
          field_value = msg.error

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_consumed(acc, msg)) do
          field_value = msg.consumed

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_row(acc, msg)) do
          field_value = msg.row

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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.RowInBatchWriteRowResponse))

          case([:is_ok] -- set_fields) do
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
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:is_ok, value}
                {[:is_ok | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.Error.decode!(delimited)
                field = {:error, Protox.Message.merge(msg.error, value)}
                {[:error | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                field = {:consumed, Protox.Message.merge(msg.consumed, value)}
                {[:consumed | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:row, value}
                {[:row | set_fields], [field], rest}

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
        1 => {:is_ok, {:default, false}, :bool},
        2 => {:error, {:default, nil}, {:message, ExAliyunOts.TableStore.Error}},
        3 => {:consumed, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        4 => {:row, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        consumed: {3, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        error: {2, {:default, nil}, {:message, ExAliyunOts.TableStore.Error}},
        is_ok: {1, {:default, false}, :bool},
        row: {4, {:default, ""}, :bytes}
      }
    end

    []
    @spec required_fields() :: [:is_ok]
    def(required_fields()) do
      [:is_ok]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:is_ok)) do
        {:ok, false}
      end,
      def(default(:error)) do
        {:ok, nil}
      end,
      def(default(:consumed)) do
        {:ok, nil}
      end,
      def(default(:row)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end