# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SearchQuery) do
  @moduledoc false
  (
    defstruct(
      offset: nil,
      limit: nil,
      query: nil,
      collapse: nil,
      sort: nil,
      getTotalCount: nil,
      token: nil,
      aggs: nil,
      group_bys: nil
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
          |> encode_offset(msg)
          |> encode_limit(msg)
          |> encode_query(msg)
          |> encode_collapse(msg)
          |> encode_sort(msg)
          |> encode_getTotalCount(msg)
          |> encode_token(msg)
          |> encode_aggs(msg)
          |> encode_group_bys(msg)
        end
      )

      []

      [
        defp(encode_offset(acc, msg)) do
          field_value = msg.offset

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_limit(acc, msg)) do
          field_value = msg.limit

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_query(acc, msg)) do
          field_value = msg.query

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_collapse(acc, msg)) do
          field_value = msg.collapse

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "*", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_sort(acc, msg)) do
          field_value = msg.sort

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "2", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_getTotalCount(acc, msg)) do
          field_value = msg.getTotalCount

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "@", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_token(acc, msg)) do
          field_value = msg.token

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "J", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_aggs(acc, msg)) do
          field_value = msg.aggs

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "R", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_group_bys(acc, msg)) do
          field_value = msg.group_bys

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "Z", Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SearchQuery))
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:offset, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:limit, value}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:query, Protox.Message.merge(msg.query, value)}
                {[field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Collapse.decode!(delimited)
                field = {:collapse, Protox.Message.merge(msg.collapse, value)}
                {[field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Sort.decode!(delimited)
                field = {:sort, Protox.Message.merge(msg.sort, value)}
                {[field], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:getTotalCount, value}
                {[field], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:token, value}
                {[field], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Aggregations.decode!(delimited)
                field = {:aggs, Protox.Message.merge(msg.aggs, value)}
                {[field], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.GroupBys.decode!(delimited)
                field = {:group_bys, Protox.Message.merge(msg.group_bys, value)}
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
        1 => {:offset, {:default, 0}, :int32},
        2 => {:limit, {:default, 0}, :int32},
        4 => {:query, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        5 => {:collapse, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Collapse}},
        6 => {:sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}},
        8 => {:getTotalCount, {:default, false}, :bool},
        9 => {:token, {:default, ""}, :bytes},
        10 => {:aggs, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        11 => {:group_bys, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        aggs: {10, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        collapse: {5, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Collapse}},
        getTotalCount: {8, {:default, false}, :bool},
        group_bys: {11, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}},
        limit: {2, {:default, 0}, :int32},
        offset: {1, {:default, 0}, :int32},
        query: {4, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        sort: {6, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}},
        token: {9, {:default, ""}, :bytes}
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
      def(default(:offset)) do
        {:ok, 0}
      end,
      def(default(:limit)) do
        {:ok, 0}
      end,
      def(default(:query)) do
        {:ok, nil}
      end,
      def(default(:collapse)) do
        {:ok, nil}
      end,
      def(default(:sort)) do
        {:ok, nil}
      end,
      def(default(:getTotalCount)) do
        {:ok, false}
      end,
      def(default(:token)) do
        {:ok, ""}
      end,
      def(default(:aggs)) do
        {:ok, nil}
      end,
      def(default(:group_bys)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end