# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse) do
  @moduledoc false
  (
    defstruct(schema: nil, sync_stat: nil)

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
          [] |> encode_schema(msg) |> encode_sync_stat(msg)
        end
      )

      []

      [
        defp(encode_schema(acc, msg)) do
          try do
            case(msg.schema) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_message(msg.schema)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:schema, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_sync_stat(acc, msg)) do
          try do
            case(msg.sync_stat) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.sync_stat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sync_stat, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(
              bytes,
              struct(ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse)
            )
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   schema:
                     Protox.MergeMessage.merge(
                       msg.schema,
                       ExAliyunOts.TableStoreSearch.IndexSchema.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sync_stat:
                     Protox.MergeMessage.merge(
                       msg.sync_stat,
                       ExAliyunOts.TableStoreSearch.SyncStat.decode!(delimited)
                     )
                 ], rest}

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
          ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse,
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
        1 => {:schema, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}},
        2 => {:sync_stat, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SyncStat}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        schema: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}},
        sync_stat: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SyncStat}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "schema",
          kind: {:scalar, nil},
          label: :optional,
          name: :schema,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
        },
        %{
          __struct__: Protox.Field,
          json_name: "syncStat",
          kind: {:scalar, nil},
          label: :optional,
          name: :sync_stat,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:schema)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: {:scalar, nil},
             label: :optional,
             name: :schema,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
           }}
        end

        def(field_def("schema")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: {:scalar, nil},
             label: :optional,
             name: :schema,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.IndexSchema}
           }}
        end

        []
      ),
      (
        def(field_def(:sync_stat)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end

        def(field_def("syncStat")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end

        def(field_def("sync_stat")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncStat",
             kind: {:scalar, nil},
             label: :optional,
             name: :sync_stat,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.SyncStat}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:schema)) do
        {:ok, nil}
      end,
      def(default(:sync_stat)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end