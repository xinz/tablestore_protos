# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.MeteringInfo do
  @moduledoc false
  defstruct storage_size: nil, row_count: nil, reserved_read_cu: nil, timestamp: nil

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        []
        |> encode_storage_size(msg)
        |> encode_row_count(msg)
        |> encode_reserved_read_cu(msg)
        |> encode_timestamp(msg)
      end
    )

    []

    [
      defp encode_storage_size(acc, msg) do
        try do
          case msg.storage_size do
            nil -> acc
            _ -> [acc, "\b", Protox.Encode.encode_int64(msg.storage_size)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:storage_size, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_row_count(acc, msg) do
        try do
          case msg.row_count do
            nil -> acc
            _ -> [acc, "\x10", Protox.Encode.encode_int64(msg.row_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reserved_read_cu(acc, msg) do
        try do
          case msg.reserved_read_cu do
            nil -> acc
            _ -> [acc, "\x18", Protox.Encode.encode_int64(msg.reserved_read_cu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reserved_read_cu, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_timestamp(acc, msg) do
        try do
          case msg.timestamp do
            nil -> acc
            _ -> [acc, " ", Protox.Encode.encode_int64(msg.timestamp)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:timestamp, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.MeteringInfo))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[storage_size: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[row_count: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[reserved_read_cu: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[timestamp: value], rest}

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
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStoreSearch.MeteringInfo,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:storage_size, {:scalar, 0}, :int64},
        2 => {:row_count, {:scalar, 0}, :int64},
        3 => {:reserved_read_cu, {:scalar, 0}, :int64},
        4 => {:timestamp, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        reserved_read_cu: {3, {:scalar, 0}, :int64},
        row_count: {2, {:scalar, 0}, :int64},
        storage_size: {1, {:scalar, 0}, :int64},
        timestamp: {4, {:scalar, 0}, :int64}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "storageSize",
          kind: {:scalar, 0},
          label: :optional,
          name: :storage_size,
          tag: 1,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :row_count,
          tag: 2,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "reservedReadCu",
          kind: {:scalar, 0},
          label: :optional,
          name: :reserved_read_cu,
          tag: 3,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "timestamp",
          kind: {:scalar, 0},
          label: :optional,
          name: :timestamp,
          tag: 4,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:storage_size) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storageSize",
             kind: {:scalar, 0},
             label: :optional,
             name: :storage_size,
             tag: 1,
             type: :int64
           }}
        end

        def field_def("storageSize") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storageSize",
             kind: {:scalar, 0},
             label: :optional,
             name: :storage_size,
             tag: 1,
             type: :int64
           }}
        end

        def field_def("storage_size") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "storageSize",
             kind: {:scalar, 0},
             label: :optional,
             name: :storage_size,
             tag: 1,
             type: :int64
           }}
        end
      ),
      (
        def field_def(:row_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_count,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("rowCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_count,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("row_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :row_count,
             tag: 2,
             type: :int64
           }}
        end
      ),
      (
        def field_def(:reserved_read_cu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedReadCu",
             kind: {:scalar, 0},
             label: :optional,
             name: :reserved_read_cu,
             tag: 3,
             type: :int64
           }}
        end

        def field_def("reservedReadCu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedReadCu",
             kind: {:scalar, 0},
             label: :optional,
             name: :reserved_read_cu,
             tag: 3,
             type: :int64
           }}
        end

        def field_def("reserved_read_cu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reservedReadCu",
             kind: {:scalar, 0},
             label: :optional,
             name: :reserved_read_cu,
             tag: 3,
             type: :int64
           }}
        end
      ),
      (
        def field_def(:timestamp) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timestamp",
             kind: {:scalar, 0},
             label: :optional,
             name: :timestamp,
             tag: 4,
             type: :int64
           }}
        end

        def field_def("timestamp") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timestamp",
             kind: {:scalar, 0},
             label: :optional,
             name: :timestamp,
             tag: 4,
             type: :int64
           }}
        end

        []
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:storage_size) do
      {:ok, 0}
    end,
    def default(:row_count) do
      {:ok, 0}
    end,
    def default(:reserved_read_cu) do
      {:ok, 0}
    end,
    def default(:timestamp) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
