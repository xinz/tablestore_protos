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
            e ->
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
          field_value = msg.sync_phase

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                "\b",
                field_value
                |> ExAliyunOts.TableStoreSearch.SyncPhase.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_current_sync_timestamp(acc, msg)) do
          field_value = msg.current_sync_timestamp

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end
      ]

      []
    )

    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def(decode!(bytes)) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SyncStat))
        end
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

                field = {:sync_phase, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:current_sync_timestamp, value}
                {[field], rest}

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

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:sync_phase, {:default, :FULL}, {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}},
        2 => {:current_sync_timestamp, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        current_sync_timestamp: {2, {:default, 0}, :int64},
        sync_phase: {1, {:default, :FULL}, {:enum, ExAliyunOts.TableStoreSearch.SyncPhase}}
      }
    end

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