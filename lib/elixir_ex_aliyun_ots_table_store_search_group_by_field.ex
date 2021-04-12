# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupByField) do
  @moduledoc false
  (
    defstruct(field_name: nil, size: nil, sort: nil, sub_aggs: nil, sub_group_bys: nil)

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
          |> encode_field_name(msg)
          |> encode_size(msg)
          |> encode_sort(msg)
          |> encode_sub_aggs(msg)
          |> encode_sub_group_bys(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          field_value = msg.field_name

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_size(acc, msg)) do
          field_value = msg.size

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_sort(acc, msg)) do
          field_value = msg.sort

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_sub_aggs(acc, msg)) do
          field_value = msg.sub_aggs

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_sub_group_bys(acc, msg)) do
          field_value = msg.sub_group_bys

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "*", Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByField))
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
                field = {:field_name, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:size, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.GroupBySort.decode!(delimited)
                field = {:sort, Protox.Message.merge(msg.sort, value)}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Aggregations.decode!(delimited)
                field = {:sub_aggs, Protox.Message.merge(msg.sub_aggs, value)}
                {[field], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.GroupBys.decode!(delimited)
                field = {:sub_group_bys, Protox.Message.merge(msg.sub_group_bys, value)}
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
        1 => {:field_name, {:default, ""}, :string},
        2 => {:size, {:default, 0}, :int32},
        3 => {:sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBySort}},
        4 => {:sub_aggs, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        5 => {:sub_group_bys, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:default, ""}, :string},
        size: {2, {:default, 0}, :int32},
        sort: {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBySort}},
        sub_aggs: {4, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        sub_group_bys: {5, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
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
      def(default(:field_name)) do
        {:ok, ""}
      end,
      def(default(:size)) do
        {:ok, 0}
      end,
      def(default(:sort)) do
        {:ok, nil}
      end,
      def(default(:sub_aggs)) do
        {:ok, nil}
      end,
      def(default(:sub_group_bys)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end