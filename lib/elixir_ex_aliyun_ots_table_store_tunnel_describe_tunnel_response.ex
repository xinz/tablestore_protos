# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse) do
  @moduledoc false
  defstruct(tunnel: nil, channels: [], tunnel_rpo: nil)

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
        [] |> encode_tunnel(msg) |> encode_channels(msg) |> encode_tunnel_rpo(msg)
      end
    )

    []

    [
      defp(encode_tunnel(acc, msg)) do
        try do
          case(msg.tunnel) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel]))

            _ ->
              [acc, "\n", Protox.Encode.encode_message(msg.tunnel)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:tunnel, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_channels(acc, msg)) do
        try do
          case(msg.channels) do
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
            reraise(Protox.EncodingError.new(:channels, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_tunnel_rpo(acc, msg)) do
        try do
          case(msg.tunnel_rpo) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int64(msg.tunnel_rpo)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:tunnel_rpo, "invalid field value"), __STACKTRACE__)
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
              struct(ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse)
            )

          case([:tunnel] -- set_fields) do
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

              {[:tunnel | set_fields],
               [
                 tunnel:
                   Protox.MergeMessage.merge(
                     msg.tunnel,
                     ExAliyunOts.TableStoreTunnel.TunnelInfo.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[:channels | set_fields],
               [
                 channels:
                   msg.channels ++ [ExAliyunOts.TableStoreTunnel.ChannelInfo.decode!(delimited)]
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[:tunnel_rpo | set_fields], [tunnel_rpo: value], rest}

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
        ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse,
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
        1 => {:tunnel, {:scalar, nil}, {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}},
        2 => {:channels, :unpacked, {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}},
        3 => {:tunnel_rpo, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channels: {2, :unpacked, {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}},
        tunnel: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}},
        tunnel_rpo: {3, {:scalar, 0}, :int64}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tunnel",
          kind: {:scalar, nil},
          label: :required,
          name: :tunnel,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "channels",
          kind: :unpacked,
          label: :repeated,
          name: :channels,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tunnelRpo",
          kind: {:scalar, 0},
          label: :optional,
          name: :tunnel_rpo,
          tag: 3,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:tunnel)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnel",
             kind: {:scalar, nil},
             label: :required,
             name: :tunnel,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}
           }}
        end

        def(field_def("tunnel")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnel",
             kind: {:scalar, nil},
             label: :required,
             name: :tunnel,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:channels)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channels",
             kind: :unpacked,
             label: :repeated,
             name: :channels,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}
           }}
        end

        def(field_def("channels")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channels",
             kind: :unpacked,
             label: :repeated,
             name: :channels,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:tunnel_rpo)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :tunnel_rpo,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("tunnelRpo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :tunnel_rpo,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("tunnel_rpo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :tunnel_rpo,
             tag: 3,
             type: :int64
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
    @spec required_fields() :: [:tunnel]
    def(required_fields()) do
      [:tunnel]
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
    def(default(:tunnel)) do
      {:ok, nil}
    end,
    def(default(:channels)) do
      {:error, :no_default_value}
    end,
    def(default(:tunnel_rpo)) do
      {:ok, 0}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end