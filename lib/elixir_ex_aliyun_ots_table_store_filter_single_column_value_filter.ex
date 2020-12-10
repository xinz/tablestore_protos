# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.SingleColumnValueFilter) do
  @moduledoc false
  (
    defstruct(
      comparator: nil,
      column_name: nil,
      column_value: nil,
      filter_if_missing: nil,
      latest_version_only: nil
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
          |> encode_comparator(msg)
          |> encode_column_name(msg)
          |> encode_column_value(msg)
          |> encode_filter_if_missing(msg)
          |> encode_latest_version_only(msg)
        end
      )

      []

      [
        defp(encode_comparator(acc, msg)) do
          case(msg.comparator()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:comparator]))

            field_value ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStoreFilter.ComparatorType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_column_name(acc, msg)) do
          case(msg.column_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:column_name]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_column_value(acc, msg)) do
          case(msg.column_value()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:column_value]))

            field_value ->
              [acc, <<26>>, Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_filter_if_missing(acc, msg)) do
          case(msg.filter_if_missing()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:filter_if_missing]))

            field_value ->
              [acc, " ", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_latest_version_only(acc, msg)) do
          case(msg.latest_version_only()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:latest_version_only]))

            field_value ->
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
          {msg, set_fields} =
            parse_key_value(
              [],
              bytes,
              struct(ExAliyunOts.TableStoreFilter.SingleColumnValueFilter)
            )

          case(
            [:comparator, :column_name, :column_value, :filter_if_missing, :latest_version_only] --
              set_fields
          ) do
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
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.ComparatorType)

                field = {:comparator, value}
                {[:comparator | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:column_name, value}
                {[:column_name | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:column_value, value}
                {[:column_value | set_fields], [field], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:filter_if_missing, value}
                {[:filter_if_missing | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:latest_version_only, value}
                {[:latest_version_only | set_fields], [field], rest}

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
          {:comparator, {:default, :CT_EQUAL},
           {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}},
        2 => {:column_name, {:default, ""}, :string},
        3 => {:column_value, {:default, ""}, :bytes},
        4 => {:filter_if_missing, {:default, false}, :bool},
        5 => {:latest_version_only, {:default, false}, :bool}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        column_name: {2, {:default, ""}, :string},
        column_value: {3, {:default, ""}, :bytes},
        comparator:
          {1, {:default, :CT_EQUAL}, {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}},
        filter_if_missing: {4, {:default, false}, :bool},
        latest_version_only: {5, {:default, false}, :bool}
      }
    end

    []

    @spec required_fields() :: [
            (((:comparator | :column_name) | :column_value) | :filter_if_missing)
            | :latest_version_only
          ]
    def(required_fields()) do
      [:comparator, :column_name, :column_value, :filter_if_missing, :latest_version_only]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:comparator)) do
        {:ok, :CT_EQUAL}
      end,
      def(default(:column_name)) do
        {:ok, ""}
      end,
      def(default(:column_value)) do
        {:ok, ""}
      end,
      def(default(:filter_if_missing)) do
        {:ok, false}
      end,
      def(default(:latest_version_only)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end