# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SearchRequest) do
  @moduledoc false
  (
    defstruct(
      table_name: nil,
      index_name: nil,
      columns_to_get: nil,
      search_query: nil,
      routing_values: []
    )

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_table_name(msg)
          |> encode_index_name(msg)
          |> encode_columns_to_get(msg)
          |> encode_search_query(msg)
          |> encode_routing_values(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          try do
            case(msg.table_name) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.table_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:table_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_index_name(acc, msg)) do
          try do
            case(msg.index_name) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.index_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:index_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_columns_to_get(acc, msg)) do
          try do
            case(msg.columns_to_get) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_message(msg.columns_to_get)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:columns_to_get, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_search_query(acc, msg)) do
          try do
            case(msg.search_query) do
              nil ->
                acc

              _ ->
                [acc, "\"", Protox.Encode.encode_bytes(msg.search_query)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:search_query, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_routing_values(acc, msg)) do
          try do
            case(msg.routing_values) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "*", Protox.Encode.encode_bytes(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:routing_values, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      []
    )

    (
      (
        @spec decode(binary) :: {:ok, struct} | {:error, any}
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SearchRequest))
          end
        )
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
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[table_name: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[index_name: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   columns_to_get:
                     Protox.Message.merge(
                       msg.columns_to_get,
                       ExAliyunOts.TableStoreSearch.ColumnsToGet.decode!(delimited)
                     )
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[search_query: delimited], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[routing_values: msg.routing_values ++ [delimited]], rest}

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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: iodata() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStoreSearch.SearchRequest,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:table_name, {:scalar, ""}, :string},
        2 => {:index_name, {:scalar, ""}, :string},
        3 =>
          {:columns_to_get, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}},
        4 => {:search_query, {:scalar, ""}, :bytes},
        5 => {:routing_values, :unpacked, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        columns_to_get:
          {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}},
        index_name: {2, {:scalar, ""}, :string},
        routing_values: {5, :unpacked, :bytes},
        search_query: {4, {:scalar, ""}, :bytes},
        table_name: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :optional,
          name: :table_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexName",
          kind: {:scalar, ""},
          label: :optional,
          name: :index_name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnsToGet",
          kind: {:scalar, nil},
          label: :optional,
          name: :columns_to_get,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}
        },
        %{
          __struct__: Protox.Field,
          json_name: "searchQuery",
          kind: {:scalar, ""},
          label: :optional,
          name: :search_query,
          tag: 4,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "routingValues",
          kind: :unpacked,
          label: :repeated,
          name: :routing_values,
          tag: 5,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:table_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("tableName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("table_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :optional,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:index_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :index_name,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("indexName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :index_name,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("index_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexName",
             kind: {:scalar, ""},
             label: :optional,
             name: :index_name,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:columns_to_get)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: {:scalar, nil},
             label: :optional,
             name: :columns_to_get,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}
           }}
        end

        def(field_def("columnsToGet")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: {:scalar, nil},
             label: :optional,
             name: :columns_to_get,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}
           }}
        end

        def(field_def("columns_to_get")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: {:scalar, nil},
             label: :optional,
             name: :columns_to_get,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ColumnsToGet}
           }}
        end
      ),
      (
        def(field_def(:search_query)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchQuery",
             kind: {:scalar, ""},
             label: :optional,
             name: :search_query,
             tag: 4,
             type: :bytes
           }}
        end

        def(field_def("searchQuery")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchQuery",
             kind: {:scalar, ""},
             label: :optional,
             name: :search_query,
             tag: 4,
             type: :bytes
           }}
        end

        def(field_def("search_query")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchQuery",
             kind: {:scalar, ""},
             label: :optional,
             name: :search_query,
             tag: 4,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:routing_values)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "routingValues",
             kind: :unpacked,
             label: :repeated,
             name: :routing_values,
             tag: 5,
             type: :bytes
           }}
        end

        def(field_def("routingValues")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "routingValues",
             kind: :unpacked,
             label: :repeated,
             name: :routing_values,
             tag: 5,
             type: :bytes
           }}
        end

        def(field_def("routing_values")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "routingValues",
             kind: :unpacked,
             label: :repeated,
             name: :routing_values,
             tag: 5,
             type: :bytes
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

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
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:index_name)) do
        {:ok, ""}
      end,
      def(default(:columns_to_get)) do
        {:ok, nil}
      end,
      def(default(:search_query)) do
        {:ok, ""}
      end,
      def(default(:routing_values)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end