# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.Channel) do
  @moduledoc false
  (
    defstruct(channel_id: nil, version: nil, status: nil, detail: nil)

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
          |> encode_channel_id(msg)
          |> encode_version(msg)
          |> encode_status(msg)
          |> encode_detail(msg)
        end
      )

      []

      [
        defp(encode_channel_id(acc, msg)) do
          try do
            case(msg.channel_id) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:channel_id]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.channel_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:channel_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_version(acc, msg)) do
          try do
            case(msg.version) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:version]))

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int64(msg.version)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:version, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_status(acc, msg)) do
          try do
            case(msg.status) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:status]))

              _ ->
                [
                  acc,
                  <<24>>,
                  msg.status
                  |> ExAliyunOts.TableStoreTunnel.ChannelStatus.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:status, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_detail(acc, msg)) do
          try do
            case(msg.detail) do
              nil ->
                acc

              _ ->
                [acc, "\"", Protox.Encode.encode_bytes(msg.detail)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:detail, "invalid field value"), __STACKTRACE__)
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.Channel))

            case([:channel_id, :version, :status] -- set_fields) do
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
                {[:channel_id | set_fields], [channel_id: delimited], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[:version | set_fields], [version: value], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreTunnel.ChannelStatus)

                {[:status | set_fields], [status: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:detail | set_fields], [detail: delimited], rest}

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
          ExAliyunOts.TableStoreTunnel.Channel,
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
        1 => {:channel_id, {:scalar, ""}, :string},
        2 => {:version, {:scalar, 0}, :int64},
        3 => {:status, {:scalar, :OPEN}, {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}},
        4 => {:detail, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_id: {1, {:scalar, ""}, :string},
        detail: {4, {:scalar, ""}, :bytes},
        status: {3, {:scalar, :OPEN}, {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}},
        version: {2, {:scalar, 0}, :int64}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "channelId",
          kind: {:scalar, ""},
          label: :required,
          name: :channel_id,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "version",
          kind: {:scalar, 0},
          label: :required,
          name: :version,
          tag: 2,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "status",
          kind: {:scalar, :OPEN},
          label: :required,
          name: :status,
          tag: 3,
          type: {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}
        },
        %{
          __struct__: Protox.Field,
          json_name: "detail",
          kind: {:scalar, ""},
          label: :optional,
          name: :detail,
          tag: 4,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:channel_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelId",
             kind: {:scalar, ""},
             label: :required,
             name: :channel_id,
             tag: 1,
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
             tag: 1,
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
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:version)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, 0},
             label: :required,
             name: :version,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("version")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, 0},
             label: :required,
             name: :version,
             tag: 2,
             type: :int64
           }}
        end

        []
      ),
      (
        def(field_def(:status)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "status",
             kind: {:scalar, :OPEN},
             label: :required,
             name: :status,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}
           }}
        end

        def(field_def("status")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "status",
             kind: {:scalar, :OPEN},
             label: :required,
             name: :status,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreTunnel.ChannelStatus}
           }}
        end

        []
      ),
      (
        def(field_def(:detail)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detail",
             kind: {:scalar, ""},
             label: :optional,
             name: :detail,
             tag: 4,
             type: :bytes
           }}
        end

        def(field_def("detail")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detail",
             kind: {:scalar, ""},
             label: :optional,
             name: :detail,
             tag: 4,
             type: :bytes
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [(:channel_id | :version) | :status]
    def(required_fields()) do
      [:channel_id, :version, :status]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:channel_id)) do
        {:ok, ""}
      end,
      def(default(:version)) do
        {:ok, 0}
      end,
      def(default(:status)) do
        {:ok, :OPEN}
      end,
      def(default(:detail)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end