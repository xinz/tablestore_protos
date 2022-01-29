# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.ValueTransferRule) do
  @moduledoc false
  (
    defstruct(regex: nil, cast_type: nil)

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
          [] |> encode_regex(msg) |> encode_cast_type(msg)
        end
      )

      []

      [
        defp(encode_regex(acc, msg)) do
          try do
            case(msg.regex) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:regex]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.regex)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:regex, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_cast_type(acc, msg)) do
          try do
            case(msg.cast_type) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  <<16>>,
                  msg.cast_type
                  |> ExAliyunOts.TableStoreFilter.VariantType.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:cast_type, "invalid field value"), __STACKTRACE__)
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStoreFilter.ValueTransferRule))

            case([:regex] -- set_fields) do
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
                {[:regex | set_fields], [regex: delimited], rest}

              {2, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.VariantType)

                {[:cast_type | set_fields], [cast_type: value], rest}

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
          ExAliyunOts.TableStoreFilter.ValueTransferRule,
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
        1 => {:regex, {:scalar, ""}, :string},
        2 =>
          {:cast_type, {:scalar, :VT_INTEGER}, {:enum, ExAliyunOts.TableStoreFilter.VariantType}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        cast_type: {2, {:scalar, :VT_INTEGER}, {:enum, ExAliyunOts.TableStoreFilter.VariantType}},
        regex: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "regex",
          kind: {:scalar, ""},
          label: :required,
          name: :regex,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "castType",
          kind: {:scalar, :VT_INTEGER},
          label: :optional,
          name: :cast_type,
          tag: 2,
          type: {:enum, ExAliyunOts.TableStoreFilter.VariantType}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:regex)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "regex",
             kind: {:scalar, ""},
             label: :required,
             name: :regex,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("regex")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "regex",
             kind: {:scalar, ""},
             label: :required,
             name: :regex,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:cast_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "castType",
             kind: {:scalar, :VT_INTEGER},
             label: :optional,
             name: :cast_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreFilter.VariantType}
           }}
        end

        def(field_def("castType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "castType",
             kind: {:scalar, :VT_INTEGER},
             label: :optional,
             name: :cast_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreFilter.VariantType}
           }}
        end

        def(field_def("cast_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "castType",
             kind: {:scalar, :VT_INTEGER},
             label: :optional,
             name: :cast_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreFilter.VariantType}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:regex]
    def(required_fields()) do
      [:regex]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:regex)) do
        {:ok, ""}
      end,
      def(default(:cast_type)) do
        {:ok, :VT_INTEGER}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end