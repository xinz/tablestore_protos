# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitsRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, search_index_splits_options: nil)

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
          [] |> encode_table_name(msg) |> encode_search_index_splits_options(msg)
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
        defp(encode_search_index_splits_options(acc, msg)) do
          try do
            case(msg.search_index_splits_options) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.search_index_splits_options)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:search_index_splits_options, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.ComputeSplitsRequest))
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

                {[
                   search_index_splits_options:
                     Protox.Message.merge(
                       msg.search_index_splits_options,
                       ExAliyunOts.TableStore.SearchIndexSplitsOptions.decode!(delimited)
                     )
                 ], rest}

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
          ExAliyunOts.TableStore.ComputeSplitsRequest,
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
        2 =>
          {:search_index_splits_options, {:scalar, nil},
           {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        search_index_splits_options:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}},
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
          json_name: "searchIndexSplitsOptions",
          kind: {:scalar, nil},
          label: :optional,
          name: :search_index_splits_options,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}
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
        def(field_def(:search_index_splits_options)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchIndexSplitsOptions",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_index_splits_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}
           }}
        end

        def(field_def("searchIndexSplitsOptions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchIndexSplitsOptions",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_index_splits_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}
           }}
        end

        def(field_def("search_index_splits_options")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchIndexSplitsOptions",
             kind: {:scalar, nil},
             label: :optional,
             name: :search_index_splits_options,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.SearchIndexSplitsOptions}
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
      def(default(:search_index_splits_options)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end