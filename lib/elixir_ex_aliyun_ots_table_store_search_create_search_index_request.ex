# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.CreateSearchIndexRequest) do
  @moduledoc false
  (
    defstruct(table_name: nil, index_name: nil, schema: nil)

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
          [] |> encode_table_name(msg) |> encode_index_name(msg) |> encode_schema(msg)
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
        defp(encode_index_name(acc, msg)) do
          case(msg.index_name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:index_name]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_schema(acc, msg)) do
          field_value = msg.schema()

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
            parse_key_value(
              [],
              bytes,
              struct(ExAliyunOts.TableStoreSearch.CreateSearchIndexRequest)
            )

          case([:table_name, :index_name] -- set_fields) do
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
                value = delimited
                field = {:index_name, value}
                {[:index_name | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.IndexSchema.decode!(delimited)
                field = {:schema, Protox.Message.merge(msg.schema(), value)}
                {[:schema | set_fields], [field], rest}

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
        2 => {:index_name, {:default, ""}, :string},
        3 => {:schema, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        index_name: {2, {:default, ""}, :string},
        schema: {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSchema}},
        table_name: {1, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:table_name | :index_name]
    def(required_fields()) do
      [:table_name, :index_name]
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
      def(default(:index_name)) do
        {:ok, ""}
      end,
      def(default(:schema)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end