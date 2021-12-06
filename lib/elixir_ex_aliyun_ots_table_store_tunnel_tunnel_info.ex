# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.TunnelInfo) do
  @moduledoc false
  (
    defstruct(
      tunnel_id: nil,
      tunnel_type: nil,
      table_name: nil,
      instance_name: nil,
      stream_id: nil,
      stage: nil,
      expired: nil,
      tunnel_name: nil,
      public: nil
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
          |> encode_tunnel_id(msg)
          |> encode_tunnel_type(msg)
          |> encode_table_name(msg)
          |> encode_instance_name(msg)
          |> encode_stream_id(msg)
          |> encode_stage(msg)
          |> encode_expired(msg)
          |> encode_tunnel_name(msg)
          |> encode_public(msg)
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
        defp(encode_tunnel_type(acc, msg)) do
          try do
            case(msg.tunnel_type) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:tunnel_type]))

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.tunnel_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:tunnel_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_table_name(acc, msg)) do
          try do
            case(msg.table_name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:table_name]))

              _ ->
                [acc, <<26>>, Protox.Encode.encode_string(msg.table_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:table_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_instance_name(acc, msg)) do
          try do
            case(msg.instance_name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:instance_name]))

              _ ->
                [acc, "\"", Protox.Encode.encode_string(msg.instance_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:instance_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_stream_id(acc, msg)) do
          try do
            case(msg.stream_id) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:stream_id]))

              _ ->
                [acc, "*", Protox.Encode.encode_string(msg.stream_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:stream_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_stage(acc, msg)) do
          try do
            case(msg.stage) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:stage]))

              _ ->
                [acc, "2", Protox.Encode.encode_string(msg.stage)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:stage, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_expired(acc, msg)) do
          try do
            case(msg.expired) do
              nil ->
                acc

              _ ->
                [acc, "8", Protox.Encode.encode_bool(msg.expired)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:expired, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tunnel_name(acc, msg)) do
          try do
            case(msg.tunnel_name) do
              nil ->
                acc

              _ ->
                [acc, "B", Protox.Encode.encode_string(msg.tunnel_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:tunnel_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_public(acc, msg)) do
          try do
            case(msg.public) do
              nil ->
                acc

              _ ->
                [acc, "H", Protox.Encode.encode_bool(msg.public)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:public, "invalid field value"), __STACKTRACE__)
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.TunnelInfo))

            case(
              [:tunnel_id, :tunnel_type, :table_name, :instance_name, :stream_id, :stage] --
                set_fields
            ) do
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
                {[:tunnel_type | set_fields], [tunnel_type: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:table_name | set_fields], [table_name: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:instance_name | set_fields], [instance_name: delimited], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:stream_id | set_fields], [stream_id: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:stage | set_fields], [stage: delimited], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[:expired | set_fields], [expired: value], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:tunnel_name | set_fields], [tunnel_name: delimited], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[:public | set_fields], [public: value], rest}

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
          ExAliyunOts.TableStoreTunnel.TunnelInfo,
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
        2 => {:tunnel_type, {:scalar, ""}, :string},
        3 => {:table_name, {:scalar, ""}, :string},
        4 => {:instance_name, {:scalar, ""}, :string},
        5 => {:stream_id, {:scalar, ""}, :string},
        6 => {:stage, {:scalar, ""}, :string},
        7 => {:expired, {:scalar, false}, :bool},
        8 => {:tunnel_name, {:scalar, ""}, :string},
        9 => {:public, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        expired: {7, {:scalar, false}, :bool},
        instance_name: {4, {:scalar, ""}, :string},
        public: {9, {:scalar, false}, :bool},
        stage: {6, {:scalar, ""}, :string},
        stream_id: {5, {:scalar, ""}, :string},
        table_name: {3, {:scalar, ""}, :string},
        tunnel_id: {1, {:scalar, ""}, :string},
        tunnel_name: {8, {:scalar, ""}, :string},
        tunnel_type: {2, {:scalar, ""}, :string}
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
          json_name: "tunnelType",
          kind: {:scalar, ""},
          label: :required,
          name: :tunnel_type,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :required,
          name: :table_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "instanceName",
          kind: {:scalar, ""},
          label: :required,
          name: :instance_name,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "streamId",
          kind: {:scalar, ""},
          label: :required,
          name: :stream_id,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "stage",
          kind: {:scalar, ""},
          label: :required,
          name: :stage,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "expired",
          kind: {:scalar, false},
          label: :optional,
          name: :expired,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "tunnelName",
          kind: {:scalar, ""},
          label: :optional,
          name: :tunnel_name,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "public",
          kind: {:scalar, false},
          label: :optional,
          name: :public,
          tag: 9,
          type: :bool
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
        def(field_def(:tunnel_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_type,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("tunnelType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_type,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("tunnel_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelType",
             kind: {:scalar, ""},
             label: :required,
             name: :tunnel_type,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:table_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:instance_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "instanceName",
             kind: {:scalar, ""},
             label: :required,
             name: :instance_name,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("instanceName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "instanceName",
             kind: {:scalar, ""},
             label: :required,
             name: :instance_name,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("instance_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "instanceName",
             kind: {:scalar, ""},
             label: :required,
             name: :instance_name,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:stream_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("streamId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("stream_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 5,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:stage)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stage",
             kind: {:scalar, ""},
             label: :required,
             name: :stage,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("stage")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "stage",
             kind: {:scalar, ""},
             label: :required,
             name: :stage,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:expired)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expired",
             kind: {:scalar, false},
             label: :optional,
             name: :expired,
             tag: 7,
             type: :bool
           }}
        end

        def(field_def("expired")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expired",
             kind: {:scalar, false},
             label: :optional,
             name: :expired,
             tag: 7,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:tunnel_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_name,
             tag: 8,
             type: :string
           }}
        end

        def(field_def("tunnelName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_name,
             tag: 8,
             type: :string
           }}
        end

        def(field_def("tunnel_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelName",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_name,
             tag: 8,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:public)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "public",
             kind: {:scalar, false},
             label: :optional,
             name: :public,
             tag: 9,
             type: :bool
           }}
        end

        def(field_def("public")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "public",
             kind: {:scalar, false},
             label: :optional,
             name: :public,
             tag: 9,
             type: :bool
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []

    @spec required_fields() :: [
            ((((:tunnel_id | :tunnel_type) | :table_name) | :instance_name) | :stream_id) | :stage
          ]
    def(required_fields()) do
      [:tunnel_id, :tunnel_type, :table_name, :instance_name, :stream_id, :stage]
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
      def(default(:tunnel_type)) do
        {:ok, ""}
      end,
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:instance_name)) do
        {:ok, ""}
      end,
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:stage)) do
        {:ok, ""}
      end,
      def(default(:expired)) do
        {:ok, false}
      end,
      def(default(:tunnel_name)) do
        {:ok, ""}
      end,
      def(default(:public)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end