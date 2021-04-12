# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupByFieldResultItem) do
  @moduledoc false
  (
    defstruct(key: nil, row_count: nil, sub_aggs_result: nil, sub_group_bys_result: nil)

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
          |> encode_key(msg)
          |> encode_row_count(msg)
          |> encode_sub_aggs_result(msg)
          |> encode_sub_group_bys_result(msg)
        end
      )

      []

      [
        defp(encode_key(acc, msg)) do
          field_value = msg.key

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_row_count(acc, msg)) do
          field_value = msg.row_count

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_sub_aggs_result(acc, msg)) do
          field_value = msg.sub_aggs_result

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_sub_group_bys_result(acc, msg)) do
          field_value = msg.sub_group_bys_result

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByFieldResultItem))
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
                field = {:key, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:row_count, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.AggregationsResult.decode!(delimited)
                field = {:sub_aggs_result, Protox.Message.merge(msg.sub_aggs_result, value)}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.GroupBysResult.decode!(delimited)

                field =
                  {:sub_group_bys_result, Protox.Message.merge(msg.sub_group_bys_result, value)}

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
        1 => {:key, {:default, ""}, :string},
        2 => {:row_count, {:default, 0}, :int64},
        3 =>
          {:sub_aggs_result, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.AggregationsResult}},
        4 =>
          {:sub_group_bys_result, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.GroupBysResult}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        key: {1, {:default, ""}, :string},
        row_count: {2, {:default, 0}, :int64},
        sub_aggs_result:
          {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.AggregationsResult}},
        sub_group_bys_result:
          {4, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBysResult}}
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
      def(default(:key)) do
        {:ok, ""}
      end,
      def(default(:row_count)) do
        {:ok, 0}
      end,
      def(default(:sub_aggs_result)) do
        {:ok, nil}
      end,
      def(default(:sub_group_bys_result)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end