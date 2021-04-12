# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.CreateIndexRequest) do
  @moduledoc false
  (
    defstruct(main_table_name: nil, index_meta: nil, include_base_data: nil)

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
          |> encode_main_table_name(msg)
          |> encode_index_meta(msg)
          |> encode_include_base_data(msg)
        end
      )

      []

      [
        defp(encode_main_table_name(acc, msg)) do
          case(msg.main_table_name) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:main_table_name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_index_meta(acc, msg)) do
          case(msg.index_meta) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:index_meta]))

            field_value ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_include_base_data(acc, msg)) do
          field_value = msg.include_base_data

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_bool(field_value)]
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
            parse_key_value([], bytes, struct(ExAliyunOts.TableStore.CreateIndexRequest))

          case([:main_table_name, :index_meta] -- set_fields) do
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
                field = {:main_table_name, value}
                {[:main_table_name | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.IndexMeta.decode!(delimited)
                field = {:index_meta, Protox.Message.merge(msg.index_meta, value)}
                {[:index_meta | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                field = {:include_base_data, value}
                {[:include_base_data | set_fields], [field], rest}

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
        1 => {:main_table_name, {:default, ""}, :string},
        2 => {:index_meta, {:default, nil}, {:message, ExAliyunOts.TableStore.IndexMeta}},
        3 => {:include_base_data, {:default, false}, :bool}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        include_base_data: {3, {:default, false}, :bool},
        index_meta: {2, {:default, nil}, {:message, ExAliyunOts.TableStore.IndexMeta}},
        main_table_name: {1, {:default, ""}, :string}
      }
    end

    []
    @spec required_fields() :: [:main_table_name | :index_meta]
    def(required_fields()) do
      [:main_table_name, :index_meta]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:main_table_name)) do
        {:ok, ""}
      end,
      def(default(:index_meta)) do
        {:ok, nil}
      end,
      def(default(:include_base_data)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end