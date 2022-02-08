# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.Tunnel) do
  @moduledoc false
  defstruct(table_name: nil, tunnel_name: nil, tunnel_type: nil)

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
        [] |> encode_table_name(msg) |> encode_tunnel_name(msg) |> encode_tunnel_type(msg)
      end
    )

    []

    [
      defp(encode_table_name(acc, msg)) do
        try do
          case(msg.table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            _ ->
              [acc, "\n", Protox.Encode.encode_string(msg.table_name)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:table_name, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_tunnel_name(acc, msg)) do
        try do
          case(msg.tunnel_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_name]))

            _ ->
              [acc, <<26>>, Protox.Encode.encode_string(msg.tunnel_name)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:tunnel_name, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_tunnel_type(acc, msg)) do
        try do
          case(msg.tunnel_type) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel_type]))

            _ ->
              [
                acc,
                " ",
                msg.tunnel_type
                |> ExAliyunOts.TableStoreTunnel.TunnelType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:tunnel_type, "invalid field value"), __STACKTRACE__)
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.Tunnel))

          case([:table_name, :tunnel_name, :tunnel_type] -- set_fields) do
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
              {[:table_name | set_fields], [table_name: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:tunnel_name | set_fields], [tunnel_name: delimited], rest}

            {4, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreTunnel.TunnelType)

              {[:tunnel_type | set_fields], [tunnel_type: value], rest}

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
        ExAliyunOts.TableStoreTunnel.Tunnel,
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
        1 => {:table_name, {:scalar, ""}, :string},
        3 => {:tunnel_name, {:scalar, ""}, :string},
        4 =>
          {:tunnel_type, {:scalar, :BaseData}, {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        table_name: {1, {:scalar, ""}, :string},
        tunnel_name: {3, {:scalar, ""}, :string},
        tunnel_type: {4, {:scalar, :BaseData}, {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :required,
          name: :table_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tunnelName",
          kind: {:scalar, ""},
          label: :required,
          name: :tunnel_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tunnelType",
          kind: {:scalar, :BaseData},
          label: :required,
          name: :tunnel_type,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:table_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("tableName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("table_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:tunnel_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_name,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("tunnelName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_name,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("tunnel_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_name,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:tunnel_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, :BaseData},
             label: :required,
             name: :tunnel_type,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}
           }}
        end

        def(field_def("tunnelType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, :BaseData},
             label: :required,
             name: :tunnel_type,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}
           }}
        end

        def(field_def("tunnel_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, :BaseData},
             label: :required,
             name: :tunnel_type,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreTunnel.TunnelType}
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
    @spec required_fields() :: [(:table_name | :tunnel_name) | :tunnel_type]
    def(required_fields()) do
      [:table_name, :tunnel_name, :tunnel_type]
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
    def(default(:table_name)) do
      {:ok, ""}
    end,
    def(default(:tunnel_name)) do
      {:ok, ""}
    end,
    def(default(:tunnel_type)) do
      {:ok, :BaseData}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end