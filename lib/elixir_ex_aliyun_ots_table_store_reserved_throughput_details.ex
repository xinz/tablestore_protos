# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ReservedThroughputDetails) do
  @moduledoc false
  (
    defstruct(capacity_unit: nil, last_increase_time: nil, last_decrease_time: nil)

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_capacity_unit(msg)
          |> encode_last_increase_time(msg)
          |> encode_last_decrease_time(msg)
        end
      )

      []

      [
        defp(encode_capacity_unit(acc, msg)) do
          case(msg.capacity_unit) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:capacity_unit]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_last_increase_time(acc, msg)) do
          case(msg.last_increase_time) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:last_increase_time]))

            field_value ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_last_decrease_time(acc, msg)) do
          field_value = msg.last_decrease_time

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int64(field_value)]
          end
        end
      ]

      []
    )

    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def(decode!(bytes)) do
          {msg, set_fields} =
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.ReservedThroughputDetails))

          case([:capacity_unit, :last_increase_time] -- set_fields) do
            [] ->
              msg

            missing_fields ->
              raise(Protox.RequiredFieldsError.new(missing_fields))
          end
        end
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
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.CapacityUnit.decode!(delimited)
                field = {:capacity_unit, Protox.Message.merge(msg.capacity_unit, value)}
                {[:capacity_unit | set_fields], [field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:last_increase_time, value}
                {[:last_increase_time | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:last_decrease_time, value}
                {[:last_decrease_time | set_fields], [field], rest}

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

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:capacity_unit, {:default, nil}, {:message, ExAliyunOts.TableStore.CapacityUnit}},
        2 => {:last_increase_time, {:default, 0}, :int64},
        3 => {:last_decrease_time, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        capacity_unit: {1, {:default, nil}, {:message, ExAliyunOts.TableStore.CapacityUnit}},
        last_decrease_time: {3, {:default, 0}, :int64},
        last_increase_time: {2, {:default, 0}, :int64}
      }
    end

    []
    @spec required_fields() :: [:capacity_unit | :last_increase_time]
    def(required_fields()) do
      [:capacity_unit, :last_increase_time]
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
      def(default(:last_increase_time)) do
        {:ok, 0}
      end,
      def(default(:last_decrease_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end