# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TableOptions) do
  @moduledoc false
  (
    defstruct(time_to_live: nil, max_versions: nil, deviation_cell_version_in_sec: nil)

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
          |> encode_time_to_live(msg)
          |> encode_max_versions(msg)
          |> encode_deviation_cell_version_in_sec(msg)
        end
      )

      []

      [
        defp(encode_time_to_live(acc, msg)) do
          try do
            case(msg.time_to_live) do
              nil ->
                acc

              _ ->
                [acc, "\b", Protox.Encode.encode_int32(msg.time_to_live)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:time_to_live, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_max_versions(acc, msg)) do
          try do
            case(msg.max_versions) do
              nil ->
                acc

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int32(msg.max_versions)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:max_versions, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_deviation_cell_version_in_sec(acc, msg)) do
          try do
            case(msg.deviation_cell_version_in_sec) do
              nil ->
                acc

              _ ->
                [acc, "(", Protox.Encode.encode_int64(msg.deviation_cell_version_in_sec)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:deviation_cell_version_in_sec, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.TableOptions))
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[time_to_live: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[max_versions: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[deviation_cell_version_in_sec: value], rest}

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
          ExAliyunOts.TableStore.TableOptions,
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
        1 => {:time_to_live, {:scalar, 0}, :int32},
        2 => {:max_versions, {:scalar, 0}, :int32},
        5 => {:deviation_cell_version_in_sec, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        deviation_cell_version_in_sec: {5, {:scalar, 0}, :int64},
        max_versions: {2, {:scalar, 0}, :int32},
        time_to_live: {1, {:scalar, 0}, :int32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "timeToLive",
          kind: {:scalar, 0},
          label: :optional,
          name: :time_to_live,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxVersions",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_versions,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "deviationCellVersionInSec",
          kind: {:scalar, 0},
          label: :optional,
          name: :deviation_cell_version_in_sec,
          tag: 5,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:time_to_live)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("timeToLive")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("time_to_live")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timeToLive",
             kind: {:scalar, 0},
             label: :optional,
             name: :time_to_live,
             tag: 1,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:max_versions)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("maxVersions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("max_versions")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxVersions",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_versions,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:deviation_cell_version_in_sec)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deviationCellVersionInSec",
             kind: {:scalar, 0},
             label: :optional,
             name: :deviation_cell_version_in_sec,
             tag: 5,
             type: :int64
           }}
        end

        def(field_def("deviationCellVersionInSec")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deviationCellVersionInSec",
             kind: {:scalar, 0},
             label: :optional,
             name: :deviation_cell_version_in_sec,
             tag: 5,
             type: :int64
           }}
        end

        def(field_def("deviation_cell_version_in_sec")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deviationCellVersionInSec",
             kind: {:scalar, 0},
             label: :optional,
             name: :deviation_cell_version_in_sec,
             tag: 5,
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
      def(default(:time_to_live)) do
        {:ok, 0}
      end,
      def(default(:max_versions)) do
        {:ok, 0}
      end,
      def(default(:deviation_cell_version_in_sec)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end