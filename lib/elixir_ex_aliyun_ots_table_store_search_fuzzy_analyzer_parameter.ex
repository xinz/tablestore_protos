# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.FuzzyAnalyzerParameter) do
  @moduledoc false
  defstruct(min_chars: nil, max_chars: nil)

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
        [] |> encode_min_chars(msg) |> encode_max_chars(msg)
      end
    )

    []

    [
      defp(encode_min_chars(acc, msg)) do
        try do
          case(msg.min_chars) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int32(msg.min_chars)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:min_chars, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_max_chars(acc, msg)) do
        try do
          case(msg.max_chars) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(msg.max_chars)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:max_chars, "invalid field value"), __STACKTRACE__)
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.FuzzyAnalyzerParameter))
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
              {[min_chars: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[max_chars: value], rest}

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
        ExAliyunOts.TableStoreSearch.FuzzyAnalyzerParameter,
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

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{1 => {:min_chars, {:scalar, 0}, :int32}, 2 => {:max_chars, {:scalar, 0}, :int32}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{max_chars: {2, {:scalar, 0}, :int32}, min_chars: {1, {:scalar, 0}, :int32}}
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "minChars",
          kind: {:scalar, 0},
          label: :optional,
          name: :min_chars,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxChars",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_chars,
          tag: 2,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:min_chars)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_chars,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("minChars")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_chars,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("min_chars")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "minChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :min_chars,
             tag: 1,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:max_chars)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_chars,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("maxChars")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_chars,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("max_chars")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxChars",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_chars,
             tag: 2,
             type: :int32
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def(syntax()) do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def(default(:min_chars)) do
      {:ok, 0}
    end,
    def(default(:max_chars)) do
      {:ok, 0}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end