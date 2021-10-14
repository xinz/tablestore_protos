# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TableInBatchGetRowRequest) do
  @moduledoc false
  (
    defstruct(
      table_name: nil,
      primary_key: [],
      token: [],
      columns_to_get: [],
      time_range: nil,
      max_versions: nil,
      filter: nil,
      start_column: nil,
      end_column: nil
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
          |> encode_primary_key(msg)
          |> encode_token(msg)
          |> encode_columns_to_get(msg)
          |> encode_time_range(msg)
          |> encode_max_versions(msg)
          |> encode_filter(msg)
          |> encode_start_column(msg)
          |> encode_end_column(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          try do
            case(msg.table_name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:table_name]))

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
        defp(encode_primary_key(acc, msg)) do
          try do
            case(msg.primary_key) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_bytes(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:primary_key, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_token(acc, msg)) do
          try do
            case(msg.token) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_bytes(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_columns_to_get(acc, msg)) do
          try do
            case(msg.columns_to_get) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:columns_to_get, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_time_range(acc, msg)) do
          try do
            case(msg.time_range) do
              nil ->
                acc

              _ ->
                [acc, "*", Protox.Encode.encode_message(msg.time_range)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:time_range, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_max_versions(acc, msg)) do
          try do
            case(msg.max_versions) do
              nil ->
                acc

              _ ->
                [acc, "0", Protox.Encode.encode_int32(msg.max_versions)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:max_versions, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_filter(acc, msg)) do
          try do
            case(msg.filter) do
              nil ->
                acc

              _ ->
                [acc, "B", Protox.Encode.encode_bytes(msg.filter)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:filter, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_start_column(acc, msg)) do
          try do
            case(msg.start_column) do
              nil ->
                acc

              _ ->
                [acc, "J", Protox.Encode.encode_string(msg.start_column)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:start_column, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_end_column(acc, msg)) do
          try do
            case(msg.end_column) do
              nil ->
                acc

              _ ->
                [acc, "R", Protox.Encode.encode_string(msg.end_column)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:end_column, "invalid field value"),
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.TableInBatchGetRowRequest))

            case([:table_name] -- set_fields) do
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
                {[:table_name | set_fields], [table_name: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:primary_key | set_fields], [primary_key: msg.primary_key ++ [delimited]], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:token | set_fields], [token: msg.token ++ [delimited]], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:columns_to_get | set_fields],
                 [columns_to_get: msg.columns_to_get ++ [delimited]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:time_range | set_fields],
                 [
                   time_range:
                     Protox.Message.merge(
                       msg.time_range,
                       ExAliyunOts.TableStore.TimeRange.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[:max_versions | set_fields], [max_versions: value], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:filter | set_fields], [filter: delimited], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:start_column | set_fields], [start_column: delimited], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:end_column | set_fields], [end_column: delimited], rest}

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
          ExAliyunOts.TableStore.TableInBatchGetRowRequest,
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
        2 => {:primary_key, :unpacked, :bytes},
        3 => {:token, :unpacked, :bytes},
        4 => {:columns_to_get, :unpacked, :string},
        5 => {:time_range, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TimeRange}},
        6 => {:max_versions, {:scalar, 0}, :int32},
        8 => {:filter, {:scalar, ""}, :bytes},
        9 => {:start_column, {:scalar, ""}, :string},
        10 => {:end_column, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        columns_to_get: {4, :unpacked, :string},
        end_column: {10, {:scalar, ""}, :string},
        filter: {8, {:scalar, ""}, :bytes},
        max_versions: {6, {:scalar, 0}, :int32},
        primary_key: {2, :unpacked, :bytes},
        start_column: {9, {:scalar, ""}, :string},
        table_name: {1, {:scalar, ""}, :string},
        time_range: {5, {:scalar, nil}, {:message, ExAliyunOts.TableStore.TimeRange}},
        token: {3, :unpacked, :bytes}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :required,
          name: :table_name,
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
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: :unpacked,
          label: :repeated,
          name: :token,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnsToGet",
          kind: :unpacked,
          label: :repeated,
          name: :columns_to_get,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "timeRange",
          kind: {:scalar, nil},
          label: :optional,
          name: :time_range,
          tag: 5,
          type: {:message, ExAliyunOts.TableStore.TimeRange}
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxVersions",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_versions,
          tag: 6,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "filter",
          kind: {:scalar, ""},
          label: :optional,
          name: :filter,
          tag: 8,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "startColumn",
          kind: {:scalar, ""},
          label: :optional,
          name: :start_column,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "endColumn",
          kind: {:scalar, ""},
          label: :optional,
          name: :end_column,
          tag: 10,
          type: :string
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
             label: :required,
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
             label: :required,
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
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:primary_key)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("primaryKey")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("primary_key")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: :unpacked,
             label: :repeated,
             name: :primary_key,
             tag: 2,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: :unpacked,
             label: :repeated,
             name: :token,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: :unpacked,
             label: :repeated,
             name: :token,
             tag: 3,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:columns_to_get)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: :unpacked,
             label: :repeated,
             name: :columns_to_get,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("columnsToGet")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: :unpacked,
             label: :repeated,
             name: :columns_to_get,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("columns_to_get")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnsToGet",
             kind: :unpacked,
             label: :repeated,
             name: :columns_to_get,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:time_range)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :time_range,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.TimeRange}
           }}
        end

        def(field_def("timeRange")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :time_range,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.TimeRange}
           }}
        end

        def(field_def("time_range")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :time_range,
             tag: 5,
             type: {:message, ExAliyunOts.TableStore.TimeRange}
           }}
        end
      ),
      (
        def(field_def(:max_versions)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 6,
             type: :int32
           }}
        end

        def(field_def("maxVersions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 6,
             type: :int32
           }}
        end

        def(field_def("max_versions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 6,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:filter)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, ""},
             label: :optional,
             name: :filter,
             tag: 8,
             type: :bytes
           }}
        end

        def(field_def("filter")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, ""},
             label: :optional,
             name: :filter,
             tag: 8,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:start_column)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :start_column,
             tag: 9,
             type: :string
           }}
        end

        def(field_def("startColumn")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :start_column,
             tag: 9,
             type: :string
           }}
        end

        def(field_def("start_column")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :start_column,
             tag: 9,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:end_column)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :end_column,
             tag: 10,
             type: :string
           }}
        end

        def(field_def("endColumn")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :end_column,
             tag: 10,
             type: :string
           }}
        end

        def(field_def("end_column")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endColumn",
             kind: {:scalar, ""},
             label: :optional,
             name: :end_column,
             tag: 10,
             type: :string
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:table_name]
    def(required_fields()) do
      [:table_name]
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
      def(default(:primary_key)) do
        {:error, :no_default_value}
      end,
      def(default(:token)) do
        {:error, :no_default_value}
      end,
      def(default(:columns_to_get)) do
        {:error, :no_default_value}
      end,
      def(default(:time_range)) do
        {:ok, nil}
      end,
      def(default(:max_versions)) do
        {:ok, 0}
      end,
      def(default(:filter)) do
        {:ok, ""}
      end,
      def(default(:start_column)) do
        {:ok, ""}
      end,
      def(default(:end_column)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end