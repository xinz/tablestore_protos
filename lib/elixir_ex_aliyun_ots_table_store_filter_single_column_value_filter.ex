# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.SingleColumnValueFilter) do
  @moduledoc false
  (
    defstruct(
      comparator: nil,
      column_name: nil,
      column_value: nil,
      filter_if_missing: nil,
      latest_version_only: nil,
      value_trans_rule: nil
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
          |> encode_comparator(msg)
          |> encode_column_name(msg)
          |> encode_column_value(msg)
          |> encode_filter_if_missing(msg)
          |> encode_latest_version_only(msg)
          |> encode_value_trans_rule(msg)
        end
      )

      []

      [
        defp(encode_comparator(acc, msg)) do
          try do
            case(msg.comparator) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:comparator]))

              _ ->
                [
                  acc,
                  "\b",
                  msg.comparator
                  |> ExAliyunOts.TableStoreFilter.ComparatorType.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:comparator, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_column_name(acc, msg)) do
          try do
            case(msg.column_name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:column_name]))

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.column_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:column_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_column_value(acc, msg)) do
          try do
            case(msg.column_value) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:column_value]))

              _ ->
                [acc, <<26>>, Protox.Encode.encode_bytes(msg.column_value)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:column_value, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_filter_if_missing(acc, msg)) do
          try do
            case(msg.filter_if_missing) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:filter_if_missing]))

              _ ->
                [acc, " ", Protox.Encode.encode_bool(msg.filter_if_missing)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:filter_if_missing, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_latest_version_only(acc, msg)) do
          try do
            case(msg.latest_version_only) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:latest_version_only]))

              _ ->
                [acc, "(", Protox.Encode.encode_bool(msg.latest_version_only)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:latest_version_only, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_value_trans_rule(acc, msg)) do
          try do
            case(msg.value_trans_rule) do
              nil ->
                acc

              _ ->
                [acc, "2", Protox.Encode.encode_message(msg.value_trans_rule)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:value_trans_rule, "invalid field value"),
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

                {[:comparator | set_fields], [comparator: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:column_name | set_fields], [column_name: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:column_value | set_fields], [column_value: delimited], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[:filter_if_missing | set_fields], [filter_if_missing: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[:latest_version_only | set_fields], [latest_version_only: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:value_trans_rule | set_fields],
                 [
                   value_trans_rule:
                     Protox.MergeMessage.merge(
                       msg.value_trans_rule,
                       ExAliyunOts.TableStoreFilter.ValueTransferRule.decode!(delimited)
                     )
                 ], rest}

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
          ExAliyunOts.TableStoreFilter.SingleColumnValueFilter,
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
        1 =>
          {:comparator, {:scalar, :CT_EQUAL},
           {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}},
        2 => {:column_name, {:scalar, ""}, :string},
        3 => {:column_value, {:scalar, ""}, :bytes},
        4 => {:filter_if_missing, {:scalar, false}, :bool},
        5 => {:latest_version_only, {:scalar, false}, :bool},
        6 =>
          {:value_trans_rule, {:scalar, nil},
           {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        column_name: {2, {:scalar, ""}, :string},
        column_value: {3, {:scalar, ""}, :bytes},
        comparator:
          {1, {:scalar, :CT_EQUAL}, {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}},
        filter_if_missing: {4, {:scalar, false}, :bool},
        latest_version_only: {5, {:scalar, false}, :bool},
        value_trans_rule:
          {6, {:scalar, nil}, {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "comparator",
          kind: {:scalar, :CT_EQUAL},
          label: :required,
          name: :comparator,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnName",
          kind: {:scalar, ""},
          label: :required,
          name: :column_name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "columnValue",
          kind: {:scalar, ""},
          label: :required,
          name: :column_value,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "filterIfMissing",
          kind: {:scalar, false},
          label: :required,
          name: :filter_if_missing,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "latestVersionOnly",
          kind: {:scalar, false},
          label: :required,
          name: :latest_version_only,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "valueTransRule",
          kind: {:scalar, nil},
          label: :optional,
          name: :value_trans_rule,
          tag: 6,
          type: {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:comparator)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "comparator",
             kind: {:scalar, :CT_EQUAL},
             label: :required,
             name: :comparator,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}
           }}
        end

        def(field_def("comparator")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "comparator",
             kind: {:scalar, :CT_EQUAL},
             label: :required,
             name: :comparator,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.ComparatorType}
           }}
        end

        []
      ),
      (
        def(field_def(:column_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :required,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("columnName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :required,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("column_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnName",
             kind: {:scalar, ""},
             label: :required,
             name: :column_name,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:column_value)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnValue",
             kind: {:scalar, ""},
             label: :required,
             name: :column_value,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("columnValue")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnValue",
             kind: {:scalar, ""},
             label: :required,
             name: :column_value,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("column_value")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "columnValue",
             kind: {:scalar, ""},
             label: :required,
             name: :column_value,
             tag: 3,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:filter_if_missing)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterIfMissing",
             kind: {:scalar, false},
             label: :required,
             name: :filter_if_missing,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("filterIfMissing")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterIfMissing",
             kind: {:scalar, false},
             label: :required,
             name: :filter_if_missing,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("filter_if_missing")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterIfMissing",
             kind: {:scalar, false},
             label: :required,
             name: :filter_if_missing,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:latest_version_only)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "latestVersionOnly",
             kind: {:scalar, false},
             label: :required,
             name: :latest_version_only,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("latestVersionOnly")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "latestVersionOnly",
             kind: {:scalar, false},
             label: :required,
             name: :latest_version_only,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("latest_version_only")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "latestVersionOnly",
             kind: {:scalar, false},
             label: :required,
             name: :latest_version_only,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:value_trans_rule)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valueTransRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :value_trans_rule,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}
           }}
        end

        def(field_def("valueTransRule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valueTransRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :value_trans_rule,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}
           }}
        end

        def(field_def("value_trans_rule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "valueTransRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :value_trans_rule,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreFilter.ValueTransferRule}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

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
      def(default(:value_trans_rule)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end