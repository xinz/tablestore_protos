# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SearchResponse) do
  @moduledoc false
  (
    defstruct(
      total_hits: nil,
      rows: [],
      is_all_succeeded: nil,
      next_token: nil,
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
          |> encode_total_hits(msg)
          |> encode_rows(msg)
          |> encode_is_all_succeeded(msg)
          |> encode_next_token(msg)
          |> encode_aggs(msg)
          |> encode_group_bys(msg)
        end
      )

      []

      [
        defp(encode_total_hits(acc, msg)) do
          field_value = msg.total_hits

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_rows(acc, msg)) do
          case(msg.rows) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_bytes(value)]
                end)
              ]
          end
        end,
        defp(encode_is_all_succeeded(acc, msg)) do
          field_value = msg.is_all_succeeded

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_next_token(acc, msg)) do
          field_value = msg.next_token

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "2", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_aggs(acc, msg)) do
          field_value = msg.aggs

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, ":", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_group_bys(acc, msg)) do
          field_value = msg.group_bys

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "B", Protox.Encode.encode_bytes(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SearchResponse))
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
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:total_hits, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:rows, msg.rows ++ List.wrap(value)}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:is_all_succeeded, value}
                {[field], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:next_token, value}
                {[field], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:aggs, value}
                {[field], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:group_bys, value}
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
        1 => {:total_hits, {:default, 0}, :int64},
        2 => {:rows, :unpacked, :bytes},
        3 => {:is_all_succeeded, {:default, false}, :bool},
        6 => {:next_token, {:default, ""}, :bytes},
        7 => {:aggs, {:default, ""}, :bytes},
        8 => {:group_bys, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        aggs: {7, {:default, ""}, :bytes},
        group_bys: {8, {:default, ""}, :bytes},
        is_all_succeeded: {3, {:default, false}, :bool},
        next_token: {6, {:default, ""}, :bytes},
        rows: {2, :unpacked, :bytes},
        total_hits: {1, {:default, 0}, :int64}
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
      def(default(:total_hits)) do
        {:ok, 0}
      end,
      def(default(:rows)) do
        {:error, :no_default_value}
      end,
      def(default(:is_all_succeeded)) do
        {:ok, false}
      end,
      def(default(:next_token)) do
        {:ok, ""}
      end,
      def(default(:aggs)) do
        {:ok, ""}
      end,
      def(default(:group_bys)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end