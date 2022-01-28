# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupByHistogram) do
  @moduledoc false
  (
    defstruct(
      field_name: nil,
      interval: nil,
      missing: nil,
      min_doc_count: nil,
      sort: nil,
      field_range: nil,
      sub_aggs: nil,
      sub_group_bys: nil
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
          |> encode_field_name(msg)
          |> encode_interval(msg)
          |> encode_missing(msg)
          |> encode_min_doc_count(msg)
          |> encode_sort(msg)
          |> encode_field_range(msg)
          |> encode_sub_aggs(msg)
          |> encode_sub_group_bys(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          try do
            case(msg.field_name) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.field_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:field_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_interval(acc, msg)) do
          try do
            case(msg.interval) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_bytes(msg.interval)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:interval, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_missing(acc, msg)) do
          try do
            case(msg.missing) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_bytes(msg.missing)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:missing, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_min_doc_count(acc, msg)) do
          try do
            case(msg.min_doc_count) do
              nil ->
                acc

              _ ->
                [acc, " ", Protox.Encode.encode_int64(msg.min_doc_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:min_doc_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_sort(acc, msg)) do
          try do
            case(msg.sort) do
              nil ->
                acc

              _ ->
                [acc, "*", Protox.Encode.encode_message(msg.sort)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sort, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_field_range(acc, msg)) do
          try do
            case(msg.field_range) do
              nil ->
                acc

              _ ->
                [acc, "2", Protox.Encode.encode_message(msg.field_range)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:field_range, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_sub_aggs(acc, msg)) do
          try do
            case(msg.sub_aggs) do
              nil ->
                acc

              _ ->
                [acc, ":", Protox.Encode.encode_message(msg.sub_aggs)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sub_aggs, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_sub_group_bys(acc, msg)) do
          try do
            case(msg.sub_group_bys) do
              nil ->
                acc

              _ ->
                [acc, "B", Protox.Encode.encode_message(msg.sub_group_bys)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:sub_group_bys, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByHistogram))
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
                {[field_name: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[interval: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[missing: delimited], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[min_doc_count: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sort:
                     Protox.MergeMessage.merge(
                       msg.sort,
                       ExAliyunOts.TableStoreSearch.GroupBySort.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   field_range:
                     Protox.MergeMessage.merge(
                       msg.field_range,
                       ExAliyunOts.TableStoreSearch.FieldRange.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sub_aggs:
                     Protox.MergeMessage.merge(
                       msg.sub_aggs,
                       ExAliyunOts.TableStoreSearch.Aggregations.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sub_group_bys:
                     Protox.MergeMessage.merge(
                       msg.sub_group_bys,
                       ExAliyunOts.TableStoreSearch.GroupBys.decode!(delimited)
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
          ExAliyunOts.TableStoreSearch.GroupByHistogram,
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
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:interval, {:scalar, ""}, :bytes},
        3 => {:missing, {:scalar, ""}, :bytes},
        4 => {:min_doc_count, {:scalar, 0}, :int64},
        5 => {:sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBySort}},
        6 => {:field_range, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldRange}},
        7 => {:sub_aggs, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        8 => {:sub_group_bys, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:scalar, ""}, :string},
        field_range: {6, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldRange}},
        interval: {2, {:scalar, ""}, :bytes},
        min_doc_count: {4, {:scalar, 0}, :int64},
        missing: {3, {:scalar, ""}, :bytes},
        sort: {5, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBySort}},
        sub_aggs: {7, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        sub_group_bys: {8, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
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
          json_name: "interval",
          kind: {:scalar, ""},
          label: :optional,
          name: :interval,
          tag: 2,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "missing",
          kind: {:scalar, ""},
          label: :optional,
          name: :missing,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "minDocCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :min_doc_count,
          tag: 4,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "sort",
          kind: {:scalar, nil},
          label: :optional,
          name: :sort,
          tag: 5,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupBySort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldRange",
          kind: {:scalar, nil},
          label: :optional,
          name: :field_range,
          tag: 6,
          type: {:message, ExAliyunOts.TableStoreSearch.FieldRange}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subAggs",
          kind: {:scalar, nil},
          label: :optional,
          name: :sub_aggs,
          tag: 7,
          type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subGroupBys",
          kind: {:scalar, nil},
          label: :optional,
          name: :sub_group_bys,
          tag: 8,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:field_name)) do
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

        def(field_def("fieldName")) do
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

        def(field_def("field_name")) do
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
        def(field_def(:interval)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "interval",
             kind: {:scalar, ""},
             label: :optional,
             name: :interval,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("interval")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "interval",
             kind: {:scalar, ""},
             label: :optional,
             name: :interval,
             tag: 2,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:missing)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missing",
             kind: {:scalar, ""},
             label: :optional,
             name: :missing,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("missing")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missing",
             kind: {:scalar, ""},
             label: :optional,
             name: :missing,
             tag: 3,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:min_doc_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minDocCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_doc_count,
             tag: 4,
             type: :int64
           }}
        end

        def(field_def("minDocCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minDocCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_doc_count,
             tag: 4,
             type: :int64
           }}
        end

        def(field_def("min_doc_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minDocCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_doc_count,
             tag: 4,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:sort)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sort",
             kind: {:scalar, nil},
             label: :optional,
             name: :sort,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBySort}
           }}
        end

        def(field_def("sort")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sort",
             kind: {:scalar, nil},
             label: :optional,
             name: :sort,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBySort}
           }}
        end

        []
      ),
      (
        def(field_def(:field_range)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_range,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldRange}
           }}
        end

        def(field_def("fieldRange")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_range,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldRange}
           }}
        end

        def(field_def("field_range")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldRange",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_range,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldRange}
           }}
        end
      ),
      (
        def(field_def(:sub_aggs)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggs",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_aggs,
             tag: 7,
             type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
           }}
        end

        def(field_def("subAggs")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggs",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_aggs,
             tag: 7,
             type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
           }}
        end

        def(field_def("sub_aggs")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggs",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_aggs,
             tag: 7,
             type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
           }}
        end
      ),
      (
        def(field_def(:sub_group_bys)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subGroupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_group_bys,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
           }}
        end

        def(field_def("subGroupBys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subGroupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_group_bys,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
           }}
        end

        def(field_def("sub_group_bys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subGroupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_group_bys,
             tag: 8,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
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
      def(default(:field_name)) do
        {:ok, ""}
      end,
      def(default(:interval)) do
        {:ok, ""}
      end,
      def(default(:missing)) do
        {:ok, ""}
      end,
      def(default(:min_doc_count)) do
        {:ok, 0}
      end,
      def(default(:sort)) do
        {:ok, nil}
      end,
      def(default(:field_range)) do
        {:ok, nil}
      end,
      def(default(:sub_aggs)) do
        {:ok, nil}
      end,
      def(default(:sub_group_bys)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end