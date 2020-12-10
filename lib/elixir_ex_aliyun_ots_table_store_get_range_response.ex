# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetRangeResponse) do
  @moduledoc false
  (
    defstruct(consumed: nil, rows: nil, next_start_primary_key: nil, next_token: nil)

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
          |> encode_consumed(msg)
          |> encode_rows(msg)
          |> encode_next_start_primary_key(msg)
          |> encode_next_token(msg)
        end
      )

      []

      [
        defp(encode_consumed(acc, msg)) do
          case(msg.consumed()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:consumed]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_rows(acc, msg)) do
          case(msg.rows()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:rows]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_next_start_primary_key(acc, msg)) do
          field_value = msg.next_start_primary_key()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_next_token(acc, msg)) do
          field_value = msg.next_token()

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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.GetRangeResponse))

          case([:consumed, :rows] -- set_fields) do
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
                value = ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                field = {:consumed, Protox.Message.merge(msg.consumed(), value)}
                {[:consumed | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:rows, value}
                {[:rows | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:next_start_primary_key, value}
                {[:next_start_primary_key | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:next_token, value}
                {[:next_token | set_fields], [field], rest}

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
        1 => {:consumed, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        2 => {:rows, {:default, ""}, :bytes},
        3 => {:next_start_primary_key, {:default, ""}, :bytes},
        4 => {:next_token, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        consumed: {1, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        next_start_primary_key: {3, {:default, ""}, :bytes},
        next_token: {4, {:default, ""}, :bytes},
        rows: {2, {:default, ""}, :bytes}
      }
    end

    []
    @spec required_fields() :: [:consumed | :rows]
    def(required_fields()) do
      [:consumed, :rows]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:consumed)) do
        {:ok, nil}
      end,
      def(default(:rows)) do
        {:ok, ""}
      end,
      def(default(:next_start_primary_key)) do
        {:ok, ""}
      end,
      def(default(:next_token)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end