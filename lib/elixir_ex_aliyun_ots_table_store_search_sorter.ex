# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.Sorter) do
  @moduledoc false
  (
    defstruct(field_sort: nil, geo_distance_sort: nil, score_sort: nil, pk_sort: nil)

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
          |> encode_field_sort(msg)
          |> encode_geo_distance_sort(msg)
          |> encode_score_sort(msg)
          |> encode_pk_sort(msg)
        end
      )

      []

      [
        defp(encode_field_sort(acc, msg)) do
          field_value = msg.field_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_geo_distance_sort(acc, msg)) do
          field_value = msg.geo_distance_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_score_sort(acc, msg)) do
          field_value = msg.score_sort()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_pk_sort(acc, msg)) do
          field_value = msg.pk_sort()

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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.Sorter))
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
                value = ExAliyunOts.TableStoreSearch.FieldSort.decode!(delimited)
                field = {:field_sort, Protox.Message.merge(msg.field_sort(), value)}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.GeoDistanceSort.decode!(delimited)
                field = {:geo_distance_sort, Protox.Message.merge(msg.geo_distance_sort(), value)}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.ScoreSort.decode!(delimited)
                field = {:score_sort, Protox.Message.merge(msg.score_sort(), value)}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.PrimaryKeySort.decode!(delimited)
                field = {:pk_sort, Protox.Message.merge(msg.pk_sort(), value)}
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
        1 => {:field_sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldSort}},
        2 =>
          {:geo_distance_sort, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}},
        3 => {:score_sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.ScoreSort}},
        4 => {:pk_sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_sort: {1, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldSort}},
        geo_distance_sort:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}},
        pk_sort: {4, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}},
        score_sort: {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.ScoreSort}}
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
      def(default(:field_sort)) do
        {:ok, nil}
      end,
      def(default(:geo_distance_sort)) do
        {:ok, nil}
      end,
      def(default(:score_sort)) do
        {:ok, nil}
      end,
      def(default(:pk_sort)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end