# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetRowResponse) do
  @moduledoc false
  (
    defstruct(consumed: nil, row: nil, next_token: nil)

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
          [] |> encode_consumed(msg) |> encode_row(msg) |> encode_next_token(msg)
        end
      )

      []

      [
        defp(encode_consumed(acc, msg)) do
          try do
            case(msg.consumed) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:consumed]))

              _ ->
                [acc, "\n", Protox.Encode.encode_message(msg.consumed)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:consumed, "invalid field value"), __STACKTRACE__)
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
        defp(encode_next_token(acc, msg)) do
          try do
            case(msg.next_token) do
              nil ->
                acc

              _ ->
                [acc, <<26>>, Protox.Encode.encode_bytes(msg.next_token)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:next_token, "invalid field value"),
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.GetRowResponse))

            case([:consumed, :row] -- set_fields) do
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

                {[:consumed | set_fields],
                 [
                   consumed:
                     Protox.Message.merge(
                       msg.consumed,
                       ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:row | set_fields], [row: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:next_token | set_fields], [next_token: delimited], rest}

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
          ExAliyunOts.TableStore.GetRowResponse,
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
        1 => {:consumed, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        2 => {:row, {:scalar, ""}, :bytes},
        3 => {:next_token, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        consumed: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        next_token: {3, {:scalar, ""}, :bytes},
        row: {2, {:scalar, ""}, :bytes}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "consumed",
          kind: {:scalar, nil},
          label: :required,
          name: :consumed,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
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
          json_name: "nextToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :next_token,
          tag: 3,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:consumed)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumed",
             kind: {:scalar, nil},
             label: :required,
             name: :consumed,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
           }}
        end

        def(field_def("consumed")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "consumed",
             kind: {:scalar, nil},
             label: :required,
             name: :consumed,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.ConsumedCapacity}
           }}
        end

        []
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
        def(field_def(:next_token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("nextToken")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("next_token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nextToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :next_token,
             tag: 3,
             type: :bytes
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:consumed | :row]
    def(required_fields()) do
      [:consumed, :row]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:consumed)) do
        {:ok, nil}
      end,
      def(default(:row)) do
        {:ok, ""}
      end,
      def(default(:next_token)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end