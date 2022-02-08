# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.SingleWordAnalyzerParameter) do
  @moduledoc false
  defstruct(case_sensitive: nil, delimit_word: nil)

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
        [] |> encode_case_sensitive(msg) |> encode_delimit_word(msg)
      end
    )

    []

    [
      defp(encode_case_sensitive(acc, msg)) do
        try do
          case(msg.case_sensitive) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_bool(msg.case_sensitive)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:case_sensitive, "invalid field value"),
              __STACKTRACE__
            )
        end
      end,
      defp(encode_delimit_word(acc, msg)) do
        try do
          case(msg.delimit_word) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_bool(msg.delimit_word)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:delimit_word, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.SingleWordAnalyzerParameter))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[case_sensitive: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[delimit_word: value], rest}

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
        ExAliyunOts.TableStoreSearch.SingleWordAnalyzerParameter,
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
        1 => {:case_sensitive, {:scalar, false}, :bool},
        2 => {:delimit_word, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{case_sensitive: {1, {:scalar, false}, :bool}, delimit_word: {2, {:scalar, false}, :bool}}
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "caseSensitive",
          kind: {:scalar, false},
          label: :optional,
          name: :case_sensitive,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "delimitWord",
          kind: {:scalar, false},
          label: :optional,
          name: :delimit_word,
          tag: 2,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:case_sensitive)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseSensitive",
             kind: {:scalar, false},
             label: :optional,
             name: :case_sensitive,
             tag: 1,
             type: :bool
           }}
        end

        def(field_def("caseSensitive")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseSensitive",
             kind: {:scalar, false},
             label: :optional,
             name: :case_sensitive,
             tag: 1,
             type: :bool
           }}
        end

        def(field_def("case_sensitive")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "caseSensitive",
             kind: {:scalar, false},
             label: :optional,
             name: :case_sensitive,
             tag: 1,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:delimit_word)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "delimitWord",
             kind: {:scalar, false},
             label: :optional,
             name: :delimit_word,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("delimitWord")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "delimitWord",
             kind: {:scalar, false},
             label: :optional,
             name: :delimit_word,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("delimit_word")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "delimitWord",
             kind: {:scalar, false},
             label: :optional,
             name: :delimit_word,
             tag: 2,
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
    def(default(:case_sensitive)) do
      {:ok, false}
    end,
    def(default(:delimit_word)) do
      {:ok, false}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end