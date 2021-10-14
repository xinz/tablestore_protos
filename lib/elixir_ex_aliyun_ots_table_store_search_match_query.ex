# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.MatchQuery) do
  @moduledoc false
  (
    defstruct(field_name: nil, text: nil, minimum_should_match: nil, operator: nil)

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
          |> encode_text(msg)
          |> encode_minimum_should_match(msg)
          |> encode_operator(msg)
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
        defp(encode_text(acc, msg)) do
          try do
            case(msg.text) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.text)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:text, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_minimum_should_match(acc, msg)) do
          try do
            case(msg.minimum_should_match) do
              nil ->
                acc

              _ ->
                [acc, <<24>>, Protox.Encode.encode_int32(msg.minimum_should_match)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:minimum_should_match, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_operator(acc, msg)) do
          try do
            case(msg.operator) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  " ",
                  msg.operator
                  |> ExAliyunOts.TableStoreSearch.QueryOperator.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:operator, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.MatchQuery))
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
                {[text: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[minimum_should_match: value], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.QueryOperator)

                {[operator: value], rest}

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
          ExAliyunOts.TableStoreSearch.MatchQuery,
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
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:text, {:scalar, ""}, :string},
        3 => {:minimum_should_match, {:scalar, 0}, :int32},
        4 => {:operator, {:scalar, :OR}, {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:scalar, ""}, :string},
        minimum_should_match: {3, {:scalar, 0}, :int32},
        operator: {4, {:scalar, :OR}, {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}},
        text: {2, {:scalar, ""}, :string}
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
          json_name: "text",
          kind: {:scalar, ""},
          label: :optional,
          name: :text,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "minimumShouldMatch",
          kind: {:scalar, 0},
          label: :optional,
          name: :minimum_should_match,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "operator",
          kind: {:scalar, :OR},
          label: :optional,
          name: :operator,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}
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
        def(field_def(:text)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "text",
             kind: {:scalar, ""},
             label: :optional,
             name: :text,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("text")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "text",
             kind: {:scalar, ""},
             label: :optional,
             name: :text,
             tag: 2,
             type: :string
           }}
        end

        []
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:operator)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operator",
             kind: {:scalar, :OR},
             label: :optional,
             name: :operator,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}
           }}
        end

        def(field_def("operator")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operator",
             kind: {:scalar, :OR},
             label: :optional,
             name: :operator,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreSearch.QueryOperator}
           }}
        end

        []
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
      def(default(:text)) do
        {:ok, ""}
      end,
      def(default(:minimum_should_match)) do
        {:ok, 0}
      end,
      def(default(:operator)) do
        {:ok, :OR}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end