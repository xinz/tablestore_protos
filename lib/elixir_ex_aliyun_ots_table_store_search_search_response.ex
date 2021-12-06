# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SearchResponse) do
  @moduledoc false
  (
    defstruct(
      total_hits: nil,
      rows: [],
      is_all_succeeded: nil,
      next_token: nil,
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
          |> encode_total_hits(msg)
          |> encode_rows(msg)
          |> encode_is_all_succeeded(msg)
          |> encode_next_token(msg)
          |> encode_aggs(msg)
          |> encode_group_bys(msg)
        end
      )

      []

      [
        defp(encode_total_hits(acc, msg)) do
          try do
            case(msg.total_hits) do
              nil ->
                acc

              _ ->
                [acc, "\b", Protox.Encode.encode_int64(msg.total_hits)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:total_hits, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_rows(acc, msg)) do
          try do
            case(msg.rows) do
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
              reraise(Protox.EncodingError.new(:rows, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_all_succeeded(acc, msg)) do
          try do
            case(msg.is_all_succeeded) do
              nil ->
                acc

              _ ->
                [acc, <<24>>, Protox.Encode.encode_bool(msg.is_all_succeeded)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:is_all_succeeded, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_next_token(acc, msg)) do
          try do
            case(msg.next_token) do
              nil ->
                acc

              _ ->
                [acc, "2", Protox.Encode.encode_bytes(msg.next_token)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:next_token, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_aggs(acc, msg)) do
          try do
            case(msg.aggs) do
              nil ->
                acc

              _ ->
                [acc, ":", Protox.Encode.encode_bytes(msg.aggs)]
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
                [acc, "B", Protox.Encode.encode_bytes(msg.group_bys)]
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SearchResponse))
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
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[total_hits: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[rows: msg.rows ++ [delimited]], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_all_succeeded: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[next_token: delimited], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[aggs: delimited], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[group_bys: delimited], rest}

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
          ExAliyunOts.TableStoreSearch.SearchResponse,
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
        1 => {:total_hits, {:scalar, 0}, :int64},
        2 => {:rows, :unpacked, :bytes},
        3 => {:is_all_succeeded, {:scalar, false}, :bool},
        6 => {:next_token, {:scalar, ""}, :bytes},
        7 => {:aggs, {:scalar, ""}, :bytes},
        8 => {:group_bys, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        aggs: {7, {:scalar, ""}, :bytes},
        group_bys: {8, {:scalar, ""}, :bytes},
        is_all_succeeded: {3, {:scalar, false}, :bool},
        next_token: {6, {:scalar, ""}, :bytes},
        rows: {2, :unpacked, :bytes},
        total_hits: {1, {:scalar, 0}, :int64}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "totalHits",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_hits,
          tag: 1,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "rows",
          kind: :unpacked,
          label: :repeated,
          name: :rows,
          tag: 2,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "isAllSucceeded",
          kind: {:scalar, false},
          label: :optional,
          name: :is_all_succeeded,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "nextToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :next_token,
          tag: 6,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "aggs",
          kind: {:scalar, ""},
          label: :optional,
          name: :aggs,
          tag: 7,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupBys",
          kind: {:scalar, ""},
          label: :optional,
          name: :group_bys,
          tag: 8,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:total_hits)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalHits",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_hits,
             tag: 1,
             type: :int64
           }}
        end

        def(field_def("totalHits")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalHits",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_hits,
             tag: 1,
             type: :int64
           }}
        end

        def(field_def("total_hits")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalHits",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_hits,
             tag: 1,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:rows)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rows",
             kind: :unpacked,
             label: :repeated,
             name: :rows,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("rows")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rows",
             kind: :unpacked,
             label: :repeated,
             name: :rows,
             tag: 2,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:is_all_succeeded)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAllSucceeded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_all_succeeded,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("isAllSucceeded")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAllSucceeded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_all_succeeded,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("is_all_succeeded")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAllSucceeded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_all_succeeded,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:next_token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 6,
             type: :bytes
           }}
        end

        def(field_def("nextToken")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 6,
             type: :bytes
           }}
        end

        def(field_def("next_token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 6,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:aggs)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggs",
             kind: {:scalar, ""},
             label: :optional,
             name: :aggs,
             tag: 7,
             type: :bytes
           }}
        end

        def(field_def("aggs")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aggs",
             kind: {:scalar, ""},
             label: :optional,
             name: :aggs,
             tag: 7,
             type: :bytes
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
             kind: {:scalar, ""},
             label: :optional,
             name: :group_bys,
             tag: 8,
             type: :bytes
           }}
        end

        def(field_def("groupBys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupBys",
             kind: {:scalar, ""},
             label: :optional,
             name: :group_bys,
             tag: 8,
             type: :bytes
           }}
        end

        def(field_def("group_bys")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupBys",
             kind: {:scalar, ""},
             label: :optional,
             name: :group_bys,
             tag: 8,
             type: :bytes
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
      def(default(:total_hits)) do
        {:ok, 0}
      end,
      def(default(:rows)) do
        {:error, :no_default_value}
      end,
      def(default(:is_all_succeeded)) do
        {:ok, false}
      end,
      def(default(:next_token)) do
        {:ok, ""}
      end,
      def(default(:aggs)) do
        {:ok, ""}
      end,
      def(default(:group_bys)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end