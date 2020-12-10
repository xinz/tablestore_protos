# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.FunctionScoreQuery) do
  @moduledoc false
  (
    defstruct(query: nil, field_value_factor: nil)

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
          [] |> encode_query(msg) |> encode_field_value_factor(msg)
        end
      )

      []

      [
        defp(encode_query(acc, msg)) do
          field_value = msg.query()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_field_value_factor(acc, msg)) do
          field_value = msg.field_value_factor()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.FunctionScoreQuery))
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
                field = {:query, Protox.Message.merge(msg.query(), value)}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.FieldValueFactor.decode!(delimited)

                field =
                  {:field_value_factor, Protox.Message.merge(msg.field_value_factor(), value)}

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
        1 => {:query, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 =>
          {:field_value_factor, {:default, nil},
           {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_value_factor:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}},
        query: {1, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}}
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
      def(default(:query)) do
        {:ok, nil}
      end,
      def(default(:field_value_factor)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end