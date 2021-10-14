# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SearchQuery) do
  @moduledoc false
  (
    defstruct(
      offset: nil,
      limit: nil,
      query: nil,
      collapse: nil,
      sort: nil,
      getTotalCount: nil,
      token: nil,
      aggs: nil,
      group_bys: nil
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
          |> encode_offset(msg)
          |> encode_limit(msg)
          |> encode_query(msg)
          |> encode_collapse(msg)
          |> encode_sort(msg)
          |> encode_getTotalCount(msg)
          |> encode_token(msg)
          |> encode_aggs(msg)
          |> encode_group_bys(msg)
        end
      )

      []

      [
        defp(encode_offset(acc, msg)) do
          try do
            case(msg.offset) do
              nil ->
                acc

              _ ->
                [acc, "\b", Protox.Encode.encode_int32(msg.offset)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:offset, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_limit(acc, msg)) do
          try do
            case(msg.limit) do
              nil ->
                acc

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int32(msg.limit)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:limit, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_query(acc, msg)) do
          try do
            case(msg.query) do
              nil ->
                acc

              _ ->
                [acc, "\"", Protox.Encode.encode_message(msg.query)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_collapse(acc, msg)) do
          try do
            case(msg.collapse) do
              nil ->
                acc

              _ ->
                [acc, "*", Protox.Encode.encode_message(msg.collapse)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:collapse, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_sort(acc, msg)) do
          try do
            case(msg.sort) do
              nil ->
                acc

              _ ->
                [acc, "2", Protox.Encode.encode_message(msg.sort)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sort, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_getTotalCount(acc, msg)) do
          try do
            case(msg.getTotalCount) do
              nil ->
                acc

              _ ->
                [acc, "@", Protox.Encode.encode_bool(msg.getTotalCount)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:getTotalCount, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_token(acc, msg)) do
          try do
            case(msg.token) do
              nil ->
                acc

              _ ->
                [acc, "J", Protox.Encode.encode_bytes(msg.token)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_aggs(acc, msg)) do
          try do
            case(msg.aggs) do
              nil ->
                acc

              _ ->
                [acc, "R", Protox.Encode.encode_message(msg.aggs)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:aggs, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_group_bys(acc, msg)) do
          try do
            case(msg.group_bys) do
              nil ->
                acc

              _ ->
                [acc, "Z", Protox.Encode.encode_message(msg.group_bys)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:group_bys, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SearchQuery))
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[offset: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[limit: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   query:
                     Protox.Message.merge(
                       msg.query,
                       ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   collapse:
                     Protox.Message.merge(
                       msg.collapse,
                       ExAliyunOts.TableStoreSearch.Collapse.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sort:
                     Protox.Message.merge(
                       msg.sort,
                       ExAliyunOts.TableStoreSearch.Sort.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[getTotalCount: value], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[token: delimited], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   aggs:
                     Protox.Message.merge(
                       msg.aggs,
                       ExAliyunOts.TableStoreSearch.Aggregations.decode!(delimited)
                     )
                 ], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   group_bys:
                     Protox.Message.merge(
                       msg.group_bys,
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
          ExAliyunOts.TableStoreSearch.SearchQuery,
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
        1 => {:offset, {:scalar, 0}, :int32},
        2 => {:limit, {:scalar, 0}, :int32},
        4 => {:query, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        5 => {:collapse, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Collapse}},
        6 => {:sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}},
        8 => {:getTotalCount, {:scalar, false}, :bool},
        9 => {:token, {:scalar, ""}, :bytes},
        10 => {:aggs, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        11 => {:group_bys, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        aggs: {10, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Aggregations}},
        collapse: {5, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Collapse}},
        getTotalCount: {8, {:scalar, false}, :bool},
        group_bys: {11, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupBys}},
        limit: {2, {:scalar, 0}, :int32},
        offset: {1, {:scalar, 0}, :int32},
        query: {4, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        sort: {6, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}},
        token: {9, {:scalar, ""}, :bytes}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "offset",
          kind: {:scalar, 0},
          label: :optional,
          name: :offset,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "limit",
          kind: {:scalar, 0},
          label: :optional,
          name: :limit,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 4,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collapse",
          kind: {:scalar, nil},
          label: :optional,
          name: :collapse,
          tag: 5,
          type: {:message, ExAliyunOts.TableStoreSearch.Collapse}
        },
        %{
          __struct__: Protox.Field,
          json_name: "sort",
          kind: {:scalar, nil},
          label: :optional,
          name: :sort,
          tag: 6,
          type: {:message, ExAliyunOts.TableStoreSearch.Sort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "getTotalCount",
          kind: {:scalar, false},
          label: :optional,
          name: :getTotalCount,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: {:scalar, ""},
          label: :optional,
          name: :token,
          tag: 9,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggs",
          kind: {:scalar, nil},
          label: :optional,
          name: :aggs,
          tag: 10,
          type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupBys",
          kind: {:scalar, nil},
          label: :optional,
          name: :group_bys,
          tag: 11,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:offset)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "offset",
             kind: {:scalar, 0},
             label: :optional,
             name: :offset,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("offset")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "offset",
             kind: {:scalar, 0},
             label: :optional,
             name: :offset,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:limit)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limit",
             kind: {:scalar, 0},
             label: :optional,
             name: :limit,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("limit")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limit",
             kind: {:scalar, 0},
             label: :optional,
             name: :limit,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:query)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("query")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        []
      ),
      (
        def(field_def(:collapse)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collapse",
             kind: {:scalar, nil},
             label: :optional,
             name: :collapse,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.Collapse}
           }}
        end

        def(field_def("collapse")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collapse",
             kind: {:scalar, nil},
             label: :optional,
             name: :collapse,
             tag: 5,
             type: {:message, ExAliyunOts.TableStoreSearch.Collapse}
           }}
        end

        []
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
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.Sort}
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
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.Sort}
           }}
        end

        []
      ),
      (
        def(field_def(:getTotalCount)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "getTotalCount",
             kind: {:scalar, false},
             label: :optional,
             name: :getTotalCount,
             tag: 8,
             type: :bool
           }}
        end

        def(field_def("getTotalCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "getTotalCount",
             kind: {:scalar, false},
             label: :optional,
             name: :getTotalCount,
             tag: 8,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 9,
             type: :bytes
           }}
        end

        def(field_def("token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 9,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:aggs)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggs",
             kind: {:scalar, nil},
             label: :optional,
             name: :aggs,
             tag: 10,
             type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
           }}
        end

        def(field_def("aggs")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggs",
             kind: {:scalar, nil},
             label: :optional,
             name: :aggs,
             tag: 10,
             type: {:message, ExAliyunOts.TableStoreSearch.Aggregations}
           }}
        end

        []
      ),
      (
        def(field_def(:group_bys)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_bys,
             tag: 11,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
           }}
        end

        def(field_def("groupBys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_bys,
             tag: 11,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupBys}
           }}
        end

        def(field_def("group_bys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupBys",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_bys,
             tag: 11,
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
      def(default(:offset)) do
        {:ok, 0}
      end,
      def(default(:limit)) do
        {:ok, 0}
      end,
      def(default(:query)) do
        {:ok, nil}
      end,
      def(default(:collapse)) do
        {:ok, nil}
      end,
      def(default(:sort)) do
        {:ok, nil}
      end,
      def(default(:getTotalCount)) do
        {:ok, false}
      end,
      def(default(:token)) do
        {:ok, ""}
      end,
      def(default(:aggs)) do
        {:ok, nil}
      end,
      def(default(:group_bys)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end