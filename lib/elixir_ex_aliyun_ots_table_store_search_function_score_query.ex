# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.FunctionScoreQuery do
  @moduledoc false
  defstruct query: nil, field_value_factor: nil

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
        [] |> encode_query(msg) |> encode_field_value_factor(msg)
      end
    )

    []

    [
      defp encode_query(acc, msg) do
        try do
          case msg.query do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_field_value_factor(acc, msg) do
        try do
          case msg.field_value_factor do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.field_value_factor)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_value_factor, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.FunctionScoreQuery))
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
                 query:
                   Protox.MergeMessage.merge(
                     msg.query,
                     ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 field_value_factor:
                   Protox.MergeMessage.merge(
                     msg.field_value_factor,
                     ExAliyunOts.TableStoreSearch.FieldValueFactor.decode!(delimited)
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
        ExAliyunOts.TableStoreSearch.FunctionScoreQuery,
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
        1 => {:query, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 =>
          {:field_value_factor, {:scalar, nil},
           {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        field_value_factor:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}},
        query: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldValueFactor",
          kind: {:scalar, nil},
          label: :optional,
          name: :field_value_factor,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:query) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def field_def("query") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        []
      ),
      (
        def field_def(:field_value_factor) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldValueFactor",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_value_factor,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}
           }}
        end

        def field_def("fieldValueFactor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldValueFactor",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_value_factor,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}
           }}
        end

        def field_def("field_value_factor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldValueFactor",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_value_factor,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldValueFactor}
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
    def default(:query) do
      {:ok, nil}
    end,
    def default(:field_value_factor) do
      {:ok, nil}
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
