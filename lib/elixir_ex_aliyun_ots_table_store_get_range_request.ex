# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetRangeRequest) do
  @moduledoc false
  (
    defstruct(
      table_name: nil,
      direction: nil,
      columns_to_get: [],
      time_range: nil,
      max_versions: nil,
      limit: nil,
      inclusive_start_primary_key: nil,
      exclusive_end_primary_key: nil,
      filter: nil,
      start_column: nil,
      end_column: nil,
      token: nil,
      transaction_id: nil
    )

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
          |> encode_direction(msg)
          |> encode_columns_to_get(msg)
          |> encode_time_range(msg)
          |> encode_max_versions(msg)
          |> encode_limit(msg)
          |> encode_inclusive_start_primary_key(msg)
          |> encode_exclusive_end_primary_key(msg)
          |> encode_filter(msg)
          |> encode_start_column(msg)
          |> encode_end_column(msg)
          |> encode_token(msg)
          |> encode_transaction_id(msg)
        end
      )

      []

      [
        defp(encode_table_name(acc, msg)) do
          case(msg.table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:table_name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_direction(acc, msg)) do
          case(msg.direction) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:direction]))

            field_value ->
              [
                acc,
                <<16>>,
                field_value
                |> ExAliyunOts.TableStore.Direction.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_columns_to_get(acc, msg)) do
          case(msg.columns_to_get) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<26>>, Protox.Encode.encode_string(value)]
                end)
              ]
          end
        end,
        defp(encode_time_range(acc, msg)) do
          field_value = msg.time_range

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_max_versions(acc, msg)) do
          field_value = msg.max_versions

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_limit(acc, msg)) do
          field_value = msg.limit

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "0", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_inclusive_start_primary_key(acc, msg)) do
          case(msg.inclusive_start_primary_key) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:inclusive_start_primary_key]))

            field_value ->
              [acc, ":", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_exclusive_end_primary_key(acc, msg)) do
          case(msg.exclusive_end_primary_key) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:exclusive_end_primary_key]))

            field_value ->
              [acc, "B", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_filter(acc, msg)) do
          field_value = msg.filter

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "R", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_start_column(acc, msg)) do
          field_value = msg.start_column

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "Z", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_end_column(acc, msg)) do
          field_value = msg.end_column

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "b", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_token(acc, msg)) do
          field_value = msg.token

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "j", Protox.Encode.encode_bytes(field_value)]
          end
        end,
        defp(encode_transaction_id(acc, msg)) do
          field_value = msg.transaction_id

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "r", Protox.Encode.encode_string(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.GetRangeRequest))

          case(
            [:table_name, :direction, :inclusive_start_primary_key, :exclusive_end_primary_key] --
              set_fields
          ) do
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
                {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.Direction)
                field = {:direction, value}
                {[:direction | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:columns_to_get, msg.columns_to_get ++ List.wrap(value)}
                {[:columns_to_get | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.TimeRange.decode!(delimited)
                field = {:time_range, Protox.Message.merge(msg.time_range, value)}
                {[:time_range | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:max_versions, value}
                {[:max_versions | set_fields], [field], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:limit, value}
                {[:limit | set_fields], [field], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:inclusive_start_primary_key, value}
                {[:inclusive_start_primary_key | set_fields], [field], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:exclusive_end_primary_key, value}
                {[:exclusive_end_primary_key | set_fields], [field], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:filter, value}
                {[:filter | set_fields], [field], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:start_column, value}
                {[:start_column | set_fields], [field], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:end_column, value}
                {[:end_column | set_fields], [field], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:token, value}
                {[:token | set_fields], [field], rest}

              {14, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:transaction_id, value}
                {[:transaction_id | set_fields], [field], rest}

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
        2 => {:direction, {:default, :FORWARD}, {:enum, ExAliyunOts.TableStore.Direction}},
        3 => {:columns_to_get, :unpacked, :string},
        4 => {:time_range, {:default, nil}, {:message, ExAliyunOts.TableStore.TimeRange}},
        5 => {:max_versions, {:default, 0}, :int32},
        6 => {:limit, {:default, 0}, :int32},
        7 => {:inclusive_start_primary_key, {:default, ""}, :bytes},
        8 => {:exclusive_end_primary_key, {:default, ""}, :bytes},
        10 => {:filter, {:default, ""}, :bytes},
        11 => {:start_column, {:default, ""}, :string},
        12 => {:end_column, {:default, ""}, :string},
        13 => {:token, {:default, ""}, :bytes},
        14 => {:transaction_id, {:default, ""}, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        columns_to_get: {3, :unpacked, :string},
        direction: {2, {:default, :FORWARD}, {:enum, ExAliyunOts.TableStore.Direction}},
        end_column: {12, {:default, ""}, :string},
        exclusive_end_primary_key: {8, {:default, ""}, :bytes},
        filter: {10, {:default, ""}, :bytes},
        inclusive_start_primary_key: {7, {:default, ""}, :bytes},
        limit: {6, {:default, 0}, :int32},
        max_versions: {5, {:default, 0}, :int32},
        start_column: {11, {:default, ""}, :string},
        table_name: {1, {:default, ""}, :string},
        time_range: {4, {:default, nil}, {:message, ExAliyunOts.TableStore.TimeRange}},
        token: {13, {:default, ""}, :bytes},
        transaction_id: {14, {:default, ""}, :string}
      }
    end

    []

    @spec required_fields() :: [
            ((:table_name | :direction) | :inclusive_start_primary_key)
            | :exclusive_end_primary_key
          ]
    def(required_fields()) do
      [:table_name, :direction, :inclusive_start_primary_key, :exclusive_end_primary_key]
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
      def(default(:direction)) do
        {:ok, :FORWARD}
      end,
      def(default(:columns_to_get)) do
        {:error, :no_default_value}
      end,
      def(default(:time_range)) do
        {:ok, nil}
      end,
      def(default(:max_versions)) do
        {:ok, 0}
      end,
      def(default(:limit)) do
        {:ok, 0}
      end,
      def(default(:inclusive_start_primary_key)) do
        {:ok, ""}
      end,
      def(default(:exclusive_end_primary_key)) do
        {:ok, ""}
      end,
      def(default(:filter)) do
        {:ok, ""}
      end,
      def(default(:start_column)) do
        {:ok, ""}
      end,
      def(default(:end_column)) do
        {:ok, ""}
      end,
      def(default(:token)) do
        {:ok, ""}
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