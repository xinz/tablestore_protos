# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GeoDistanceSort) do
  @moduledoc false
  (
    defstruct(
      field_name: nil,
      points: [],
      order: nil,
      mode: nil,
      distance_type: nil,
      nested_filter: nil
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
          |> encode_field_name(msg)
          |> encode_points(msg)
          |> encode_order(msg)
          |> encode_mode(msg)
          |> encode_distance_type(msg)
          |> encode_nested_filter(msg)
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
        defp(encode_points(acc, msg)) do
          case(msg.points) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_string(value)]
                end)
              ]
          end
        end,
        defp(encode_order(acc, msg)) do
          field_value = msg.order

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<24>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.SortOrder.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_mode(acc, msg)) do
          field_value = msg.mode

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                " ",
                field_value
                |> ExAliyunOts.TableStoreSearch.SortMode.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_distance_type(acc, msg)) do
          field_value = msg.distance_type

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                "(",
                field_value
                |> ExAliyunOts.TableStoreSearch.GeoDistanceType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_nested_filter(acc, msg)) do
          field_value = msg.nested_filter

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "2", Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GeoDistanceSort))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:points, msg.points ++ List.wrap(value)}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SortOrder)

                field = {:order, value}
                {[field], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SortMode)

                field = {:mode, value}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.GeoDistanceType)

                field = {:distance_type, value}
                {[field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.NestedFilter.decode!(delimited)
                field = {:nested_filter, Protox.Message.merge(msg.nested_filter, value)}
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
        2 => {:points, :unpacked, :string},
        3 =>
          {:order, {:default, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}},
        4 => {:mode, {:default, :SORT_MODE_MIN}, {:enum, ExAliyunOts.TableStoreSearch.SortMode}},
        5 =>
          {:distance_type, {:default, :GEO_DISTANCE_ARC},
           {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}},
        6 =>
          {:nested_filter, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.NestedFilter}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        distance_type:
          {5, {:default, :GEO_DISTANCE_ARC},
           {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}},
        field_name: {1, {:default, ""}, :string},
        mode: {4, {:default, :SORT_MODE_MIN}, {:enum, ExAliyunOts.TableStoreSearch.SortMode}},
        nested_filter:
          {6, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.NestedFilter}},
        order: {3, {:default, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}},
        points: {2, :unpacked, :string}
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
      def(default(:points)) do
        {:error, :no_default_value}
      end,
      def(default(:order)) do
        {:ok, :SORT_ORDER_ASC}
      end,
      def(default(:mode)) do
        {:ok, :SORT_MODE_MIN}
      end,
      def(default(:distance_type)) do
        {:ok, :GEO_DISTANCE_ARC}
      end,
      def(default(:nested_filter)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end