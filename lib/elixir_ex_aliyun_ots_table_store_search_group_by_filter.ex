# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupByFilter) do
  @moduledoc false
  (
    defstruct(filters: [], sub_aggs: nil, sub_group_bys: nil)

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
          [] |> encode_filters(msg) |> encode_sub_aggs(msg) |> encode_sub_group_bys(msg)
        end
      )

      []

      [
        defp(encode_filters(acc, msg)) do
          try do
            case(msg.filters) do
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
              reraise(Protox.EncodingError.new(:filters, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_sub_aggs(acc, msg)) do
          try do
            case(msg.sub_aggs) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.sub_aggs)]
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
                [acc, <<26>>, Protox.Encode.encode_message(msg.sub_group_bys)]
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByFilter))
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
                   filters: msg.filters ++ [ExAliyunOts.TableStoreSearch.Query.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sub_aggs:
                     Protox.Message.merge(
                       msg.sub_aggs,
                       ExAliyunOts.TableStoreSearch.Aggregations.decode!(delimited)
                     )
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sub_group_bys:
                     Protox.Message.merge(
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
          ExAliyunOts.TableStoreSearch.GroupByFilter,
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
        1 => {:filters, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 => {:sub_aggs, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        3 => {:sub_group_bys, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        filters: {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        sub_aggs: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        sub_group_bys: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "filters",
          kind: :unpacked,
          label: :repeated,
          name: :filters,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subAggs",
          kind: {:scalar, nil},
          label: :optional,
          name: :sub_aggs,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subGroupBys",
          kind: {:scalar, nil},
          label: :optional,
          name: :sub_group_bys,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:filters)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filters",
             kind: :unpacked,
             label: :repeated,
             name: :filters,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("filters")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filters",
             kind: :unpacked,
             label: :repeated,
             name: :filters,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        []
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
             tag: 2,
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
             tag: 2,
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
             tag: 2,
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
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
      def(default(:filters)) do
        {:error, :no_default_value}
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