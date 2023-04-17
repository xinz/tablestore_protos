# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.FieldSchema do
  @moduledoc false
  defstruct field_name: nil,
            field_type: nil,
            index_options: nil,
            analyzer: nil,
            index: nil,
            sort_and_agg: nil,
            store: nil,
            field_schemas: [],
            is_array: nil,
            analyzer_parameter: nil,
            is_virtual_field: nil,
            source_field_names: [],
            date_formats: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
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
        |> encode_is_virtual_field(msg)
        |> encode_source_field_names(msg)
        |> encode_date_formats(msg)
      end
    )

    []

    [
      defp encode_field_name(acc, msg) do
        try do
          case msg.field_name do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_string(msg.field_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_field_type(acc, msg) do
        try do
          case msg.field_type do
            nil ->
              acc

            _ ->
              [
                acc,
                "\x10",
                msg.field_type
                |> ExAliyunOts.TableStoreSearch.FieldType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index_options(acc, msg) do
        try do
          case msg.index_options do
            nil ->
              acc

            _ ->
              [
                acc,
                "\x18",
                msg.index_options
                |> ExAliyunOts.TableStoreSearch.IndexOptions.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_options, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_analyzer(acc, msg) do
        try do
          case msg.analyzer do
            nil -> acc
            _ -> [acc, "\"", Protox.Encode.encode_string(msg.analyzer)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:analyzer, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_index(acc, msg) do
        try do
          case msg.index do
            nil -> acc
            _ -> [acc, "(", Protox.Encode.encode_bool(msg.index)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sort_and_agg(acc, msg) do
        try do
          case msg.sort_and_agg do
            nil -> acc
            _ -> [acc, "0", Protox.Encode.encode_bool(msg.sort_and_agg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sort_and_agg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_store(acc, msg) do
        try do
          case msg.store do
            nil -> acc
            _ -> [acc, "8", Protox.Encode.encode_bool(msg.store)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:store, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_field_schemas(acc, msg) do
        try do
          case msg.field_schemas do
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
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_schemas, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_array(acc, msg) do
        try do
          case msg.is_array do
            nil -> acc
            _ -> [acc, "H", Protox.Encode.encode_bool(msg.is_array)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_array, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_analyzer_parameter(acc, msg) do
        try do
          case msg.analyzer_parameter do
            nil -> acc
            _ -> [acc, "R", Protox.Encode.encode_bytes(msg.analyzer_parameter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:analyzer_parameter, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_is_virtual_field(acc, msg) do
        try do
          case msg.is_virtual_field do
            nil -> acc
            _ -> [acc, "X", Protox.Encode.encode_bool(msg.is_virtual_field)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_virtual_field, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_source_field_names(acc, msg) do
        try do
          case msg.source_field_names do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "b", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:source_field_names, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_date_formats(acc, msg) do
        try do
          case msg.date_formats do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "j", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:date_formats, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.FieldSchema))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[field_name: delimited], rest}

            {2, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.FieldType)

              {[field_type: value], rest}

            {3, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.IndexOptions)

              {[index_options: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[analyzer: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[index: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[sort_and_agg: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[store: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 field_schemas:
                   msg.field_schemas ++
                     [ExAliyunOts.TableStoreSearch.FieldSchema.decode!(delimited)]
               ], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_array: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[analyzer_parameter: delimited], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_virtual_field: value], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[source_field_names: msg.source_field_names ++ [delimited]], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[date_formats: msg.date_formats ++ [delimited]], rest}

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

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStoreSearch.FieldSchema,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:field_type, {:scalar, :LONG}, {:enum, ExAliyunOts.TableStoreSearch.FieldType}},
        3 =>
          {:index_options, {:scalar, :DOCS}, {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}},
        4 => {:analyzer, {:scalar, ""}, :string},
        5 => {:index, {:scalar, false}, :bool},
        6 => {:sort_and_agg, {:scalar, false}, :bool},
        7 => {:store, {:scalar, false}, :bool},
        8 => {:field_schemas, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        9 => {:is_array, {:scalar, false}, :bool},
        10 => {:analyzer_parameter, {:scalar, ""}, :bytes},
        11 => {:is_virtual_field, {:scalar, false}, :bool},
        12 => {:source_field_names, :unpacked, :string},
        13 => {:date_formats, :unpacked, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        analyzer: {4, {:scalar, ""}, :string},
        analyzer_parameter: {10, {:scalar, ""}, :bytes},
        date_formats: {13, :unpacked, :string},
        field_name: {1, {:scalar, ""}, :string},
        field_schemas: {8, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        field_type: {2, {:scalar, :LONG}, {:enum, ExAliyunOts.TableStoreSearch.FieldType}},
        index: {5, {:scalar, false}, :bool},
        index_options: {3, {:scalar, :DOCS}, {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}},
        is_array: {9, {:scalar, false}, :bool},
        is_virtual_field: {11, {:scalar, false}, :bool},
        sort_and_agg: {6, {:scalar, false}, :bool},
        source_field_names: {12, :unpacked, :string},
        store: {7, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fieldName",
          kind: {:scalar, ""},
          label: :optional,
          name: :field_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldType",
          kind: {:scalar, :LONG},
          label: :optional,
          name: :field_type,
          tag: 2,
          type: {:enum, ExAliyunOts.TableStoreSearch.FieldType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexOptions",
          kind: {:scalar, :DOCS},
          label: :optional,
          name: :index_options,
          tag: 3,
          type: {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}
        },
        %{
          __struct__: Protox.Field,
          json_name: "analyzer",
          kind: {:scalar, ""},
          label: :optional,
          name: :analyzer,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "index",
          kind: {:scalar, false},
          label: :optional,
          name: :index,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "sortAndAgg",
          kind: {:scalar, false},
          label: :optional,
          name: :sort_and_agg,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "store",
          kind: {:scalar, false},
          label: :optional,
          name: :store,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldSchemas",
          kind: :unpacked,
          label: :repeated,
          name: :field_schemas,
          tag: 8,
          type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
        },
        %{
          __struct__: Protox.Field,
          json_name: "isArray",
          kind: {:scalar, false},
          label: :optional,
          name: :is_array,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "analyzerParameter",
          kind: {:scalar, ""},
          label: :optional,
          name: :analyzer_parameter,
          tag: 10,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "isVirtualField",
          kind: {:scalar, false},
          label: :optional,
          name: :is_virtual_field,
          tag: 11,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "sourceFieldNames",
          kind: :unpacked,
          label: :repeated,
          name: :source_field_names,
          tag: 12,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "dateFormats",
          kind: :unpacked,
          label: :repeated,
          name: :date_formats,
          tag: 13,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:field_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("fieldName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("field_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:field_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldType",
             kind: {:scalar, :LONG},
             label: :optional,
             name: :field_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreSearch.FieldType}
           }}
        end

        def field_def("fieldType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldType",
             kind: {:scalar, :LONG},
             label: :optional,
             name: :field_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreSearch.FieldType}
           }}
        end

        def field_def("field_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldType",
             kind: {:scalar, :LONG},
             label: :optional,
             name: :field_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreSearch.FieldType}
           }}
        end
      ),
      (
        def field_def(:index_options) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOptions",
             kind: {:scalar, :DOCS},
             label: :optional,
             name: :index_options,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}
           }}
        end

        def field_def("indexOptions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOptions",
             kind: {:scalar, :DOCS},
             label: :optional,
             name: :index_options,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}
           }}
        end

        def field_def("index_options") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexOptions",
             kind: {:scalar, :DOCS},
             label: :optional,
             name: :index_options,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreSearch.IndexOptions}
           }}
        end
      ),
      (
        def field_def(:analyzer) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "analyzer",
             kind: {:scalar, ""},
             label: :optional,
             name: :analyzer,
             tag: 4,
             type: :string
           }}
        end

        def field_def("analyzer") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "analyzer",
             kind: {:scalar, ""},
             label: :optional,
             name: :analyzer,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:index) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "index",
             kind: {:scalar, false},
             label: :optional,
             name: :index,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("index") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "index",
             kind: {:scalar, false},
             label: :optional,
             name: :index,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:sort_and_agg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortAndAgg",
             kind: {:scalar, false},
             label: :optional,
             name: :sort_and_agg,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("sortAndAgg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortAndAgg",
             kind: {:scalar, false},
             label: :optional,
             name: :sort_and_agg,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("sort_and_agg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sortAndAgg",
             kind: {:scalar, false},
             label: :optional,
             name: :sort_and_agg,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:store) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "store",
             kind: {:scalar, false},
             label: :optional,
             name: :store,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("store") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "store",
             kind: {:scalar, false},
             label: :optional,
             name: :store,
             tag: 7,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:field_schemas) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end

        def field_def("fieldSchemas") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end

        def field_def("field_schemas") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end
      ),
      (
        def field_def(:is_array) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isArray",
             kind: {:scalar, false},
             label: :optional,
             name: :is_array,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("isArray") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isArray",
             kind: {:scalar, false},
             label: :optional,
             name: :is_array,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("is_array") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isArray",
             kind: {:scalar, false},
             label: :optional,
             name: :is_array,
             tag: 9,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:analyzer_parameter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "analyzerParameter",
             kind: {:scalar, ""},
             label: :optional,
             name: :analyzer_parameter,
             tag: 10,
             type: :bytes
           }}
        end

        def field_def("analyzerParameter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "analyzerParameter",
             kind: {:scalar, ""},
             label: :optional,
             name: :analyzer_parameter,
             tag: 10,
             type: :bytes
           }}
        end

        def field_def("analyzer_parameter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "analyzerParameter",
             kind: {:scalar, ""},
             label: :optional,
             name: :analyzer_parameter,
             tag: 10,
             type: :bytes
           }}
        end
      ),
      (
        def field_def(:is_virtual_field) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isVirtualField",
             kind: {:scalar, false},
             label: :optional,
             name: :is_virtual_field,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("isVirtualField") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isVirtualField",
             kind: {:scalar, false},
             label: :optional,
             name: :is_virtual_field,
             tag: 11,
             type: :bool
           }}
        end

        def field_def("is_virtual_field") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isVirtualField",
             kind: {:scalar, false},
             label: :optional,
             name: :is_virtual_field,
             tag: 11,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:source_field_names) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceFieldNames",
             kind: :unpacked,
             label: :repeated,
             name: :source_field_names,
             tag: 12,
             type: :string
           }}
        end

        def field_def("sourceFieldNames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceFieldNames",
             kind: :unpacked,
             label: :repeated,
             name: :source_field_names,
             tag: 12,
             type: :string
           }}
        end

        def field_def("source_field_names") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sourceFieldNames",
             kind: :unpacked,
             label: :repeated,
             name: :source_field_names,
             tag: 12,
             type: :string
           }}
        end
      ),
      (
        def field_def(:date_formats) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dateFormats",
             kind: :unpacked,
             label: :repeated,
             name: :date_formats,
             tag: 13,
             type: :string
           }}
        end

        def field_def("dateFormats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dateFormats",
             kind: :unpacked,
             label: :repeated,
             name: :date_formats,
             tag: 13,
             type: :string
           }}
        end

        def field_def("date_formats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dateFormats",
             kind: :unpacked,
             label: :repeated,
             name: :date_formats,
             tag: 13,
             type: :string
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:field_name) do
      {:ok, ""}
    end,
    def default(:field_type) do
      {:ok, :LONG}
    end,
    def default(:index_options) do
      {:ok, :DOCS}
    end,
    def default(:analyzer) do
      {:ok, ""}
    end,
    def default(:index) do
      {:ok, false}
    end,
    def default(:sort_and_agg) do
      {:ok, false}
    end,
    def default(:store) do
      {:ok, false}
    end,
    def default(:field_schemas) do
      {:error, :no_default_value}
    end,
    def default(:is_array) do
      {:ok, false}
    end,
    def default(:analyzer_parameter) do
      {:ok, ""}
    end,
    def default(:is_virtual_field) do
      {:ok, false}
    end,
    def default(:source_field_names) do
      {:error, :no_default_value}
    end,
    def default(:date_formats) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
