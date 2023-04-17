# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreFilter.Filter do
  @moduledoc false
  defstruct type: nil, filter: nil

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
        [] |> encode_type(msg) |> encode_filter(msg)
      end
    )

    []

    [
      defp encode_type(acc, msg) do
        try do
          case msg.type do
            nil ->
              raise Protox.RequiredFieldsError.new([:type])

            _ ->
              [
                acc,
                "\b",
                msg.type
                |> ExAliyunOts.TableStoreFilter.FilterType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_filter(acc, msg) do
        try do
          case msg.filter do
            nil -> raise Protox.RequiredFieldsError.new([:filter])
            _ -> [acc, "\x12", Protox.Encode.encode_bytes(msg.filter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:filter, "invalid field value"), __STACKTRACE__
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
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreFilter.Filter))

          case [:type, :filter] -- set_fields do
            [] -> msg
            missing_fields -> raise Protox.RequiredFieldsError.new(missing_fields)
          end
        end
      )
    )

    (
      @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
      defp parse_key_value(set_fields, <<>>, msg) do
        {msg, set_fields}
      end

      defp parse_key_value(set_fields, bytes, msg) do
        {new_set_fields, field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreFilter.FilterType)

              {[:type | set_fields], [type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:filter | set_fields], [filter: delimited], rest}

            {tag, wire_type, rest} ->
              {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {set_fields, [], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(new_set_fields, rest, msg_updated)
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
        ExAliyunOts.TableStoreFilter.Filter,
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
        1 =>
          {:type, {:scalar, :FT_SINGLE_COLUMN_VALUE},
           {:enum, ExAliyunOts.TableStoreFilter.FilterType}},
        2 => {:filter, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        filter: {2, {:scalar, ""}, :bytes},
        type:
          {1, {:scalar, :FT_SINGLE_COLUMN_VALUE},
           {:enum, ExAliyunOts.TableStoreFilter.FilterType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, :FT_SINGLE_COLUMN_VALUE},
          label: :required,
          name: :type,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStoreFilter.FilterType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "filter",
          kind: {:scalar, ""},
          label: :required,
          name: :filter,
          tag: 2,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :FT_SINGLE_COLUMN_VALUE},
             label: :required,
             name: :type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.FilterType}
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :FT_SINGLE_COLUMN_VALUE},
             label: :required,
             name: :type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStoreFilter.FilterType}
           }}
        end

        []
      ),
      (
        def field_def(:filter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, ""},
             label: :required,
             name: :filter,
             tag: 2,
             type: :bytes
           }}
        end

        def field_def("filter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, ""},
             label: :required,
             name: :filter,
             tag: 2,
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
    @spec required_fields() :: [:type | :filter]
    def required_fields() do
      [:type, :filter]
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
    def default(:type) do
      {:ok, :FT_SINGLE_COLUMN_VALUE}
    end,
    def default(:filter) do
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
