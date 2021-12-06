# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ConnectRequest) do
  @moduledoc false
  (
    defstruct(tunnel_id: nil, client_config: nil)

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
          [] |> encode_tunnel_id(msg) |> encode_client_config(msg)
        end
      )

      []

      [
        defp(encode_tunnel_id(acc, msg)) do
          try do
            case(msg.tunnel_id) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:tunnel_id]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.tunnel_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tunnel_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_client_config(acc, msg)) do
          try do
            case(msg.client_config) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.client_config)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:client_config, "invalid field value"),
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
            {msg, set_fields} =
              parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.ConnectRequest))

            case([:tunnel_id] -- set_fields) do
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
                {[:tunnel_id | set_fields], [tunnel_id: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:client_config | set_fields],
                 [
                   client_config:
                     Protox.MergeMessage.merge(
                       msg.client_config,
                       ExAliyunOts.TableStoreTunnel.ClientConfig.decode!(delimited)
                     )
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
          ExAliyunOts.TableStoreTunnel.ConnectRequest,
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
        1 => {:tunnel_id, {:scalar, ""}, :string},
        2 =>
          {:client_config, {:scalar, nil}, {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        client_config: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}},
        tunnel_id: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tunnelId",
          kind: {:scalar, ""},
          label: :required,
          name: :tunnel_id,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientConfig",
          kind: {:scalar, nil},
          label: :optional,
          name: :client_config,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:tunnel_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelId",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_id,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("tunnelId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelId",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_id,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("tunnel_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelId",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_id,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:client_config)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_config,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}
           }}
        end

        def(field_def("clientConfig")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_config,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}
           }}
        end

        def(field_def("client_config")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_config,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreTunnel.ClientConfig}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:tunnel_id]
    def(required_fields()) do
      [:tunnel_id]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:tunnel_id)) do
        {:ok, ""}
      end,
      def(default(:client_config)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end