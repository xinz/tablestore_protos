# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.IndexSchema) do
  @moduledoc false
  (
    defstruct(field_schemas: [], index_setting: nil, index_sort: nil)

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
          [] |> encode_field_schemas(msg) |> encode_index_setting(msg) |> encode_index_sort(msg)
        end
      )

      []

      [
        defp(encode_field_schemas(acc, msg)) do
          try do
            case(msg.field_schemas) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\n", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:field_schemas, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_index_setting(acc, msg)) do
          try do
            case(msg.index_setting) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.index_setting)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:index_setting, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_index_sort(acc, msg)) do
          try do
            case(msg.index_sort) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_message(msg.index_sort)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:index_sort, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.IndexSchema))
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

                {[
                   field_schemas:
                     msg.field_schemas ++
                       [ExAliyunOts.TableStoreSearch.FieldSchema.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   index_setting:
                     Protox.MergeMessage.merge(
                       msg.index_setting,
                       ExAliyunOts.TableStoreSearch.IndexSetting.decode!(delimited)
                     )
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   index_sort:
                     Protox.MergeMessage.merge(
                       msg.index_sort,
                       ExAliyunOts.TableStoreSearch.Sort.decode!(delimited)
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

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStoreSearch.IndexSchema,
          &json_library_wrapper.decode!(json_library, &1)
        )
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
        1 => {:field_schemas, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        2 =>
          {:index_setting, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSetting}},
        3 => {:index_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_schemas: {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        index_setting: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSetting}},
        index_sort: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fieldSchemas",
          kind: :unpacked,
          label: :repeated,
          name: :field_schemas,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :index_setting,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.IndexSetting}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :index_sort,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.Sort}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:field_schemas)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end

        def(field_def("fieldSchemas")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end

        def(field_def("field_schemas")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSchemas",
             kind: :unpacked,
             label: :repeated,
             name: :field_schemas,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSchema}
           }}
        end
      ),
      (
        def(field_def(:index_setting)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_setting,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSetting}
           }}
        end

        def(field_def("indexSetting")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_setting,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSetting}
           }}
        end

        def(field_def("index_setting")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_setting,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSetting}
           }}
        end
      ),
      (
        def(field_def(:index_sort)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Sort}
           }}
        end

        def(field_def("indexSort")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Sort}
           }}
        end

        def(field_def("index_sort")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :index_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Sort}
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
      def(default(:field_schemas)) do
        {:error, :no_default_value}
      end,
      def(default(:index_setting)) do
        {:ok, nil}
      end,
      def(default(:index_sort)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end