# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse) do
  @moduledoc false
  (
    defstruct(consumed: nil, schema: [], split_points: [], locations: [])

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
          |> encode_consumed(msg)
          |> encode_schema(msg)
          |> encode_split_points(msg)
          |> encode_locations(msg)
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
        defp(encode_schema(acc, msg)) do
          try do
            case(msg.schema) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:schema, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_split_points(acc, msg)) do
          try do
            case(msg.split_points) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_bytes(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:split_points, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_locations(acc, msg)) do
          try do
            case(msg.locations) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:locations, "invalid field value"), __STACKTRACE__)
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
                struct(ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse)
              )

            case([:consumed] -- set_fields) do
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
                     Protox.MergeMessage.merge(
                       msg.consumed,
                       ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:schema | set_fields],
                 [
                   schema:
                     msg.schema ++ [ExAliyunOts.TableStore.PrimaryKeySchema.decode!(delimited)]
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:split_points | set_fields], [split_points: msg.split_points ++ [delimited]],
                 rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[:locations | set_fields],
                 [
                   locations:
                     msg.locations ++
                       [
                         ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation.decode!(
                           delimited
                         )
                       ]
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
          ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse,
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
        1 => {:consumed, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        2 => {:schema, :unpacked, {:message, ExAliyunOts.TableStore.PrimaryKeySchema}},
        3 => {:split_points, :unpacked, :bytes},
        4 =>
          {:locations, :unpacked,
           {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        consumed: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        locations:
          {4, :unpacked,
           {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}},
        schema: {2, :unpacked, {:message, ExAliyunOts.TableStore.PrimaryKeySchema}},
        split_points: {3, :unpacked, :bytes}
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
          json_name: "schema",
          kind: :unpacked,
          label: :repeated,
          name: :schema,
          tag: 2,
          type: {:message, ExAliyunOts.TableStore.PrimaryKeySchema}
        },
        %{
          __struct__: Protox.Field,
          json_name: "splitPoints",
          kind: :unpacked,
          label: :repeated,
          name: :split_points,
          tag: 3,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "locations",
          kind: :unpacked,
          label: :repeated,
          name: :locations,
          tag: 4,
          type: {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}
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
        def(field_def(:schema)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: :unpacked,
             label: :repeated,
             name: :schema,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.PrimaryKeySchema}
           }}
        end

        def(field_def("schema")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "schema",
             kind: :unpacked,
             label: :repeated,
             name: :schema,
             tag: 2,
             type: {:message, ExAliyunOts.TableStore.PrimaryKeySchema}
           }}
        end

        []
      ),
      (
        def(field_def(:split_points)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitPoints",
             kind: :unpacked,
             label: :repeated,
             name: :split_points,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("splitPoints")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitPoints",
             kind: :unpacked,
             label: :repeated,
             name: :split_points,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("split_points")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "splitPoints",
             kind: :unpacked,
             label: :repeated,
             name: :split_points,
             tag: 3,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:locations)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "locations",
             kind: :unpacked,
             label: :repeated,
             name: :locations,
             tag: 4,
             type:
               {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}
           }}
        end

        def(field_def("locations")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "locations",
             kind: :unpacked,
             label: :repeated,
             name: :locations,
             tag: 4,
             type:
               {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:consumed]
    def(required_fields()) do
      [:consumed]
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
      def(default(:schema)) do
        {:error, :no_default_value}
      end,
      def(default(:split_points)) do
        {:error, :no_default_value}
      end,
      def(default(:locations)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end