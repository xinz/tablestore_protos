# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ConsumedCapacity) do
  @moduledoc false
  (
    defstruct(capacity_unit: nil)

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
          [] |> encode_capacity_unit(msg)
        end
      )

      []

      [
        defp(encode_capacity_unit(acc, msg)) do
          try do
            case(msg.capacity_unit) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:capacity_unit]))

              _ ->
                [acc, "\n", Protox.Encode.encode_message(msg.capacity_unit)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:capacity_unit, "invalid field value"),
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
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.ConsumedCapacity))

            case([:capacity_unit] -- set_fields) do
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

                {[:capacity_unit | set_fields],
                 [
                   capacity_unit:
                     Protox.Message.merge(
                       msg.capacity_unit,
                       ExAliyunOts.TableStore.CapacityUnit.decode!(delimited)
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
          ExAliyunOts.TableStore.ConsumedCapacity,
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
      %{1 => {:capacity_unit, {:scalar, nil}, {:message, ExAliyunOts.TableStore.CapacityUnit}}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{capacity_unit: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStore.CapacityUnit}}}
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "capacityUnit",
          kind: {:scalar, nil},
          label: :required,
          name: :capacity_unit,
          tag: 1,
          type: {:message, ExAliyunOts.TableStore.CapacityUnit}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:capacity_unit)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "capacityUnit",
             kind: {:scalar, nil},
             label: :required,
             name: :capacity_unit,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.CapacityUnit}
           }}
        end

        def(field_def("capacityUnit")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "capacityUnit",
             kind: {:scalar, nil},
             label: :required,
             name: :capacity_unit,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.CapacityUnit}
           }}
        end

        def(field_def("capacity_unit")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "capacityUnit",
             kind: {:scalar, nil},
             label: :required,
             name: :capacity_unit,
             tag: 1,
             type: {:message, ExAliyunOts.TableStore.CapacityUnit}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:capacity_unit]
    def(required_fields()) do
      [:capacity_unit]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:capacity_unit)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end