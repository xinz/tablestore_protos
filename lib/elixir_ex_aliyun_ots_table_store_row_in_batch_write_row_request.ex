# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.RowInBatchWriteRowRequest) do
  @moduledoc false
  defstruct(type: nil, row_change: nil, condition: nil, return_content: nil)

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
        |> encode_type(msg)
        |> encode_row_change(msg)
        |> encode_condition(msg)
        |> encode_return_content(msg)
      end
    )

    []

    [
      defp(encode_type(acc, msg)) do
        try do
          case(msg.type) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:type]))

            _ ->
              [
                acc,
                "\b",
                msg.type
                |> ExAliyunOts.TableStore.OperationType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_row_change(acc, msg)) do
        try do
          case(msg.row_change) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:row_change]))

            _ ->
              [acc, <<18>>, Protox.Encode.encode_bytes(msg.row_change)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:row_change, "invalid field value"), __STACKTRACE__)
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.RowInBatchWriteRowRequest))

          case([:type, :row_change, :condition] -- set_fields) do
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
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.OperationType)

              {[:type | set_fields], [type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[:row_change | set_fields], [row_change: delimited], rest}

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
        ExAliyunOts.TableStore.RowInBatchWriteRowRequest,
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
        1 => {:type, {:scalar, :PUT}, {:enum, ExAliyunOts.TableStore.OperationType}},
        2 => {:row_change, {:scalar, ""}, :bytes},
        3 => {:condition, {:scalar, nil}, {:message, ExAliyunOts.TableStore.Condition}},
        4 => {:return_content, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ReturnContent}}
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
        row_change: {2, {:scalar, ""}, :bytes},
        type: {1, {:scalar, :PUT}, {:enum, ExAliyunOts.TableStore.OperationType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, :PUT},
          label: :required,
          name: :type,
          tag: 1,
          type: {:enum, ExAliyunOts.TableStore.OperationType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowChange",
          kind: {:scalar, ""},
          label: :required,
          name: :row_change,
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
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :PUT},
             label: :required,
             name: :type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStore.OperationType}
           }}
        end

        def(field_def("type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :PUT},
             label: :required,
             name: :type,
             tag: 1,
             type: {:enum, ExAliyunOts.TableStore.OperationType}
           }}
        end

        []
      ),
      (
        def(field_def(:row_change)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowChange",
             kind: {:scalar, ""},
             label: :required,
             name: :row_change,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("rowChange")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowChange",
             kind: {:scalar, ""},
             label: :required,
             name: :row_change,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("row_change")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowChange",
             kind: {:scalar, ""},
             label: :required,
             name: :row_change,
             tag: 2,
             type: :bytes
           }}
        end
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
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: [(:type | :row_change) | :condition]
    def(required_fields()) do
      [:type, :row_change, :condition]
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
    def(default(:type)) do
      {:ok, :PUT}
    end,
    def(default(:row_change)) do
      {:ok, ""}
    end,
    def(default(:condition)) do
      {:ok, nil}
    end,
    def(default(:return_content)) do
      {:ok, nil}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end