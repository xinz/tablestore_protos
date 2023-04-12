# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreTunnel.TokenContentV2 do
  @moduledoc false
  defstruct primary_key: nil, iterator: nil, timestamp: nil, total_count: nil

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
        |> encode_primary_key(msg)
        |> encode_iterator(msg)
        |> encode_timestamp(msg)
        |> encode_total_count(msg)
      end
    )

    []

    [
      defp encode_primary_key(acc, msg) do
        try do
          case msg.primary_key do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_bytes(msg.primary_key)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:primary_key, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_iterator(acc, msg) do
        try do
          case msg.iterator do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_string(msg.iterator)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:iterator, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_timestamp(acc, msg) do
        try do
          case msg.timestamp do
            nil -> acc
            _ -> [acc, "\x18", Protox.Encode.encode_int64(msg.timestamp)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:timestamp, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_total_count(acc, msg) do
        try do
          case msg.total_count do
            nil -> acc
            _ -> [acc, " ", Protox.Encode.encode_int64(msg.total_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:total_count, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreTunnel.TokenContentV2))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[primary_key: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[iterator: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[timestamp: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[total_count: value], rest}

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
        ExAliyunOts.TableStoreTunnel.TokenContentV2,
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
        1 => {:primary_key, {:scalar, ""}, :bytes},
        2 => {:iterator, {:scalar, ""}, :string},
        3 => {:timestamp, {:scalar, 0}, :int64},
        4 => {:total_count, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        iterator: {2, {:scalar, ""}, :string},
        primary_key: {1, {:scalar, ""}, :bytes},
        timestamp: {3, {:scalar, 0}, :int64},
        total_count: {4, {:scalar, 0}, :int64}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "primaryKey",
          kind: {:scalar, ""},
          label: :optional,
          name: :primary_key,
          tag: 1,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "iterator",
          kind: {:scalar, ""},
          label: :optional,
          name: :iterator,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "timestamp",
          kind: {:scalar, 0},
          label: :optional,
          name: :timestamp,
          tag: 3,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "totalCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_count,
          tag: 4,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:primary_key) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :primary_key,
             tag: 1,
             type: :bytes
           }}
        end

        def field_def("primaryKey") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :primary_key,
             tag: 1,
             type: :bytes
           }}
        end

        def field_def("primary_key") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "primaryKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :primary_key,
             tag: 1,
             type: :bytes
           }}
        end
      ),
      (
        def field_def(:iterator) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "iterator",
             kind: {:scalar, ""},
             label: :optional,
             name: :iterator,
             tag: 2,
             type: :string
           }}
        end

        def field_def("iterator") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "iterator",
             kind: {:scalar, ""},
             label: :optional,
             name: :iterator,
             tag: 2,
             type: :string
           }}
        end

        []
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
             tag: 3,
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
             tag: 3,
             type: :int64
           }}
        end

        []
      ),
      (
        def field_def(:total_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_count,
             tag: 4,
             type: :int64
           }}
        end

        def field_def("totalCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_count,
             tag: 4,
             type: :int64
           }}
        end

        def field_def("total_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_count,
             tag: 4,
             type: :int64
           }}
        end
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
    def default(:primary_key) do
      {:ok, ""}
    end,
    def default(:iterator) do
      {:ok, ""}
    end,
    def default(:timestamp) do
      {:ok, 0}
    end,
    def default(:total_count) do
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
