# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.StreamDetails) do
  @moduledoc false
  (
    defstruct(enable_stream: nil, stream_id: nil, expiration_time: nil, last_enable_time: nil)

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
          |> encode_enable_stream(msg)
          |> encode_stream_id(msg)
          |> encode_expiration_time(msg)
          |> encode_last_enable_time(msg)
        end
      )

      []

      [
        defp(encode_enable_stream(acc, msg)) do
          case(msg.enable_stream()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:enable_stream]))

            field_value ->
              [acc, "\b", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_stream_id(acc, msg)) do
          field_value = msg.stream_id()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_expiration_time(acc, msg)) do
          field_value = msg.expiration_time()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_last_enable_time(acc, msg)) do
          field_value = msg.last_enable_time()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, " ", Protox.Encode.encode_int64(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.StreamDetails))

          case([:enable_stream] -- set_fields) do
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
                field = {:enable_stream, value}
                {[:enable_stream | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:stream_id, value}
                {[:stream_id | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:expiration_time, value}
                {[:expiration_time | set_fields], [field], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:last_enable_time, value}
                {[:last_enable_time | set_fields], [field], rest}

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
        1 => {:enable_stream, {:default, false}, :bool},
        2 => {:stream_id, {:default, ""}, :string},
        3 => {:expiration_time, {:default, 0}, :int32},
        4 => {:last_enable_time, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        enable_stream: {1, {:default, false}, :bool},
        expiration_time: {3, {:default, 0}, :int32},
        last_enable_time: {4, {:default, 0}, :int64},
        stream_id: {2, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:enable_stream]
    def(required_fields()) do
      [:enable_stream]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:enable_stream)) do
        {:ok, false}
      end,
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:expiration_time)) do
        {:ok, 0}
      end,
      def(default(:last_enable_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end