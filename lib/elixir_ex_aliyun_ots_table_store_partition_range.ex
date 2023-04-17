# credo:disable-for-this-file
defmodule ExAliyunOts.TableStore.PartitionRange do
  @moduledoc false
  defstruct begin: nil, end: nil

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
        [] |> encode_begin(msg) |> encode_end(msg)
      end
    )

    []

    [
      defp encode_begin(acc, msg) do
        try do
          case msg.begin do
            nil -> raise Protox.RequiredFieldsError.new([:begin])
            _ -> [acc, "\n", Protox.Encode.encode_bytes(msg.begin)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:begin, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_end(acc, msg) do
        try do
          case msg.end do
            nil -> raise Protox.RequiredFieldsError.new([:end])
            _ -> [acc, "\x12", Protox.Encode.encode_bytes(msg.end)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:end, "invalid field value"), __STACKTRACE__
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.PartitionRange))

          case [:begin, :end] -- set_fields do
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:begin | set_fields], [begin: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:end | set_fields], [end: delimited], rest}

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
        ExAliyunOts.TableStore.PartitionRange,
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
      %{1 => {:begin, {:scalar, ""}, :bytes}, 2 => {:end, {:scalar, ""}, :bytes}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{begin: {1, {:scalar, ""}, :bytes}, end: {2, {:scalar, ""}, :bytes}}
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "begin",
          kind: {:scalar, ""},
          label: :required,
          name: :begin,
          tag: 1,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "end",
          kind: {:scalar, ""},
          label: :required,
          name: :end,
          tag: 2,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:begin) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "begin",
             kind: {:scalar, ""},
             label: :required,
             name: :begin,
             tag: 1,
             type: :bytes
           }}
        end

        def field_def("begin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "begin",
             kind: {:scalar, ""},
             label: :required,
             name: :begin,
             tag: 1,
             type: :bytes
           }}
        end

        []
      ),
      (
        def field_def(:end) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "end",
             kind: {:scalar, ""},
             label: :required,
             name: :end,
             tag: 2,
             type: :bytes
           }}
        end

        def field_def("end") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "end",
             kind: {:scalar, ""},
             label: :required,
             name: :end,
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
    @spec required_fields() :: [:begin | :end]
    def required_fields() do
      [:begin, :end]
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
    def default(:begin) do
      {:ok, ""}
    end,
    def default(:end) do
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
