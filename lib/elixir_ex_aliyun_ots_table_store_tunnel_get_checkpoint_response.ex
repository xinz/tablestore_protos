# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreTunnel.GetCheckpointResponse do
  @moduledoc false
  defstruct checkpoint: nil, sequence_number: nil

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
        [] |> encode_checkpoint(msg) |> encode_sequence_number(msg)
      end
    )

    []

    [
      defp encode_checkpoint(acc, msg) do
        try do
          case msg.checkpoint do
            nil -> raise Protox.RequiredFieldsError.new([:checkpoint])
            _ -> [acc, "\n", Protox.Encode.encode_string(msg.checkpoint)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:checkpoint, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sequence_number(acc, msg) do
        try do
          case msg.sequence_number do
            nil -> raise Protox.RequiredFieldsError.new([:sequence_number])
            _ -> [acc, "\x10", Protox.Encode.encode_int64(msg.sequence_number)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sequence_number, "invalid field value"),
                    __STACKTRACE__
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStoreTunnel.GetCheckpointResponse))

          case [:checkpoint, :sequence_number] -- set_fields do
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
              {[:checkpoint | set_fields], [checkpoint: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int64(bytes)
              {[:sequence_number | set_fields], [sequence_number: value], rest}

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
        ExAliyunOts.TableStoreTunnel.GetCheckpointResponse,
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
      %{1 => {:checkpoint, {:scalar, ""}, :string}, 2 => {:sequence_number, {:scalar, 0}, :int64}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{checkpoint: {1, {:scalar, ""}, :string}, sequence_number: {2, {:scalar, 0}, :int64}}
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "checkpoint",
          kind: {:scalar, ""},
          label: :required,
          name: :checkpoint,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "sequenceNumber",
          kind: {:scalar, 0},
          label: :required,
          name: :sequence_number,
          tag: 2,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:checkpoint) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkpoint",
             kind: {:scalar, ""},
             label: :required,
             name: :checkpoint,
             tag: 1,
             type: :string
           }}
        end

        def field_def("checkpoint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkpoint",
             kind: {:scalar, ""},
             label: :required,
             name: :checkpoint,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:sequence_number) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sequenceNumber",
             kind: {:scalar, 0},
             label: :required,
             name: :sequence_number,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("sequenceNumber") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sequenceNumber",
             kind: {:scalar, 0},
             label: :required,
             name: :sequence_number,
             tag: 2,
             type: :int64
           }}
        end

        def field_def("sequence_number") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sequenceNumber",
             kind: {:scalar, 0},
             label: :required,
             name: :sequence_number,
             tag: 2,
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
    @spec required_fields() :: [:checkpoint | :sequence_number]
    def required_fields() do
      [:checkpoint, :sequence_number]
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
    def default(:checkpoint) do
      {:ok, ""}
    end,
    def default(:sequence_number) do
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
