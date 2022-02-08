# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.RangeQuery) do
  @moduledoc false
  defstruct(
    field_name: nil,
    range_from: nil,
    range_to: nil,
    include_lower: nil,
    include_upper: nil
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
        |> encode_field_name(msg)
        |> encode_range_from(msg)
        |> encode_range_to(msg)
        |> encode_include_lower(msg)
        |> encode_include_upper(msg)
      end
    )

    []

    [
      defp(encode_field_name(acc, msg)) do
        try do
          case(msg.field_name) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(msg.field_name)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:field_name, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_range_from(acc, msg)) do
        try do
          case(msg.range_from) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_bytes(msg.range_from)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:range_from, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_range_to(acc, msg)) do
        try do
          case(msg.range_to) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_bytes(msg.range_to)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:range_to, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_include_lower(acc, msg)) do
        try do
          case(msg.include_lower) do
            nil ->
              acc

            _ ->
              [acc, " ", Protox.Encode.encode_bool(msg.include_lower)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:include_lower, "invalid field value"),
              __STACKTRACE__
            )
        end
      end,
      defp(encode_include_upper(acc, msg)) do
        try do
          case(msg.include_upper) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_bool(msg.include_upper)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:include_upper, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.RangeQuery))
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
              {[field_name: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[range_from: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[range_to: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[include_lower: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[include_upper: value], rest}

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
        ExAliyunOts.TableStoreSearch.RangeQuery,
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
      %{
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:range_from, {:scalar, ""}, :bytes},
        3 => {:range_to, {:scalar, ""}, :bytes},
        4 => {:include_lower, {:scalar, false}, :bool},
        5 => {:include_upper, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_name: {1, {:scalar, ""}, :string},
        include_lower: {4, {:scalar, false}, :bool},
        include_upper: {5, {:scalar, false}, :bool},
        range_from: {2, {:scalar, ""}, :bytes},
        range_to: {3, {:scalar, ""}, :bytes}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
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
          json_name: "rangeFrom",
          kind: {:scalar, ""},
          label: :optional,
          name: :range_from,
          tag: 2,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "rangeTo",
          kind: {:scalar, ""},
          label: :optional,
          name: :range_to,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "includeLower",
          kind: {:scalar, false},
          label: :optional,
          name: :include_lower,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "includeUpper",
          kind: {:scalar, false},
          label: :optional,
          name: :include_upper,
          tag: 5,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:field_name)) do
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

        def(field_def("fieldName")) do
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

        def(field_def("field_name")) do
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
        def(field_def(:range_from)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFrom",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_from,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("rangeFrom")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFrom",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_from,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("range_from")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeFrom",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_from,
             tag: 2,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:range_to)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTo",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_to,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("rangeTo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTo",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_to,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("range_to")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rangeTo",
             kind: {:scalar, ""},
             label: :optional,
             name: :range_to,
             tag: 3,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:include_lower)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeLower",
             kind: {:scalar, false},
             label: :optional,
             name: :include_lower,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("includeLower")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeLower",
             kind: {:scalar, false},
             label: :optional,
             name: :include_lower,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("include_lower")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeLower",
             kind: {:scalar, false},
             label: :optional,
             name: :include_lower,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:include_upper)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeUpper",
             kind: {:scalar, false},
             label: :optional,
             name: :include_upper,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("includeUpper")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeUpper",
             kind: {:scalar, false},
             label: :optional,
             name: :include_upper,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("include_upper")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "includeUpper",
             kind: {:scalar, false},
             label: :optional,
             name: :include_upper,
             tag: 5,
             type: :bool
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
    def(default(:field_name)) do
      {:ok, ""}
    end,
    def(default(:range_from)) do
      {:ok, ""}
    end,
    def(default(:range_to)) do
      {:ok, ""}
    end,
    def(default(:include_lower)) do
      {:ok, false}
    end,
    def(default(:include_upper)) do
      {:ok, false}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end