# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, split_size: nil, split_size_unit_in_byte: nil)

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
          |> encode_split_size(msg)
          |> encode_split_size_unit_in_byte(msg)
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
        defp(encode_split_size(acc, msg)) do
          case(msg.split_size) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:split_size]))

            field_value ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_split_size_unit_in_byte(acc, msg)) do
          field_value = msg.split_size_unit_in_byte

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int64(field_value)]
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
              struct(ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest)
            )

          case([:table_name, :split_size] -- set_fields) do
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
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:split_size, value}
                {[:split_size | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:split_size_unit_in_byte, value}
                {[:split_size_unit_in_byte | set_fields], [field], rest}

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
        2 => {:split_size, {:default, 0}, :int64},
        3 => {:split_size_unit_in_byte, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        split_size: {2, {:default, 0}, :int64},
        split_size_unit_in_byte: {3, {:default, 0}, :int64},
        table_name: {1, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:table_name | :split_size]
    def(required_fields()) do
      [:table_name, :split_size]
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
      def(default(:split_size)) do
        {:ok, 0}
      end,
      def(default(:split_size_unit_in_byte)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end