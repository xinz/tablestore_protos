# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.ChannelInfo) do
  @moduledoc false
  (
    defstruct(
      channel_id: nil,
      channel_type: nil,
      channel_status: nil,
      client_id: nil,
      channel_rpo: nil,
      channel_count: nil
    )

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
          |> encode_channel_type(msg)
          |> encode_channel_status(msg)
          |> encode_client_id(msg)
          |> encode_channel_rpo(msg)
          |> encode_channel_count(msg)
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
        defp(encode_channel_type(acc, msg)) do
          try do
            case(msg.channel_type) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.channel_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:channel_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_channel_status(acc, msg)) do
          try do
            case(msg.channel_status) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_string(msg.channel_status)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:channel_status, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_client_id(acc, msg)) do
          try do
            case(msg.client_id) do
              nil ->
                acc

              _ ->
                [acc, "\"", Protox.Encode.encode_string(msg.client_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:client_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_channel_rpo(acc, msg)) do
          try do
            case(msg.channel_rpo) do
              nil ->
                acc

              _ ->
                [acc, "(", Protox.Encode.encode_int64(msg.channel_rpo)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:channel_rpo, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_channel_count(acc, msg)) do
          try do
            case(msg.channel_count) do
              nil ->
                acc

              _ ->
                [acc, "0", Protox.Encode.encode_int64(msg.channel_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:channel_count, "invalid field value"),
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.ChannelInfo))

            case([:channel_id] -- set_fields) do
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:channel_type | set_fields], [channel_type: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:channel_status | set_fields], [channel_status: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:client_id | set_fields], [client_id: delimited], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[:channel_rpo | set_fields], [channel_rpo: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[:channel_count | set_fields], [channel_count: value], rest}

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
          ExAliyunOts.TableStoreTunnel.ChannelInfo,
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
        2 => {:channel_type, {:scalar, ""}, :string},
        3 => {:channel_status, {:scalar, ""}, :string},
        4 => {:client_id, {:scalar, ""}, :string},
        5 => {:channel_rpo, {:scalar, 0}, :int64},
        6 => {:channel_count, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channel_count: {6, {:scalar, 0}, :int64},
        channel_id: {1, {:scalar, ""}, :string},
        channel_rpo: {5, {:scalar, 0}, :int64},
        channel_status: {3, {:scalar, ""}, :string},
        channel_type: {2, {:scalar, ""}, :string},
        client_id: {4, {:scalar, ""}, :string}
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
          json_name: "channelType",
          kind: {:scalar, ""},
          label: :optional,
          name: :channel_type,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "channelStatus",
          kind: {:scalar, ""},
          label: :optional,
          name: :channel_status,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientId",
          kind: {:scalar, ""},
          label: :optional,
          name: :client_id,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "channelRpo",
          kind: {:scalar, 0},
          label: :optional,
          name: :channel_rpo,
          tag: 5,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "channelCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :channel_count,
          tag: 6,
          type: :int64
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
        def(field_def(:channel_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelType",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_type,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("channelType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelType",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_type,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("channel_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelType",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_type,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:channel_status)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelStatus",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_status,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("channelStatus")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelStatus",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_status,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("channel_status")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelStatus",
             kind: {:scalar, ""},
             label: :optional,
             name: :channel_status,
             tag: 3,
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
             label: :optional,
             name: :client_id,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("clientId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientId",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_id,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("client_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientId",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_id,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:channel_rpo)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_rpo,
             tag: 5,
             type: :int64
           }}
        end

        def(field_def("channelRpo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_rpo,
             tag: 5,
             type: :int64
           }}
        end

        def(field_def("channel_rpo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelRpo",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_rpo,
             tag: 5,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:channel_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_count,
             tag: 6,
             type: :int64
           }}
        end

        def(field_def("channelCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_count,
             tag: 6,
             type: :int64
           }}
        end

        def(field_def("channel_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "channelCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :channel_count,
             tag: 6,
             type: :int64
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:channel_id]
    def(required_fields()) do
      [:channel_id]
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
      def(default(:channel_type)) do
        {:ok, ""}
      end,
      def(default(:channel_status)) do
        {:ok, ""}
      end,
      def(default(:client_id)) do
        {:ok, ""}
      end,
      def(default(:channel_rpo)) do
        {:ok, 0}
      end,
      def(default(:channel_count)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end