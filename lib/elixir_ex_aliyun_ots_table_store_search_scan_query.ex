# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.ScanQuery) do
  @moduledoc false
  (
    defstruct(
      query: nil,
      limit: nil,
      alive_time: nil,
      token: nil,
      current_parallel_id: nil,
      max_parallel: nil
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
          |> encode_query(msg)
          |> encode_limit(msg)
          |> encode_alive_time(msg)
          |> encode_token(msg)
          |> encode_current_parallel_id(msg)
          |> encode_max_parallel(msg)
        end
      )

      []

      [
        defp(encode_query(acc, msg)) do
          field_value = msg.query()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_limit(acc, msg)) do
          field_value = msg.limit()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_alive_time(acc, msg)) do
          field_value = msg.alive_time()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_token(acc, msg)) do
          field_value = msg.token()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_current_parallel_id(acc, msg)) do
          field_value = msg.current_parallel_id()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_max_parallel(acc, msg)) do
          field_value = msg.max_parallel()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "0", Protox.Encode.encode_int32(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.ScanQuery))
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
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:query, Protox.Message.merge(msg.query(), value)}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:limit, value}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:alive_time, value}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:token, value}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:current_parallel_id, value}
                {[field], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:max_parallel, value}
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
      %{
        1 => {:query, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 => {:limit, {:default, 0}, :int32},
        3 => {:alive_time, {:default, 0}, :int32},
        4 => {:token, {:default, ""}, :bytes},
        5 => {:current_parallel_id, {:default, 0}, :int32},
        6 => {:max_parallel, {:default, 0}, :int32}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        alive_time: {3, {:default, 0}, :int32},
        current_parallel_id: {5, {:default, 0}, :int32},
        limit: {2, {:default, 0}, :int32},
        max_parallel: {6, {:default, 0}, :int32},
        query: {1, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        token: {4, {:default, ""}, :bytes}
      }
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
      def(default(:query)) do
        {:ok, nil}
      end,
      def(default(:limit)) do
        {:ok, 0}
      end,
      def(default(:alive_time)) do
        {:ok, 0}
      end,
      def(default(:token)) do
        {:ok, ""}
      end,
      def(default(:current_parallel_id)) do
        {:ok, 0}
      end,
      def(default(:max_parallel)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end