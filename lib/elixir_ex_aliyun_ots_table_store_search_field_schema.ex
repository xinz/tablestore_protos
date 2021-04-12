# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.FieldSchema) do
  @moduledoc false
  (
    defstruct(
      field_name: nil,
      field_type: nil,
      index_options: nil,
      analyzer: nil,
      index: nil,
      sort_and_agg: nil,
      store: nil,
      field_schemas: [],
      is_array: nil,
      analyzer_parameter: nil
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
          |> encode_field_type(msg)
          |> encode_index_options(msg)
          |> encode_analyzer(msg)
          |> encode_index(msg)
          |> encode_sort_and_agg(msg)
          |> encode_store(msg)
          |> encode_field_schemas(msg)
          |> encode_is_array(msg)
          |> encode_analyzer_parameter(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          field_value = msg.field_name

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_field_type(acc, msg)) do
          field_value = msg.field_type

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<16>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.FieldType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_index_options(acc, msg)) do
          field_value = msg.index_options

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<24>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.IndexOptions.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_analyzer(acc, msg)) do
          field_value = msg.analyzer

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_index(acc, msg)) do
          field_value = msg.index

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_sort_and_agg(acc, msg)) do
          field_value = msg.sort_and_agg

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "0", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_store(acc, msg)) do
          field_value = msg.store

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "8", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_field_schemas(acc, msg)) do
          case(msg.field_schemas) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_is_array(acc, msg)) do
          field_value = msg.is_array

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "H", Protox.Encode.encode_bool(field_value)]
          end
        end,
        defp(encode_analyzer_parameter(acc, msg)) do
          field_value = msg.analyzer_parameter

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "R", Protox.Encode.encode_bytes(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.FieldSchema))
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
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.FieldType)

                field = {:field_type, value}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.IndexOptions)

                field = {:index_options, value}
                {[field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:analyzer, value}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:index, value}
                {[field], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:sort_and_agg, value}
                {[field], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:store, value}
                {[field], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.FieldSchema.decode!(delimited)
                field = {:field_schemas, msg.field_schemas ++ List.wrap(value)}
                {[field], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:is_array, value}
                {[field], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:analyzer_parameter, value}
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
        2 => {:field_type, {:default, :LONG}, {:enum, ExAliyunOts.TableStoreSearch.FieldType}},
        3 =>
          {:index_options, {:default, :DOCS}, {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}},
        4 => {:analyzer, {:default, ""}, :string},
        5 => {:index, {:default, false}, :bool},
        6 => {:sort_and_agg, {:default, false}, :bool},
        7 => {:store, {:default, false}, :bool},
        8 => {:field_schemas, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        9 => {:is_array, {:default, false}, :bool},
        10 => {:analyzer_parameter, {:default, ""}, :bytes}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        analyzer: {4, {:default, ""}, :string},
        analyzer_parameter: {10, {:default, ""}, :bytes},
        field_name: {1, {:default, ""}, :string},
        field_schemas: {8, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        field_type: {2, {:default, :LONG}, {:enum, ExAliyunOts.TableStoreSearch.FieldType}},
        index: {5, {:default, false}, :bool},
        index_options: {3, {:default, :DOCS}, {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}},
        is_array: {9, {:default, false}, :bool},
        sort_and_agg: {6, {:default, false}, :bool},
        store: {7, {:default, false}, :bool}
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
      def(default(:field_type)) do
        {:ok, :LONG}
      end,
      def(default(:index_options)) do
        {:ok, :DOCS}
      end,
      def(default(:analyzer)) do
        {:ok, ""}
      end,
      def(default(:index)) do
        {:ok, false}
      end,
      def(default(:sort_and_agg)) do
        {:ok, false}
      end,
      def(default(:store)) do
        {:ok, false}
      end,
      def(default(:field_schemas)) do
        {:error, :no_default_value}
      end,
      def(default(:is_array)) do
        {:ok, false}
      end,
      def(default(:analyzer_parameter)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end