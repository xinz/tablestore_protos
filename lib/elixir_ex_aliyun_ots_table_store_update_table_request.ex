# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.UpdateTableRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, reserved_throughput: nil, table_options: nil, stream_spec: nil)

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
          |> encode_table_name(msg)
          |> encode_reserved_throughput(msg)
          |> encode_table_options(msg)
          |> encode_stream_spec(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_reserved_throughput(acc, msg)) do
          field_value = msg.reserved_throughput()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_table_options(acc, msg)) do
          field_value = msg.table_options()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_stream_spec(acc, msg)) do
          field_value = msg.stream_spec()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.UpdateTableRequest))

          case([:table_name] -- set_fields) do
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
                value = delimited
                field = {:table_name, value}
                {[:table_name | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.ReservedThroughput.decode!(delimited)

                field =
                  {:reserved_throughput, Protox.Message.merge(msg.reserved_throughput(), value)}

                {[:reserved_throughput | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.TableOptions.decode!(delimited)
                field = {:table_options, Protox.Message.merge(msg.table_options(), value)}
                {[:table_options | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.StreamSpecification.decode!(delimited)
                field = {:stream_spec, Protox.Message.merge(msg.stream_spec(), value)}
                {[:stream_spec | set_fields], [field], rest}

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
        1 => {:table_name, {:default, ""}, :string},
        2 =>
          {:reserved_throughput, {:default, nil},
           {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        3 => {:table_options, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}},
        4 =>
          {:stream_spec, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamSpecification}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        reserved_throughput:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStore.ReservedThroughput}},
        stream_spec: {4, {:default, nil}, {:message, ExAliyunOts.TableStore.StreamSpecification}},
        table_name: {1, {:default, ""}, :string},
        table_options: {3, {:default, nil}, {:message, ExAliyunOts.TableStore.TableOptions}}
      }
    end

    []
    @spec required_fields() :: [:table_name]
    def(required_fields()) do
      [:table_name]
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
      def(default(:reserved_throughput)) do
        {:ok, nil}
      end,
      def(default(:table_options)) do
        {:ok, nil}
      end,
      def(default(:stream_spec)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end