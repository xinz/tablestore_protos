# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.BoolQuery) do
  @moduledoc false
  (
    defstruct(
      must_queries: [],
      must_not_queries: [],
      filter_queries: [],
      should_queries: [],
      minimum_should_match: nil
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
          |> encode_must_queries(msg)
          |> encode_must_not_queries(msg)
          |> encode_filter_queries(msg)
          |> encode_should_queries(msg)
          |> encode_minimum_should_match(msg)
        end
      )

      []

      [
        defp(encode_must_queries(acc, msg)) do
          try do
            case(msg.must_queries) do
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
                Protox.EncodingError.new(:must_queries, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_must_not_queries(acc, msg)) do
          try do
            case(msg.must_not_queries) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:must_not_queries, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_filter_queries(acc, msg)) do
          try do
            case(msg.filter_queries) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:filter_queries, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_should_queries(acc, msg)) do
          try do
            case(msg.should_queries) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:should_queries, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_minimum_should_match(acc, msg)) do
          try do
            case(msg.minimum_should_match) do
              nil ->
                acc

              _ ->
                [acc, "(", Protox.Encode.encode_int32(msg.minimum_should_match)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:minimum_should_match, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.BoolQuery))
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
                   must_queries:
                     msg.must_queries ++ [ExAliyunOts.TableStoreSearch.Query.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   must_not_queries:
                     msg.must_not_queries ++
                       [ExAliyunOts.TableStoreSearch.Query.decode!(delimited)]
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   filter_queries:
                     msg.filter_queries ++ [ExAliyunOts.TableStoreSearch.Query.decode!(delimited)]
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   should_queries:
                     msg.should_queries ++ [ExAliyunOts.TableStoreSearch.Query.decode!(delimited)]
                 ], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[minimum_should_match: value], rest}

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
          ExAliyunOts.TableStoreSearch.BoolQuery,
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
        1 => {:must_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 => {:must_not_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        3 => {:filter_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        4 => {:should_queries, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        5 => {:minimum_should_match, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        filter_queries: {3, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        minimum_should_match: {5, {:scalar, 0}, :int32},
        must_not_queries: {2, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        must_queries: {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}},
        should_queries: {4, :unpacked, {:message, ExAliyunOts.TableStoreSearch.Query}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mustQueries",
          kind: :unpacked,
          label: :repeated,
          name: :must_queries,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mustNotQueries",
          kind: :unpacked,
          label: :repeated,
          name: :must_not_queries,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "filterQueries",
          kind: :unpacked,
          label: :repeated,
          name: :filter_queries,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shouldQueries",
          kind: :unpacked,
          label: :repeated,
          name: :should_queries,
          tag: 4,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "minimumShouldMatch",
          kind: {:scalar, 0},
          label: :optional,
          name: :minimum_should_match,
          tag: 5,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:must_queries)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_queries,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("mustQueries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_queries,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("must_queries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_queries,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end
      ),
      (
        def(field_def(:must_not_queries)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustNotQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_not_queries,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("mustNotQueries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustNotQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_not_queries,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("must_not_queries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mustNotQueries",
             kind: :unpacked,
             label: :repeated,
             name: :must_not_queries,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end
      ),
      (
        def(field_def(:filter_queries)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterQueries",
             kind: :unpacked,
             label: :repeated,
             name: :filter_queries,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("filterQueries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterQueries",
             kind: :unpacked,
             label: :repeated,
             name: :filter_queries,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("filter_queries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filterQueries",
             kind: :unpacked,
             label: :repeated,
             name: :filter_queries,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end
      ),
      (
        def(field_def(:should_queries)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shouldQueries",
             kind: :unpacked,
             label: :repeated,
             name: :should_queries,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("shouldQueries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shouldQueries",
             kind: :unpacked,
             label: :repeated,
             name: :should_queries,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("should_queries")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shouldQueries",
             kind: :unpacked,
             label: :repeated,
             name: :should_queries,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end
      ),
      (
        def(field_def(:minimum_should_match)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minimumShouldMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :minimum_should_match,
             tag: 5,
             type: :int32
           }}
        end

        def(field_def("minimumShouldMatch")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minimumShouldMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :minimum_should_match,
             tag: 5,
             type: :int32
           }}
        end

        def(field_def("minimum_should_match")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minimumShouldMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :minimum_should_match,
             tag: 5,
             type: :int32
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
      def(default(:must_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:must_not_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:filter_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:should_queries)) do
        {:error, :no_default_value}
      end,
      def(default(:minimum_should_match)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end