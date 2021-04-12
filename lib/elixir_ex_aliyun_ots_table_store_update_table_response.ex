# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.UpdateTableResponse) do
  @moduledoc false
  (
    defstruct(reserved_throughput_details: nil, table_options: nil, stream_details: nil)

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
          |> encode_reserved_throughput_details(msg)
          |> encode_table_options(msg)
          |> encode_stream_details(msg)
        end
      )

      []

      [
        defp(encode_reserved_throughput_details(acc, msg)) do
          case(msg.reserved_throughput_details) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:reserved_throughput_details]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_table_options(acc, msg)) do
          case(msg.table_options) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_options]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_stream_details(acc, msg)) do
          field_value = msg.stream_details

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.UpdateTableResponse))

          case([:reserved_throughput_details, :table_options] -- set_fields) do
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
                value = ExAliyunOts.TableStore.ReservedThroughputDetails.decode!(delimited)

                field =
                  {:reserved_throughput_details,
                   Protox.Message.merge(msg.reserved_throughput_details, value)}

                {[:reserved_throughput_details | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.TableOptions.decode!(delimited)
                field = {:table_options, Protox.Message.merge(msg.table_options, value)}
                {[:table_options | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.StreamDetails.decode!(delimited)
                field = {:stream_details, Protox.Message.merge(msg.stream_details, value)}
                {[:stream_details | set_fields], [field], rest}

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
        1 =>
          {:reserved_throughput_details, {:default, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        2 => {:table_options, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        3 => {:stream_details, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        reserved_throughput_details:
          {1, {:default, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughputDetails}},
        stream_details: {3, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamDetails}},
        table_options: {2, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}}
      }
    end

    []
    @spec required_fields() :: [:reserved_throughput_details | :table_options]
    def(required_fields()) do
      [:reserved_throughput_details, :table_options]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:reserved_throughput_details)) do
        {:ok, nil}
      end,
      def(default(:table_options)) do
        {:ok, nil}
      end,
      def(default(:stream_details)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end