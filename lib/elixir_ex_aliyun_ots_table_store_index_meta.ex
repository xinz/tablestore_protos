# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.IndexMeta do
  @moduledoc false
  defstruct name: nil,
            primary_key: [],
            defined_column: [],
            index_update_mode: nil,
            index_type: nil

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
        |> encode_name(msg)
        |> encode_primary_key(msg)
        |> encode_defined_column(msg)
        |> encode_index_update_mode(msg)
        |> encode_index_type(msg)
      end
    )

    []

    [
      defp encode_name(acc, msg) do
        try do
          case msg.name do
            nil -> raise Protox.RequiredFieldsError.new([:name])
            _ -> [acc, "\n", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_primary_key(acc, msg) do
        try do
          case msg.primary_key do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:primary_key, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_defined_column(acc, msg) do
        try do
          case msg.defined_column do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x1A", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:defined_column, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_index_update_mode(acc, msg) do
        try do
          case msg.index_update_mode do
            nil ->
              raise Protox.RequiredFieldsError.new([:index_update_mode])

            _ ->
              [
                acc,
                " ",
                msg.index_update_mode
                |> ExAliyunOts.TableStore.IndexUpdateMode.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_update_mode, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_index_type(acc, msg) do
        try do
          case msg.index_type do
            nil ->
              raise Protox.RequiredFieldsError.new([:index_type])

            _ ->
              [
                acc,
                "(",
                msg.index_type
                |> ExAliyunOts.TableStore.IndexType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:index_type, "invalid field value"), __STACKTRACE__
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
          {msg, set_fields} = parse_key_value([], bytes, struct(ExAliyunOts.TableStore.IndexMeta))

          case [:name, :index_update_mode, :index_type] -- set_fields do
            [] -> msg
            missing_fields -> raise Protox.RequiredFieldsError.new(missing_fields)
          end
        end
      )
    )

    (
      @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
      defp parse_key_value(set_fields, <<>>, msg) do
        {msg, set_fields}
      end

      defp parse_key_value(set_fields, bytes, msg) do
        {new_set_fields, field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:name | set_fields], [name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:primary_key | set_fields], [primary_key: msg.primary_key ++ [delimited]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:defined_column | set_fields],
               [defined_column: msg.defined_column ++ [delimited]], rest}

            {4, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.IndexUpdateMode)

              {[:index_update_mode | set_fields], [index_update_mode: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.IndexType)
              {[:index_type | set_fields], [index_type: value], rest}

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
        ExAliyunOts.TableStore.IndexMeta,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:primary_key, :unpacked, :string},
        3 => {:defined_column, :unpacked, :string},
        4 =>
          {:index_update_mode, {:scalar, :IUM_ASYNC_INDEX},
           {:enum, ExAliyunOts.TableStore.IndexUpdateMode}},
        5 => {:index_type, {:scalar, :IT_GLOBAL_INDEX}, {:enum, ExAliyunOts.TableStore.IndexType}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        defined_column: {3, :unpacked, :string},
        index_type: {5, {:scalar, :IT_GLOBAL_INDEX}, {:enum, ExAliyunOts.TableStore.IndexType}},
        index_update_mode:
          {4, {:scalar, :IUM_ASYNC_INDEX}, {:enum, ExAliyunOts.TableStore.IndexUpdateMode}},
        name: {1, {:scalar, ""}, :string},
        primary_key: {2, :unpacked, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :required,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "primaryKey",
          kind: :unpacked,
          label: :repeated,
          name: :primary_key,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "definedColumn",
          kind: :unpacked,
          label: :repeated,
          name: :defined_column,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexUpdateMode",
          kind: {:scalar, :IUM_ASYNC_INDEX},
          label: :required,
          name: :index_update_mode,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStore.IndexUpdateMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexType",
          kind: {:scalar, :IT_GLOBAL_INDEX},
          label: :required,
          name: :index_type,
          tag: 5,
          type: {:enum, ExAliyunOts.TableStore.IndexType}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :required,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :required,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:primary_key) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :string
           }}
        end

        def field_def("primaryKey") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :string
           }}
        end

        def field_def("primary_key") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:defined_column) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "definedColumn",
             kind: :unpacked,
             label: :repeated,
             name: :defined_column,
             tag: 3,
             type: :string
           }}
        end

        def field_def("definedColumn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "definedColumn",
             kind: :unpacked,
             label: :repeated,
             name: :defined_column,
             tag: 3,
             type: :string
           }}
        end

        def field_def("defined_column") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "definedColumn",
             kind: :unpacked,
             label: :repeated,
             name: :defined_column,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:index_update_mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexUpdateMode",
             kind: {:scalar, :IUM_ASYNC_INDEX},
             label: :required,
             name: :index_update_mode,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.IndexUpdateMode}
           }}
        end

        def field_def("indexUpdateMode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexUpdateMode",
             kind: {:scalar, :IUM_ASYNC_INDEX},
             label: :required,
             name: :index_update_mode,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.IndexUpdateMode}
           }}
        end

        def field_def("index_update_mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexUpdateMode",
             kind: {:scalar, :IUM_ASYNC_INDEX},
             label: :required,
             name: :index_update_mode,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.IndexUpdateMode}
           }}
        end
      ),
      (
        def field_def(:index_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexType",
             kind: {:scalar, :IT_GLOBAL_INDEX},
             label: :required,
             name: :index_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStore.IndexType}
           }}
        end

        def field_def("indexType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexType",
             kind: {:scalar, :IT_GLOBAL_INDEX},
             label: :required,
             name: :index_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStore.IndexType}
           }}
        end

        def field_def("index_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexType",
             kind: {:scalar, :IT_GLOBAL_INDEX},
             label: :required,
             name: :index_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStore.IndexType}
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
    @spec required_fields() :: [(:name | :index_update_mode) | :index_type]
    def required_fields() do
      [:name, :index_update_mode, :index_type]
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
    def default(:name) do
      {:ok, ""}
    end,
    def default(:primary_key) do
      {:error, :no_default_value}
    end,
    def default(:defined_column) do
      {:error, :no_default_value}
    end,
    def default(:index_update_mode) do
      {:ok, :IUM_ASYNC_INDEX}
    end,
    def default(:index_type) do
      {:ok, :IT_GLOBAL_INDEX}
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
