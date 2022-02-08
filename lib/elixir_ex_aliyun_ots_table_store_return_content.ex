# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ReturnContent) do
  @moduledoc false
  defstruct(return_type: nil, return_column_names: [])

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
        [] |> encode_return_type(msg) |> encode_return_column_names(msg)
      end
    )

    []

    [
      defp(encode_return_type(acc, msg)) do
        try do
          case(msg.return_type) do
            nil ->
              acc

            _ ->
              [
                acc,
                "\b",
                msg.return_type
                |> ExAliyunOts.TableStore.ReturnType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:return_type, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_return_column_names(acc, msg)) do
        try do
          case(msg.return_column_names) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:return_column_names, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.ReturnContent))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.ReturnType)
              {[return_type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[return_column_names: msg.return_column_names ++ [delimited]], rest}

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
        ExAliyunOts.TableStore.ReturnContent,
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
        1 => {:return_type, {:scalar, :RT_NONE}, {:enum, ExAliyunOts.TableStore.ReturnType}},
        2 => {:return_column_names, :unpacked, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        return_column_names: {2, :unpacked, :string},
        return_type: {1, {:scalar, :RT_NONE}, {:enum, ExAliyunOts.TableStore.ReturnType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "returnType",
          kind: {:scalar, :RT_NONE},
          label: :optional,
          name: :return_type,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStore.ReturnType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returnColumnNames",
          kind: :unpacked,
          label: :repeated,
          name: :return_column_names,
          tag: 2,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:return_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, :RT_NONE},
             label: :optional,
             name: :return_type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStore.ReturnType}
           }}
        end

        def(field_def("returnType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, :RT_NONE},
             label: :optional,
             name: :return_type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStore.ReturnType}
           }}
        end

        def(field_def("return_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnType",
             kind: {:scalar, :RT_NONE},
             label: :optional,
             name: :return_type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStore.ReturnType}
           }}
        end
      ),
      (
        def(field_def(:return_column_names)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnColumnNames",
             kind: :unpacked,
             label: :repeated,
             name: :return_column_names,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("returnColumnNames")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnColumnNames",
             kind: :unpacked,
             label: :repeated,
             name: :return_column_names,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("return_column_names")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnColumnNames",
             kind: :unpacked,
             label: :repeated,
             name: :return_column_names,
             tag: 2,
             type: :string
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
    @spec required_fields() :: []
    def(required_fields()) do
      []
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
    def(default(:return_type)) do
      {:ok, :RT_NONE}
    end,
    def(default(:return_column_names)) do
      {:error, :no_default_value}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end