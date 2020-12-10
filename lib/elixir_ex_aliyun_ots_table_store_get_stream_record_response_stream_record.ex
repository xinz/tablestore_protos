# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord) do
  @moduledoc false
  (
    defstruct(action_type: nil, record: nil)

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
          [] |> encode_action_type(msg) |> encode_record(msg)
        end
      )

      []

      [
        defp(encode_action_type(acc, msg)) do
          case(msg.action_type()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:action_type]))

            field_value ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStore.ActionType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_record(acc, msg)) do
          case(msg.record()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:record]))

            field_value ->
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
          {msg, set_fields} =
            parse_key_value(
              [],
              bytes,
              struct(ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord)
            )

          case([:action_type, :record] -- set_fields) do
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
                {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.ActionType)
                field = {:action_type, value}
                {[:action_type | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:record, value}
                {[:record | set_fields], [field], rest}

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
        1 => {:action_type, {:default, :PUT_ROW}, {:enum, ExAliyunOts.TableStore.ActionType}},
        2 => {:record, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        action_type: {1, {:default, :PUT_ROW}, {:enum, ExAliyunOts.TableStore.ActionType}},
        record: {2, {:default, ""}, :bytes}
      }
    end

    []
    @spec required_fields() :: [:action_type | :record]
    def(required_fields()) do
      [:action_type, :record]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:action_type)) do
        {:ok, :PUT_ROW}
      end,
      def(default(:record)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end