# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.CapacityUnit) do
  @moduledoc false
  (
    defstruct(read: nil, write: nil)

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
          [] |> encode_read(msg) |> encode_write(msg)
        end
      )

      []

      [
        defp(encode_read(acc, msg)) do
          try do
            case(msg.read) do
              nil ->
                acc

              _ ->
                [acc, "\b", Protox.Encode.encode_int32(msg.read)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:read, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_write(acc, msg)) do
          try do
            case(msg.write) do
              nil ->
                acc

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int32(msg.write)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:write, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.CapacityUnit))
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
                {[read: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[write: value], rest}

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
          ExAliyunOts.TableStore.CapacityUnit,
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
      %{1 => {:read, {:scalar, 0}, :int32}, 2 => {:write, {:scalar, 0}, :int32}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{read: {1, {:scalar, 0}, :int32}, write: {2, {:scalar, 0}, :int32}}
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "read",
          kind: {:scalar, 0},
          label: :optional,
          name: :read,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "write",
          kind: {:scalar, 0},
          label: :optional,
          name: :write,
          tag: 2,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:read)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "read",
             kind: {:scalar, 0},
             label: :optional,
             name: :read,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("read")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "read",
             kind: {:scalar, 0},
             label: :optional,
             name: :read,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:write)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "write",
             kind: {:scalar, 0},
             label: :optional,
             name: :write,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("write")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "write",
             kind: {:scalar, 0},
             label: :optional,
             name: :write,
             tag: 2,
             type: :int32
           }}
        end

        []
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
      def(default(:read)) do
        {:ok, 0}
      end,
      def(default(:write)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end