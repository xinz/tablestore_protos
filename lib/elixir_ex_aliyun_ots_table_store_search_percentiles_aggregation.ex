# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.PercentilesAggregation do
  @moduledoc false
  defstruct field_name: nil, percentiles: [], missing: nil

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
        [] |> encode_field_name(msg) |> encode_percentiles(msg) |> encode_missing(msg)
      end
    )

    []

    [
      defp encode_field_name(acc, msg) do
        try do
          case msg.field_name do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_string(msg.field_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_percentiles(acc, msg) do
        try do
          case msg.percentiles do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x11", Protox.Encode.encode_double(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:percentiles, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_missing(acc, msg) do
        try do
          case msg.missing do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_bytes(msg.missing)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:missing, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.PercentilesAggregation))
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
              {[field_name: delimited], rest}

            {2, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 percentiles:
                   msg.percentiles ++ Protox.Decode.parse_repeated_double([], delimited)
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_double(bytes)
              {[percentiles: msg.percentiles ++ [value]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[missing: delimited], rest}

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
        ExAliyunOts.TableStoreSearch.PercentilesAggregation,
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
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:percentiles, :unpacked, :double},
        3 => {:missing, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        field_name: {1, {:scalar, ""}, :string},
        missing: {3, {:scalar, ""}, :bytes},
        percentiles: {2, :unpacked, :double}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fieldName",
          kind: {:scalar, ""},
          label: :optional,
          name: :field_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "percentiles",
          kind: :unpacked,
          label: :repeated,
          name: :percentiles,
          tag: 2,
          type: :double
        },
        %{
          __struct__: Protox.Field,
          json_name: "missing",
          kind: {:scalar, ""},
          label: :optional,
          name: :missing,
          tag: 3,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:field_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("fieldName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("field_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:percentiles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "percentiles",
             kind: :unpacked,
             label: :repeated,
             name: :percentiles,
             tag: 2,
             type: :double
           }}
        end

        def field_def("percentiles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "percentiles",
             kind: :unpacked,
             label: :repeated,
             name: :percentiles,
             tag: 2,
             type: :double
           }}
        end

        []
      ),
      (
        def field_def(:missing) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missing",
             kind: {:scalar, ""},
             label: :optional,
             name: :missing,
             tag: 3,
             type: :bytes
           }}
        end

        def field_def("missing") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "missing",
             kind: {:scalar, ""},
             label: :optional,
             name: :missing,
             tag: 3,
             type: :bytes
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
    def default(:field_name) do
      {:ok, ""}
    end,
    def default(:percentiles) do
      {:error, :no_default_value}
    end,
    def default(:missing) do
      {:ok, ""}
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