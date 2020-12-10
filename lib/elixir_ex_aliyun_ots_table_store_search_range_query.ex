# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.RangeQuery) do
  @moduledoc false
  (
    defstruct(
      field_name: nil,
      range_from: nil,
      range_to: nil,
      include_lower: nil,
      include_upper: nil
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
          |> encode_range_from(msg)
          |> encode_range_to(msg)
          |> encode_include_lower(msg)
          |> encode_include_upper(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          field_value = msg.field_name()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_range_from(acc, msg)) do
          field_value = msg.range_from()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_range_to(acc, msg)) do
          field_value = msg.range_to()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_include_lower(acc, msg)) do
          field_value = msg.include_lower()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, " ", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_include_upper(acc, msg)) do
          field_value = msg.include_upper()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_bool(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.RangeQuery))
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
                field = {:range_from, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:range_to, value}
                {[field], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:include_lower, value}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:include_upper, value}
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
        2 => {:range_from, {:default, ""}, :bytes},
        3 => {:range_to, {:default, ""}, :bytes},
        4 => {:include_lower, {:default, false}, :bool},
        5 => {:include_upper, {:default, false}, :bool}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:default, ""}, :string},
        include_lower: {4, {:default, false}, :bool},
        include_upper: {5, {:default, false}, :bool},
        range_from: {2, {:default, ""}, :bytes},
        range_to: {3, {:default, ""}, :bytes}
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
      def(default(:range_from)) do
        {:ok, ""}
      end,
      def(default(:range_to)) do
        {:ok, ""}
      end,
      def(default(:include_lower)) do
        {:ok, false}
      end,
      def(default(:include_upper)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end