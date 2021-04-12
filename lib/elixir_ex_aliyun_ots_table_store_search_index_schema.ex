# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.IndexSchema) do
  @moduledoc false
  (
    defstruct(field_schemas: [], index_setting: nil, index_sort: nil)

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
          [] |> encode_field_schemas(msg) |> encode_index_setting(msg) |> encode_index_sort(msg)
        end
      )

      []

      [
        defp(encode_field_schemas(acc, msg)) do
          case(msg.field_schemas) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_index_setting(acc, msg)) do
          field_value = msg.index_setting

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_index_sort(acc, msg)) do
          field_value = msg.index_sort

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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.IndexSchema))
        end
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.FieldSchema.decode!(delimited)
                field = {:field_schemas, msg.field_schemas ++ List.wrap(value)}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.IndexSetting.decode!(delimited)
                field = {:index_setting, Protox.Message.merge(msg.index_setting, value)}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Sort.decode!(delimited)
                field = {:index_sort, Protox.Message.merge(msg.index_sort, value)}
                {[field], rest}

              {tag, wire_type, rest} ->
                {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
                {[], rest}
            end

          msg_updated = struct(msg, field)
          parse_key_value(rest, msg_updated)
        end
      )

      []
    )

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:field_schemas, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        2 =>
          {:index_setting, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSetting}},
        3 => {:index_sort, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        field_schemas: {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.FieldSchema}},
        index_setting:
          {2, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.IndexSetting}},
        index_sort: {3, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Sort}}
      }
    end

    []
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:field_schemas)) do
        {:error, :no_default_value}
      end,
      def(default(:index_setting)) do
        {:ok, nil}
      end,
      def(default(:index_sort)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end