# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.MatchQuery) do
  @moduledoc false
  (
    defstruct(field_name: nil, text: nil, minimum_should_match: nil, operator: nil)

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
          |> encode_text(msg)
          |> encode_minimum_should_match(msg)
          |> encode_operator(msg)
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
        defp(encode_text(acc, msg)) do
          field_value = msg.text()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_minimum_should_match(acc, msg)) do
          field_value = msg.minimum_should_match()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_operator(acc, msg)) do
          field_value = msg.operator()

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                " ",
                field_value
                |> ExAliyunOts.TableStoreSearch.QueryOperator.encode()
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.MatchQuery))
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
                field = {:text, value}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:minimum_should_match, value}
                {[field], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.QueryOperator)

                field = {:operator, value}
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
        2 => {:text, {:default, ""}, :string},
        3 => {:minimum_should_match, {:default, 0}, :int32},
        4 => {:operator, {:default, :OR}, {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:default, ""}, :string},
        minimum_should_match: {3, {:default, 0}, :int32},
        operator: {4, {:default, :OR}, {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}},
        text: {2, {:default, ""}, :string}
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
      def(default(:text)) do
        {:ok, ""}
      end,
      def(default(:minimum_should_match)) do
        {:ok, 0}
      end,
      def(default(:operator)) do
        {:ok, :OR}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end