# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.ParallelScanRequest) do
  @moduledoc false
  (
    defstruct(
      table_name: nil,
      index_name: nil,
      columns_to_get: nil,
      session_id: nil,
      scan_query: nil
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
          |> encode_index_name(msg)
          |> encode_columns_to_get(msg)
          |> encode_session_id(msg)
          |> encode_scan_query(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          field_value = msg.table_name

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_index_name(acc, msg)) do
          field_value = msg.index_name

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_columns_to_get(acc, msg)) do
          field_value = msg.columns_to_get

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_session_id(acc, msg)) do
          field_value = msg.session_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_scan_query(acc, msg)) do
          field_value = msg.scan_query

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "*", Protox.Encode.encode_bytes(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.ParallelScanRequest))
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
                field = {:table_name, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:index_name, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.ColumnsToGet.decode!(delimited)
                field = {:columns_to_get, Protox.Message.merge(msg.columns_to_get, value)}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:session_id, value}
                {[field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:scan_query, value}
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
        1 => {:table_name, {:default, ""}, :string},
        2 => {:index_name, {:default, ""}, :string},
        3 =>
          {:columns_to_get, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}},
        4 => {:session_id, {:default, ""}, :bytes},
        5 => {:scan_query, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        columns_to_get:
          {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}},
        index_name: {2, {:default, ""}, :string},
        scan_query: {5, {:default, ""}, :bytes},
        session_id: {4, {:default, ""}, :bytes},
        table_name: {1, {:default, ""}, :string}
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
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:index_name)) do
        {:ok, ""}
      end,
      def(default(:columns_to_get)) do
        {:ok, nil}
      end,
      def(default(:session_id)) do
        {:ok, ""}
      end,
      def(default(:scan_query)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end