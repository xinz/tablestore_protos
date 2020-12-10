# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupBySorter) do
  @moduledoc false
  (
    defstruct(group_key_sort: nil, row_count_sort: nil, sub_agg_sort: nil)

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
          |> encode_group_key_sort(msg)
          |> encode_row_count_sort(msg)
          |> encode_sub_agg_sort(msg)
        end
      )

      []

      [
        defp(encode_group_key_sort(acc, msg)) do
          field_value = msg.group_key_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_row_count_sort(acc, msg)) do
          field_value = msg.row_count_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_sub_agg_sort(acc, msg)) do
          field_value = msg.sub_agg_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupBySorter))
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
                value = ExAliyunOts.TableStoreSearch.GroupKeySort.decode!(delimited)
                field = {:group_key_sort, Protox.Message.merge(msg.group_key_sort(), value)}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.RowCountSort.decode!(delimited)
                field = {:row_count_sort, Protox.Message.merge(msg.row_count_sort(), value)}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.SubAggSort.decode!(delimited)
                field = {:sub_agg_sort, Protox.Message.merge(msg.sub_agg_sort(), value)}
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
        1 =>
          {:group_key_sort, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}},
        2 =>
          {:row_count_sort, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.RowCountSort}},
        3 => {:sub_agg_sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.SubAggSort}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        group_key_sort:
          {1, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}},
        row_count_sort:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.RowCountSort}},
        sub_agg_sort: {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.SubAggSort}}
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
      def(default(:group_key_sort)) do
        {:ok, nil}
      end,
      def(default(:row_count_sort)) do
        {:ok, nil}
      end,
      def(default(:sub_agg_sort)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end