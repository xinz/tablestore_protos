# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, split_size: nil, split_size_unit_in_byte: nil)

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
          |> encode_table_name(msg)
          |> encode_split_size(msg)
          |> encode_split_size_unit_in_byte(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          try do
            case(msg.table_name) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:table_name]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.table_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:table_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_split_size(acc, msg)) do
          try do
            case(msg.split_size) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:split_size]))

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int64(msg.split_size)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:split_size, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_split_size_unit_in_byte(acc, msg)) do
          try do
            case(msg.split_size_unit_in_byte) do
              nil ->
                acc

              _ ->
                [acc, <<24>>, Protox.Encode.encode_int64(msg.split_size_unit_in_byte)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:split_size_unit_in_byte, "invalid field value"),
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
            {msg, set_fields} =
              parse_key_value(
                [],
                bytes,
                struct(ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest)
              )

            case([:table_name, :split_size] -- set_fields) do
              [] ->
                msg

              missing_fields ->
                raise(Protox.RequiredFieldsError.new(missing_fields))
            end
          end
        )
      )

      (
        @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
        defp(parse_key_value(set_fields, <<>>, msg)) do
          {msg, set_fields}
        end

        defp(parse_key_value(set_fields, bytes, msg)) do
          {new_set_fields, field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:table_name | set_fields], [table_name: delimited], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[:split_size | set_fields], [split_size: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[:split_size_unit_in_byte | set_fields], [split_size_unit_in_byte: value], rest}

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
          ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest,
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
      %{
        1 => {:table_name, {:scalar, ""}, :string},
        2 => {:split_size, {:scalar, 0}, :int64},
        3 => {:split_size_unit_in_byte, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        split_size: {2, {:scalar, 0}, :int64},
        split_size_unit_in_byte: {3, {:scalar, 0}, :int64},
        table_name: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tableName",
          kind: {:scalar, ""},
          label: :required,
          name: :table_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "splitSize",
          kind: {:scalar, 0},
          label: :required,
          name: :split_size,
          tag: 2,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "splitSizeUnitInByte",
          kind: {:scalar, 0},
          label: :optional,
          name: :split_size_unit_in_byte,
          tag: 3,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:table_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("tableName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("table_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tableName",
             kind: {:scalar, ""},
             label: :required,
             name: :table_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:split_size)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSize",
             kind: {:scalar, 0},
             label: :required,
             name: :split_size,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("splitSize")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSize",
             kind: {:scalar, 0},
             label: :required,
             name: :split_size,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("split_size")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSize",
             kind: {:scalar, 0},
             label: :required,
             name: :split_size,
             tag: 2,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:split_size_unit_in_byte)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSizeUnitInByte",
             kind: {:scalar, 0},
             label: :optional,
             name: :split_size_unit_in_byte,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("splitSizeUnitInByte")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSizeUnitInByte",
             kind: {:scalar, 0},
             label: :optional,
             name: :split_size_unit_in_byte,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("split_size_unit_in_byte")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitSizeUnitInByte",
             kind: {:scalar, 0},
             label: :optional,
             name: :split_size_unit_in_byte,
             tag: 3,
             type: :int64
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:table_name | :split_size]
    def(required_fields()) do
      [:table_name, :split_size]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:table_name)) do
        {:ok, ""}
      end,
      def(default(:split_size)) do
        {:ok, 0}
      end,
      def(default(:split_size_unit_in_byte)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end