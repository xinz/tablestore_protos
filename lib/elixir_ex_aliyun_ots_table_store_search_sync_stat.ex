# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SyncStat) do
  @moduledoc false
  (
    defstruct(sync_phase: nil, current_sync_timestamp: nil)

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
          [] |> encode_sync_phase(msg) |> encode_current_sync_timestamp(msg)
        end
      )

      []

      [
        defp(encode_sync_phase(acc, msg)) do
          try do
            case(msg.sync_phase) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  "\b",
                  msg.sync_phase
                  |> ExAliyunOts.TableStoreSearch.SyncPhase.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:sync_phase, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_current_sync_timestamp(acc, msg)) do
          try do
            case(msg.current_sync_timestamp) do
              nil ->
                acc

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int64(msg.current_sync_timestamp)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:current_sync_timestamp, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SyncStat))
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
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SyncPhase)

                {[sync_phase: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[current_sync_timestamp: value], rest}

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
          ExAliyunOts.TableStoreSearch.SyncStat,
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
        1 => {:sync_phase, {:scalar, :FULL}, {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}},
        2 => {:current_sync_timestamp, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        current_sync_timestamp: {2, {:scalar, 0}, :int64},
        sync_phase: {1, {:scalar, :FULL}, {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "syncPhase",
          kind: {:scalar, :FULL},
          label: :optional,
          name: :sync_phase,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}
        },
        %{
          __struct__: Protox.Field,
          json_name: "currentSyncTimestamp",
          kind: {:scalar, 0},
          label: :optional,
          name: :current_sync_timestamp,
          tag: 2,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:sync_phase)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncPhase",
             kind: {:scalar, :FULL},
             label: :optional,
             name: :sync_phase,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}
           }}
        end

        def(field_def("syncPhase")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncPhase",
             kind: {:scalar, :FULL},
             label: :optional,
             name: :sync_phase,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}
           }}
        end

        def(field_def("sync_phase")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "syncPhase",
             kind: {:scalar, :FULL},
             label: :optional,
             name: :sync_phase,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}
           }}
        end
      ),
      (
        def(field_def(:current_sync_timestamp)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentSyncTimestamp",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_sync_timestamp,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("currentSyncTimestamp")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentSyncTimestamp",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_sync_timestamp,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("current_sync_timestamp")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentSyncTimestamp",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_sync_timestamp,
             tag: 2,
             type: :int64
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
      def(default(:sync_phase)) do
        {:ok, :FULL}
      end,
      def(default(:current_sync_timestamp)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end