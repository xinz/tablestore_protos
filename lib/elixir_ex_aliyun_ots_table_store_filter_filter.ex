# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.Filter) do
  @moduledoc false
  (
    defstruct(type: nil, filter: nil)

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
          [] |> encode_type(msg) |> encode_filter(msg)
        end
      )

      []

      [
        defp(encode_type(acc, msg)) do
          case(msg.type) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:type]))

            field_value ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStoreFilter.FilterType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_filter(acc, msg)) do
          case(msg.filter) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:filter]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_bytes(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreFilter.Filter))

          case([:type, :filter] -- set_fields) do
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
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.FilterType)

                field = {:type, value}
                {[:type | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:filter, value}
                {[:filter | set_fields], [field], rest}

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
          {:type, {:default, :FT_SINGLE_COLUMN_VALUE},
           {:enum, ExAliyunOts.TableStoreFilter.FilterType}},
        2 => {:filter, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        filter: {2, {:default, ""}, :bytes},
        type:
          {1, {:default, :FT_SINGLE_COLUMN_VALUE},
           {:enum, ExAliyunOts.TableStoreFilter.FilterType}}
      }
    end

    []
    @spec required_fields() :: [:type | :filter]
    def(required_fields()) do
      [:type, :filter]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:type)) do
        {:ok, :FT_SINGLE_COLUMN_VALUE}
      end,
      def(default(:filter)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end