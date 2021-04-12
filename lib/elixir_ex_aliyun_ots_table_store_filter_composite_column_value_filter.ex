# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter) do
  @moduledoc false
  (
    defstruct(combinator: nil, sub_filters: [])

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
          [] |> encode_combinator(msg) |> encode_sub_filters(msg)
        end
      )

      []

      [
        defp(encode_combinator(acc, msg)) do
          case(msg.combinator) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:combinator]))

            field_value ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStoreFilter.LogicalOperator.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_sub_filters(acc, msg)) do
          case(msg.sub_filters) do
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
          {msg, set_fields} =
            parse_key_value(
              [],
              bytes,
              struct(ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter)
            )

          case([:combinator] -- set_fields) do
            [] ->
              msg

            missing_fields ->
              raise(Protox.RequiredFieldsError.new(missing_fields))
          end
        end
      )

      (
        @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
        defp(parse_key_value(set_fields, <<>>, msg)) do
          {msg, set_fields}
        end

        defp(parse_key_value(set_fields, bytes, msg)) do
          {new_set_fields, field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.LogicalOperator)

                field = {:combinator, value}
                {[:combinator | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreFilter.Filter.decode!(delimited)
                field = {:sub_filters, msg.sub_filters ++ List.wrap(value)}
                {[:sub_filters | set_fields], [field], rest}

              {tag, wire_type, rest} ->
                {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
                {set_fields, [], rest}
            end

          msg_updated = struct(msg, field)
          parse_key_value(new_set_fields, rest, msg_updated)
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
          {:combinator, {:default, :LO_NOT},
           {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}},
        2 => {:sub_filters, :unpacked, {:message, ExAliyunOts.TableStoreFilter.Filter}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        combinator:
          {1, {:default, :LO_NOT}, {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}},
        sub_filters: {2, :unpacked, {:message, ExAliyunOts.TableStoreFilter.Filter}}
      }
    end

    []
    @spec required_fields() :: [:combinator]
    def(required_fields()) do
      [:combinator]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:combinator)) do
        {:ok, :LO_NOT}
      end,
      def(default(:sub_filters)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end