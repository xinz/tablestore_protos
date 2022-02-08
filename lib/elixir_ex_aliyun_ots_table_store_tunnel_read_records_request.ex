# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ReadRecordsRequest) do
  @moduledoc false
  defstruct(tunnel_id: nil, client_id: nil, channel_id: nil, token: nil)

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
        |> encode_tunnel_id(msg)
        |> encode_client_id(msg)
        |> encode_channel_id(msg)
        |> encode_token(msg)
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
      defp(encode_client_id(acc, msg)) do
        try do
          case(msg.client_id) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:client_id]))

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(msg.client_id)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:client_id, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_channel_id(acc, msg)) do
        try do
          case(msg.channel_id) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:channel_id]))

            _ ->
              [acc, <<26>>, Protox.Encode.encode_string(msg.channel_id)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:channel_id, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_token(acc, msg)) do
        try do
          case(msg.token) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:token]))

            _ ->
              [acc, "\"", Protox.Encode.encode_string(msg.token)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__)
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.ReadRecordsRequest))

          case([:tunnel_id, :client_id, :channel_id, :token] -- set_fields) do
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
              {[:client_id | set_fields], [client_id: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:channel_id | set_fields], [channel_id: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:token | set_fields], [token: delimited], rest}

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
        ExAliyunOts.TableStoreTunnel.ReadRecordsRequest,
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
        1 => {:tunnel_id, {:scalar, ""}, :string},
        2 => {:client_id, {:scalar, ""}, :string},
        3 => {:channel_id, {:scalar, ""}, :string},
        4 => {:token, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_id: {3, {:scalar, ""}, :string},
        client_id: {2, {:scalar, ""}, :string},
        token: {4, {:scalar, ""}, :string},
        tunnel_id: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
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
          json_name: "clientId",
          kind: {:scalar, ""},
          label: :required,
          name: :client_id,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "channelId",
          kind: {:scalar, ""},
          label: :required,
          name: :channel_id,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: {:scalar, ""},
          label: :required,
          name: :token,
          tag: 4,
          type: :string
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
        def(field_def(:client_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientId",
             kind: {:scalar, ""},
             label: :required,
             name: :client_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("clientId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientId",
             kind: {:scalar, ""},
             label: :required,
             name: :client_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("client_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientId",
             kind: {:scalar, ""},
             label: :required,
             name: :client_id,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:channel_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelId",
             kind: {:scalar, ""},
             label: :required,
             name: :channel_id,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("channelId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelId",
             kind: {:scalar, ""},
             label: :required,
             name: :channel_id,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("channel_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelId",
             kind: {:scalar, ""},
             label: :required,
             name: :channel_id,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :required,
             name: :token,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :required,
             name: :token,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: [((:tunnel_id | :client_id) | :channel_id) | :token]
    def(required_fields()) do
      [:tunnel_id, :client_id, :channel_id, :token]
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
    def(default(:tunnel_id)) do
      {:ok, ""}
    end,
    def(default(:client_id)) do
      {:ok, ""}
    end,
    def(default(:channel_id)) do
      {:ok, ""}
    end,
    def(default(:token)) do
      {:ok, ""}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end