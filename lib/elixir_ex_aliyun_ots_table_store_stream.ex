# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.Stream) do
  @moduledoc false
  (
    defstruct(stream_id: nil, table_name: nil, creation_time: nil)

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
          [] |> encode_stream_id(msg) |> encode_table_name(msg) |> encode_creation_time(msg)
        end
      )

      []

      [
        defp(encode_stream_id(acc, msg)) do
          case(msg.stream_id) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:stream_id]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_creation_time(acc, msg)) do
          case(msg.creation_time) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:creation_time]))

            field_value ->
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
          {msg, set_fields} = parse_key_value([], bytes, struct(ExAliyunOts.TableStore.Stream))

          case([:stream_id, :table_name, :creation_time] -- set_fields) do
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
                field = {:stream_id, value}
                {[:stream_id | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:table_name, value}
                {[:table_name | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:creation_time, value}
                {[:creation_time | set_fields], [field], rest}

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
        1 => {:stream_id, {:default, ""}, :string},
        2 => {:table_name, {:default, ""}, :string},
        3 => {:creation_time, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        creation_time: {3, {:default, 0}, :int64},
        stream_id: {1, {:default, ""}, :string},
        table_name: {2, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [(:stream_id | :table_name) | :creation_time]
    def(required_fields()) do
      [:stream_id, :table_name, :creation_time]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:creation_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end