# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter) do
  @moduledoc false
  defstruct(combinator: nil, sub_filters: [])

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
        [] |> encode_combinator(msg) |> encode_sub_filters(msg)
      end
    )

    []

    [
      defp(encode_combinator(acc, msg)) do
        try do
          case(msg.combinator) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:combinator]))

            _ ->
              [
                acc,
                "\b",
                msg.combinator
                |> ExAliyunOts.TableStoreFilter.LogicalOperator.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:combinator, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_sub_filters(acc, msg)) do
        try do
          case(msg.sub_filters) do
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
            reraise(Protox.EncodingError.new(:sub_filters, "invalid field value"), __STACKTRACE__)
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
              struct(ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter)
            )

          case([:combinator] -- set_fields) do
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
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.LogicalOperator)

              {[:combinator | set_fields], [combinator: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:sub_filters | set_fields],
               [
                 sub_filters:
                   msg.sub_filters ++ [ExAliyunOts.TableStoreFilter.Filter.decode!(delimited)]
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
        ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter,
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

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 =>
          {:combinator, {:scalar, :LO_NOT}, {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}},
        2 => {:sub_filters, :unpacked, {:message, ExAliyunOts.TableStoreFilter.Filter}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        combinator:
          {1, {:scalar, :LO_NOT}, {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}},
        sub_filters: {2, :unpacked, {:message, ExAliyunOts.TableStoreFilter.Filter}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "combinator",
          kind: {:scalar, :LO_NOT},
          label: :required,
          name: :combinator,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subFilters",
          kind: :unpacked,
          label: :repeated,
          name: :sub_filters,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreFilter.Filter}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:combinator)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "combinator",
             kind: {:scalar, :LO_NOT},
             label: :required,
             name: :combinator,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}
           }}
        end

        def(field_def("combinator")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "combinator",
             kind: {:scalar, :LO_NOT},
             label: :required,
             name: :combinator,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.LogicalOperator}
           }}
        end

        []
      ),
      (
        def(field_def(:sub_filters)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subFilters",
             kind: :unpacked,
             label: :repeated,
             name: :sub_filters,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreFilter.Filter}
           }}
        end

        def(field_def("subFilters")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subFilters",
             kind: :unpacked,
             label: :repeated,
             name: :sub_filters,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreFilter.Filter}
           }}
        end

        def(field_def("sub_filters")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subFilters",
             kind: :unpacked,
             label: :repeated,
             name: :sub_filters,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreFilter.Filter}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: [:combinator]
    def(required_fields()) do
      [:combinator]
    end
  )

  (
    @spec syntax() :: atom()
    def(syntax()) do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def(default(:combinator)) do
      {:ok, :LO_NOT}
    end,
    def(default(:sub_filters)) do
      {:error, :no_default_value}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end