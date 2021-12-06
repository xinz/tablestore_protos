# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.PutRowRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, row: nil, condition: nil, return_content: nil, transaction_id: nil)

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
          |> encode_row(msg)
          |> encode_condition(msg)
          |> encode_return_content(msg)
          |> encode_transaction_id(msg)
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
        defp(encode_row(acc, msg)) do
          try do
            case(msg.row) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:row]))

              _ ->
                [acc, <<18>>, Protox.Encode.encode_bytes(msg.row)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:row, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_condition(acc, msg)) do
          try do
            case(msg.condition) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:condition]))

              _ ->
                [acc, <<26>>, Protox.Encode.encode_message(msg.condition)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:condition, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_return_content(acc, msg)) do
          try do
            case(msg.return_content) do
              nil ->
                acc

              _ ->
                [acc, "\"", Protox.Encode.encode_message(msg.return_content)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:return_content, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_transaction_id(acc, msg)) do
          try do
            case(msg.transaction_id) do
              nil ->
                acc

              _ ->
                [acc, "*", Protox.Encode.encode_string(msg.transaction_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:transaction_id, "invalid field value"),
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.PutRowRequest))

            case([:table_name, :row, :condition] -- set_fields) do
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:row | set_fields], [row: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:condition | set_fields],
                 [
                   condition:
                     Protox.MergeMessage.merge(
                       msg.condition,
                       ExAliyunOts.TableStore.Condition.decode!(delimited)
                     )
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:return_content | set_fields],
                 [
                   return_content:
                     Protox.MergeMessage.merge(
                       msg.return_content,
                       ExAliyunOts.TableStore.ReturnContent.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:transaction_id | set_fields], [transaction_id: delimited], rest}

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

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStore.PutRowRequest,
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

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:table_name, {:scalar, ""}, :string},
        2 => {:row, {:scalar, ""}, :bytes},
        3 => {:condition, {:scalar, nil}, {:message, ExAliyunOts.TableStore.Condition}},
        4 => {:return_content, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReturnContent}},
        5 => {:transaction_id, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        condition: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStore.Condition}},
        return_content: {4, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReturnContent}},
        row: {2, {:scalar, ""}, :bytes},
        table_name: {1, {:scalar, ""}, :string},
        transaction_id: {5, {:scalar, ""}, :string}
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
          json_name: "row",
          kind: {:scalar, ""},
          label: :required,
          name: :row,
          tag: 2,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "condition",
          kind: {:scalar, nil},
          label: :required,
          name: :condition,
          tag: 3,
          type: {:message, ExAliyunOts.TableStore.Condition}
        },
        %{
          __struct__: Protox.Field,
          json_name: "returnContent",
          kind: {:scalar, nil},
          label: :optional,
          name: :return_content,
          tag: 4,
          type: {:message, ExAliyunOts.TableStore.ReturnContent}
        },
        %{
          __struct__: Protox.Field,
          json_name: "transactionId",
          kind: {:scalar, ""},
          label: :optional,
          name: :transaction_id,
          tag: 5,
          type: :string
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
        def(field_def(:row)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "row",
             kind: {:scalar, ""},
             label: :required,
             name: :row,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("row")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "row",
             kind: {:scalar, ""},
             label: :required,
             name: :row,
             tag: 2,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:condition)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "condition",
             kind: {:scalar, nil},
             label: :required,
             name: :condition,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.Condition}
           }}
        end

        def(field_def("condition")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "condition",
             kind: {:scalar, nil},
             label: :required,
             name: :condition,
             tag: 3,
             type: {:message, ExAliyunOts.TableStore.Condition}
           }}
        end

        []
      ),
      (
        def(field_def(:return_content)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnContent",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_content,
             tag: 4,
             type: {:message, ExAliyunOts.TableStore.ReturnContent}
           }}
        end

        def(field_def("returnContent")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnContent",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_content,
             tag: 4,
             type: {:message, ExAliyunOts.TableStore.ReturnContent}
           }}
        end

        def(field_def("return_content")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnContent",
             kind: {:scalar, nil},
             label: :optional,
             name: :return_content,
             tag: 4,
             type: {:message, ExAliyunOts.TableStore.ReturnContent}
           }}
        end
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
             tag: 5,
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
             tag: 5,
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
             tag: 5,
             type: :string
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [(:table_name | :row) | :condition]
    def(required_fields()) do
      [:table_name, :row, :condition]
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
      def(default(:row)) do
        {:ok, ""}
      end,
      def(default(:condition)) do
        {:ok, nil}
      end,
      def(default(:return_content)) do
        {:ok, nil}
      end,
      def(default(:transaction_id)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end