# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.Aggregation) do
  @moduledoc false
  (
    defstruct(name: nil, type: nil, body: nil)

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
          [] |> encode_name(msg) |> encode_type(msg) |> encode_body(msg)
        end
      )

      []

      [
        defp(encode_name(acc, msg)) do
          field_value = msg.name

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_type(acc, msg)) do
          field_value = msg.type

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<16>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.AggregationType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_body(acc, msg)) do
          field_value = msg.body

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_bytes(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.Aggregation))
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
                field = {:name, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.AggregationType)

                field = {:type, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:body, value}
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
        1 => {:name, {:default, ""}, :string},
        2 => {:type, {:default, :AGG_AVG}, {:enum, ExAliyunOts.TableStoreSearch.AggregationType}},
        3 => {:body, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        body: {3, {:default, ""}, :bytes},
        name: {1, {:default, ""}, :string},
        type: {2, {:default, :AGG_AVG}, {:enum, ExAliyunOts.TableStoreSearch.AggregationType}}
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
      def(default(:name)) do
        {:ok, ""}
      end,
      def(default(:type)) do
        {:ok, :AGG_AVG}
      end,
      def(default(:body)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end