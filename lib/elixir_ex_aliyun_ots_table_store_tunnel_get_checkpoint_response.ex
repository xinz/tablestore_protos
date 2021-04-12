# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.GetCheckpointResponse) do
  @moduledoc false
  (
    defstruct(checkpoint: nil, sequence_number: nil)

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
          [] |> encode_checkpoint(msg) |> encode_sequence_number(msg)
        end
      )

      []

      [
        defp(encode_checkpoint(acc, msg)) do
          case(msg.checkpoint) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:checkpoint]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_sequence_number(acc, msg)) do
          case(msg.sequence_number) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:sequence_number]))

            field_value ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.GetCheckpointResponse))

          case([:checkpoint, :sequence_number] -- set_fields) do
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
                field = {:checkpoint, value}
                {[:checkpoint | set_fields], [field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:sequence_number, value}
                {[:sequence_number | set_fields], [field], rest}

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
        1 => {:checkpoint, {:default, ""}, :string},
        2 => {:sequence_number, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{checkpoint: {1, {:default, ""}, :string}, sequence_number: {2, {:default, 0}, :int64}}
    end

    []
    @spec required_fields() :: [:checkpoint | :sequence_number]
    def(required_fields()) do
      [:checkpoint, :sequence_number]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:checkpoint)) do
        {:ok, ""}
      end,
      def(default(:sequence_number)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end