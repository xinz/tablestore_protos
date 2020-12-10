# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitsResponse) do
  @moduledoc false
  (
    defstruct(session_id: nil, splits_size: nil)

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
          [] |> encode_session_id(msg) |> encode_splits_size(msg)
        end
      )

      []

      [
        defp(encode_session_id(acc, msg)) do
          field_value = msg.session_id()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_splits_size(acc, msg)) do
          field_value = msg.splits_size()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.ComputeSplitsResponse))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:session_id, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:splits_size, value}
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
      %{1 => {:session_id, {:default, ""}, :bytes}, 2 => {:splits_size, {:default, 0}, :int32}}
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{session_id: {1, {:default, ""}, :bytes}, splits_size: {2, {:default, 0}, :int32}}
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
      def(default(:session_id)) do
        {:ok, ""}
      end,
      def(default(:splits_size)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end