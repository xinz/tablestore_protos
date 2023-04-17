# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.SSEDetails do
  @moduledoc false
  defstruct enable: nil, key_type: nil, key_id: nil, role_arn: nil

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
        []
        |> encode_enable(msg)
        |> encode_key_type(msg)
        |> encode_key_id(msg)
        |> encode_role_arn(msg)
      end
    )

    []

    [
      defp encode_enable(acc, msg) do
        try do
          case msg.enable do
            nil -> raise Protox.RequiredFieldsError.new([:enable])
            _ -> [acc, "\b", Protox.Encode.encode_bool(msg.enable)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_key_type(acc, msg) do
        try do
          case msg.key_type do
            nil ->
              acc

            _ ->
              [
                acc,
                "\x10",
                msg.key_type
                |> ExAliyunOts.TableStore.SSEKeyType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:key_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_key_id(acc, msg) do
        try do
          case msg.key_id do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_bytes(msg.key_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:key_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_role_arn(acc, msg) do
        try do
          case msg.role_arn do
            nil -> acc
            _ -> [acc, "\"", Protox.Encode.encode_bytes(msg.role_arn)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:role_arn, "invalid field value"), __STACKTRACE__
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
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.SSEDetails))

          case [:enable] -- set_fields do
            [] -> msg
            missing_fields -> raise Protox.RequiredFieldsError.new(missing_fields)
          end
        end
      )
    )

    (
      @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
      defp parse_key_value(set_fields, <<>>, msg) do
        {msg, set_fields}
      end

      defp parse_key_value(set_fields, bytes, msg) do
        {new_set_fields, field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[:enable | set_fields], [enable: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.SSEKeyType)
              {[:key_type | set_fields], [key_type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:key_id | set_fields], [key_id: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:role_arn | set_fields], [role_arn: delimited], rest}

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
        ExAliyunOts.TableStore.SSEDetails,
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
        1 => {:enable, {:scalar, false}, :bool},
        2 => {:key_type, {:scalar, :SSE_KMS_SERVICE}, {:enum, ExAliyunOts.TableStore.SSEKeyType}},
        3 => {:key_id, {:scalar, ""}, :bytes},
        4 => {:role_arn, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        enable: {1, {:scalar, false}, :bool},
        key_id: {3, {:scalar, ""}, :bytes},
        key_type: {2, {:scalar, :SSE_KMS_SERVICE}, {:enum, ExAliyunOts.TableStore.SSEKeyType}},
        role_arn: {4, {:scalar, ""}, :bytes}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "enable",
          kind: {:scalar, false},
          label: :required,
          name: :enable,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "keyType",
          kind: {:scalar, :SSE_KMS_SERVICE},
          label: :optional,
          name: :key_type,
          tag: 2,
          type: {:enum, ExAliyunOts.TableStore.SSEKeyType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "keyId",
          kind: {:scalar, ""},
          label: :optional,
          name: :key_id,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "roleArn",
          kind: {:scalar, ""},
          label: :optional,
          name: :role_arn,
          tag: 4,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:enable) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enable",
             kind: {:scalar, false},
             label: :required,
             name: :enable,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("enable") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enable",
             kind: {:scalar, false},
             label: :required,
             name: :enable,
             tag: 1,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:key_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyType",
             kind: {:scalar, :SSE_KMS_SERVICE},
             label: :optional,
             name: :key_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStore.SSEKeyType}
           }}
        end

        def field_def("keyType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyType",
             kind: {:scalar, :SSE_KMS_SERVICE},
             label: :optional,
             name: :key_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStore.SSEKeyType}
           }}
        end

        def field_def("key_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyType",
             kind: {:scalar, :SSE_KMS_SERVICE},
             label: :optional,
             name: :key_type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStore.SSEKeyType}
           }}
        end
      ),
      (
        def field_def(:key_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyId",
             kind: {:scalar, ""},
             label: :optional,
             name: :key_id,
             tag: 3,
             type: :bytes
           }}
        end

        def field_def("keyId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyId",
             kind: {:scalar, ""},
             label: :optional,
             name: :key_id,
             tag: 3,
             type: :bytes
           }}
        end

        def field_def("key_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "keyId",
             kind: {:scalar, ""},
             label: :optional,
             name: :key_id,
             tag: 3,
             type: :bytes
           }}
        end
      ),
      (
        def field_def(:role_arn) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleArn",
             kind: {:scalar, ""},
             label: :optional,
             name: :role_arn,
             tag: 4,
             type: :bytes
           }}
        end

        def field_def("roleArn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleArn",
             kind: {:scalar, ""},
             label: :optional,
             name: :role_arn,
             tag: 4,
             type: :bytes
           }}
        end

        def field_def("role_arn") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roleArn",
             kind: {:scalar, ""},
             label: :optional,
             name: :role_arn,
             tag: 4,
             type: :bytes
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
    @spec required_fields() :: [:enable]
    def required_fields() do
      [:enable]
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
    def default(:enable) do
      {:ok, false}
    end,
    def default(:key_type) do
      {:ok, :SSE_KMS_SERVICE}
    end,
    def default(:key_id) do
      {:ok, ""}
    end,
    def default(:role_arn) do
      {:ok, ""}
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
