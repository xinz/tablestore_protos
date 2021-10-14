# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.BatchWriteRowRequest) do
  @moduledoc false
  (
    defstruct(tables: [], transaction_id: nil, is_atomic: nil)

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
          [] |> encode_tables(msg) |> encode_transaction_id(msg) |> encode_is_atomic(msg)
        end
      )

      []

      [
        defp(encode_tables(acc, msg)) do
          try do
            case(msg.tables) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\n", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tables, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_transaction_id(acc, msg)) do
          try do
            case(msg.transaction_id) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.transaction_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:transaction_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_is_atomic(acc, msg)) do
          try do
            case(msg.is_atomic) do
              nil ->
                acc

              _ ->
                [acc, <<24>>, Protox.Encode.encode_bool(msg.is_atomic)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_atomic, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.BatchWriteRowRequest))
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

                {[
                   tables:
                     msg.tables ++
                       [ExAliyunOts.TableStore.TableInBatchWriteRowRequest.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[transaction_id: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_atomic: value], rest}

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
          ExAliyunOts.TableStore.BatchWriteRowRequest,
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
        1 => {:tables, :unpacked, {:message, ExAliyunOts.TableStore.TableInBatchWriteRowRequest}},
        2 => {:transaction_id, {:scalar, ""}, :string},
        3 => {:is_atomic, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        is_atomic: {3, {:scalar, false}, :bool},
        tables: {1, :unpacked, {:message, ExAliyunOts.TableStore.TableInBatchWriteRowRequest}},
        transaction_id: {2, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tables",
          kind: :unpacked,
          label: :repeated,
          name: :tables,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.TableInBatchWriteRowRequest}
        },
        %{
          __struct__: Protox.Field,
          json_name: "transactionId",
          kind: {:scalar, ""},
          label: :optional,
          name: :transaction_id,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isAtomic",
          kind: {:scalar, false},
          label: :optional,
          name: :is_atomic,
          tag: 3,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:tables)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tables",
             kind: :unpacked,
             label: :repeated,
             name: :tables,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableInBatchWriteRowRequest}
           }}
        end

        def(field_def("tables")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tables",
             kind: :unpacked,
             label: :repeated,
             name: :tables,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.TableInBatchWriteRowRequest}
           }}
        end

        []
      ),
      (
        def(field_def(:transaction_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("transactionId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("transaction_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:is_atomic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAtomic",
             kind: {:scalar, false},
             label: :optional,
             name: :is_atomic,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("isAtomic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAtomic",
             kind: {:scalar, false},
             label: :optional,
             name: :is_atomic,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("is_atomic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isAtomic",
             kind: {:scalar, false},
             label: :optional,
             name: :is_atomic,
             tag: 3,
             type: :bool
           }}
        end
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
      def(default(:tables)) do
        {:error, :no_default_value}
      end,
      def(default(:transaction_id)) do
        {:ok, ""}
      end,
      def(default(:is_atomic)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end