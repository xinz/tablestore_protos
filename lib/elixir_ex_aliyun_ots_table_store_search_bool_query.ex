# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.BoolQuery) do
  @moduledoc false
  (
    defstruct(
      must_queries: [],
      must_not_queries: [],
      filter_queries: [],
      should_queries: [],
      minimum_should_match: nil
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
          |> encode_must_queries(msg)
          |> encode_must_not_queries(msg)
          |> encode_filter_queries(msg)
          |> encode_should_queries(msg)
          |> encode_minimum_should_match(msg)
        end
      )

      []

      [
        defp(encode_must_queries(acc, msg)) do
          case(msg.must_queries()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_must_not_queries(acc, msg)) do
          case(msg.must_not_queries()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_filter_queries(acc, msg)) do
          case(msg.filter_queries()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<26>>, Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_should_queries(acc, msg)) do
          case(msg.should_queries()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_minimum_should_match(acc, msg)) do
          field_value = msg.minimum_should_match()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int32(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.BoolQuery))
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
                field = {:must_queries, msg.must_queries() ++ List.wrap(value)}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:must_not_queries, msg.must_not_queries() ++ List.wrap(value)}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:filter_queries, msg.filter_queries() ++ List.wrap(value)}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:should_queries, msg.should_queries() ++ List.wrap(value)}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:minimum_should_match, value}
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
        1 => {:must_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 => {:must_not_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        3 => {:filter_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        4 => {:should_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        5 => {:minimum_should_match, {:default, 0}, :int32}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        filter_queries: {3, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        minimum_should_match: {5, {:default, 0}, :int32},
        must_not_queries: {2, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        must_queries: {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        should_queries: {4, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}}
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
      def(default(:must_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:must_not_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:filter_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:should_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:minimum_should_match)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end