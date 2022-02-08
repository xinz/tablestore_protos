# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.CreateIndexRequest) do
  @moduledoc false
  defstruct(main_table_name: nil, index_meta: nil, include_base_data: nil)

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
        |> encode_main_table_name(msg)
        |> encode_index_meta(msg)
        |> encode_include_base_data(msg)
      end
    )

    []

    [
      defp(encode_main_table_name(acc, msg)) do
        try do
          case(msg.main_table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:main_table_name]))

            _ ->
              [acc, "\n", Protox.Encode.encode_string(msg.main_table_name)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:main_table_name, "invalid field value"),
              __STACKTRACE__
            )
        end
      end,
      defp(encode_index_meta(acc, msg)) do
        try do
          case(msg.index_meta) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:index_meta]))

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(msg.index_meta)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:index_meta, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_include_base_data(acc, msg)) do
        try do
          case(msg.include_base_data) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_bool(msg.include_base_data)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:include_base_data, "invalid field value"),
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
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.CreateIndexRequest))

          case([:main_table_name, :index_meta] -- set_fields) do
            [] ->
              msg

            missing_fields ->
              raise(Protox.RequiredFieldsError.new(missing_fields))
          end
        end
      )
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:main_table_name | set_fields], [main_table_name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:index_meta | set_fields],
               [
                 index_meta:
                   Protox.MergeMessage.merge(
                     msg.index_meta,
                     ExAliyunOts.TableStore.IndexMeta.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[:include_base_data | set_fields], [include_base_data: value], rest}

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
        ExAliyunOts.TableStore.CreateIndexRequest,
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

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:main_table_name, {:scalar, ""}, :string},
        2 => {:index_meta, {:scalar, nil}, {:message, ExAliyunOts.TableStore.IndexMeta}},
        3 => {:include_base_data, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        include_base_data: {3, {:scalar, false}, :bool},
        index_meta: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStore.IndexMeta}},
        main_table_name: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mainTableName",
          kind: {:scalar, ""},
          label: :required,
          name: :main_table_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexMeta",
          kind: {:scalar, nil},
          label: :required,
          name: :index_meta,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.IndexMeta}
        },
        %{
          __struct__: Protox.Field,
          json_name: "includeBaseData",
          kind: {:scalar, false},
          label: :optional,
          name: :include_base_data,
          tag: 3,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:main_table_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainTableName",
             kind: {:scalar, ""},
             label: :required,
             name: :main_table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("mainTableName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainTableName",
             kind: {:scalar, ""},
             label: :required,
             name: :main_table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("main_table_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainTableName",
             kind: {:scalar, ""},
             label: :required,
             name: :main_table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:index_meta)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :index_meta,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end

        def(field_def("indexMeta")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :index_meta,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end

        def(field_def("index_meta")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexMeta",
             kind: {:scalar, nil},
             label: :required,
             name: :index_meta,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.IndexMeta}
           }}
        end
      ),
      (
        def(field_def(:include_base_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeBaseData",
             kind: {:scalar, false},
             label: :optional,
             name: :include_base_data,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("includeBaseData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeBaseData",
             kind: {:scalar, false},
             label: :optional,
             name: :include_base_data,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("include_base_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeBaseData",
             kind: {:scalar, false},
             label: :optional,
             name: :include_base_data,
             tag: 3,
             type: :bool
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: [:main_table_name | :index_meta]
    def(required_fields()) do
      [:main_table_name, :index_meta]
    end
  )

  (
    @spec syntax() :: atom()
    def(syntax()) do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def(default(:main_table_name)) do
      {:ok, ""}
    end,
    def(default(:index_meta)) do
      {:ok, nil}
    end,
    def(default(:include_base_data)) do
      {:ok, false}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end