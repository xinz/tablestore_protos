# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.SQLQueryResponse do
  @moduledoc false
  defstruct consumes: [], rows: nil, version: nil, type: nil, search_consumes: []

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
        |> encode_consumes(msg)
        |> encode_rows(msg)
        |> encode_version(msg)
        |> encode_type(msg)
        |> encode_search_consumes(msg)
      end
    )

    []

    [
      defp encode_consumes(acc, msg) do
        try do
          case msg.consumes do
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
            reraise Protox.EncodingError.new(:consumes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rows(acc, msg) do
        try do
          case msg.rows do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_bytes(msg.rows)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rows, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_version(acc, msg) do
        try do
          case msg.version do
            nil ->
              acc

            _ ->
              [
                acc,
                "\x18",
                msg.version
                |> ExAliyunOts.TableStore.SQLPayloadVersion.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:version, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type(acc, msg) do
        try do
          case msg.type do
            nil ->
              acc

            _ ->
              [
                acc,
                " ",
                msg.type
                |> ExAliyunOts.TableStore.SQLStatementType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_search_consumes(acc, msg) do
        try do
          case msg.search_consumes do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:search_consumes, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.SQLQueryResponse))
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

              {[
                 consumes:
                   msg.consumes ++
                     [ExAliyunOts.TableStore.TableConsumedCapacity.decode!(delimited)]
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[rows: delimited], rest}

            {3, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.SQLPayloadVersion)

              {[version: value], rest}

            {4, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.SQLStatementType)

              {[type: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 search_consumes:
                   msg.search_consumes ++
                     [ExAliyunOts.TableStore.SearchConsumedCapacity.decode!(delimited)]
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
        ExAliyunOts.TableStore.SQLQueryResponse,
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
        1 => {:consumes, :unpacked, {:message, ExAliyunOts.TableStore.TableConsumedCapacity}},
        2 => {:rows, {:scalar, ""}, :bytes},
        3 =>
          {:version, {:scalar, :SQL_PLAIN_BUFFER},
           {:enum, ExAliyunOts.TableStore.SQLPayloadVersion}},
        4 => {:type, {:scalar, :SQL_SELECT}, {:enum, ExAliyunOts.TableStore.SQLStatementType}},
        5 =>
          {:search_consumes, :unpacked, {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        consumes: {1, :unpacked, {:message, ExAliyunOts.TableStore.TableConsumedCapacity}},
        rows: {2, {:scalar, ""}, :bytes},
        search_consumes:
          {5, :unpacked, {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}},
        type: {4, {:scalar, :SQL_SELECT}, {:enum, ExAliyunOts.TableStore.SQLStatementType}},
        version:
          {3, {:scalar, :SQL_PLAIN_BUFFER}, {:enum, ExAliyunOts.TableStore.SQLPayloadVersion}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "consumes",
          kind: :unpacked,
          label: :repeated,
          name: :consumes,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.TableConsumedCapacity}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rows",
          kind: {:scalar, ""},
          label: :optional,
          name: :rows,
          tag: 2,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "version",
          kind: {:scalar, :SQL_PLAIN_BUFFER},
          label: :optional,
          name: :version,
          tag: 3,
          type: {:enum, ExAliyunOts.TableStore.SQLPayloadVersion}
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, :SQL_SELECT},
          label: :optional,
          name: :type,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStore.SQLStatementType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "searchConsumes",
          kind: :unpacked,
          label: :repeated,
          name: :search_consumes,
          tag: 5,
          type: {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:consumes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumes",
             kind: :unpacked,
             label: :repeated,
             name: :consumes,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableConsumedCapacity}
           }}
        end

        def field_def("consumes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumes",
             kind: :unpacked,
             label: :repeated,
             name: :consumes,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableConsumedCapacity}
           }}
        end

        []
      ),
      (
        def field_def(:rows) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rows",
             kind: {:scalar, ""},
             label: :optional,
             name: :rows,
             tag: 2,
             type: :bytes
           }}
        end

        def field_def("rows") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rows",
             kind: {:scalar, ""},
             label: :optional,
             name: :rows,
             tag: 2,
             type: :bytes
           }}
        end

        []
      ),
      (
        def field_def(:version) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, :SQL_PLAIN_BUFFER},
             label: :optional,
             name: :version,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStore.SQLPayloadVersion}
           }}
        end

        def field_def("version") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, :SQL_PLAIN_BUFFER},
             label: :optional,
             name: :version,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStore.SQLPayloadVersion}
           }}
        end

        []
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :SQL_SELECT},
             label: :optional,
             name: :type,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.SQLStatementType}
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :SQL_SELECT},
             label: :optional,
             name: :type,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStore.SQLStatementType}
           }}
        end

        []
      ),
      (
        def field_def(:search_consumes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchConsumes",
             kind: :unpacked,
             label: :repeated,
             name: :search_consumes,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}
           }}
        end

        def field_def("searchConsumes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchConsumes",
             kind: :unpacked,
             label: :repeated,
             name: :search_consumes,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}
           }}
        end

        def field_def("search_consumes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "searchConsumes",
             kind: :unpacked,
             label: :repeated,
             name: :search_consumes,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.SearchConsumedCapacity}
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
    def default(:consumes) do
      {:error, :no_default_value}
    end,
    def default(:rows) do
      {:ok, ""}
    end,
    def default(:version) do
      {:ok, :SQL_PLAIN_BUFFER}
    end,
    def default(:type) do
      {:ok, :SQL_SELECT}
    end,
    def default(:search_consumes) do
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
