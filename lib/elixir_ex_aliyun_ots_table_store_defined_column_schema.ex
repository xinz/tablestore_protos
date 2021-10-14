# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.DefinedColumnSchema) do
  @moduledoc false
  (
    defstruct(name: nil, type: nil)

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
          [] |> encode_name(msg) |> encode_type(msg)
        end
      )

      []

      [
        defp(encode_name(acc, msg)) do
          try do
            case(msg.name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:name]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.name)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_type(acc, msg)) do
          try do
            case(msg.type) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:type]))

              _ ->
                [
                  acc,
                  <<16>>,
                  msg.type
                  |> ExAliyunOts.TableStore.DefinedColumnType.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.DefinedColumnSchema))

            case([:name, :type] -- set_fields) do
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
                {[:name | set_fields], [name: delimited], rest}

              {2, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.DefinedColumnType)

                {[:type | set_fields], [type: value], rest}

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
          ExAliyunOts.TableStore.DefinedColumnSchema,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:type, {:scalar, :DCT_INTEGER}, {:enum, ExAliyunOts.TableStore.DefinedColumnType}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        name: {1, {:scalar, ""}, :string},
        type: {2, {:scalar, :DCT_INTEGER}, {:enum, ExAliyunOts.TableStore.DefinedColumnType}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :required,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, :DCT_INTEGER},
          label: :required,
          name: :type,
          tag: 2,
          type: {:enum, ExAliyunOts.TableStore.DefinedColumnType}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :required,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :required,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :DCT_INTEGER},
             label: :required,
             name: :type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStore.DefinedColumnType}
           }}
        end

        def(field_def("type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :DCT_INTEGER},
             label: :required,
             name: :type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStore.DefinedColumnType}
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:name | :type]
    def(required_fields()) do
      [:name, :type]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:name)) do
        {:ok, ""}
      end,
      def(default(:type)) do
        {:ok, :DCT_INTEGER}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end