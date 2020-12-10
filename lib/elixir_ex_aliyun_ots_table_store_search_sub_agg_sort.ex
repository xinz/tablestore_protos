# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SubAggSort) do
  @moduledoc false
  (
    defstruct(sub_agg_name: nil, order: nil)

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
          [] |> encode_sub_agg_name(msg) |> encode_order(msg)
        end
      )

      []

      [
        defp(encode_sub_agg_name(acc, msg)) do
          field_value = msg.sub_agg_name()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_order(acc, msg)) do
          field_value = msg.order()

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<16>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.SortOrder.encode()
                |> Protox.Encode.encode_enum()
              ]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SubAggSort))
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
                field = {:sub_agg_name, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SortOrder)

                field = {:order, value}
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
        1 => {:sub_agg_name, {:default, ""}, :string},
        2 =>
          {:order, {:default, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        order: {2, {:default, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}},
        sub_agg_name: {1, {:default, ""}, :string}
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
      def(default(:sub_agg_name)) do
        {:ok, ""}
      end,
      def(default(:order)) do
        {:ok, :SORT_ORDER_ASC}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end