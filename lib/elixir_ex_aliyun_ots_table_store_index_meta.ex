# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.IndexMeta) do
  @moduledoc false
  (
    defstruct(
      name: nil,
      primary_key: [],
      defined_column: [],
      index_update_mode: nil,
      index_type: nil
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
          |> encode_name(msg)
          |> encode_primary_key(msg)
          |> encode_defined_column(msg)
          |> encode_index_update_mode(msg)
          |> encode_index_type(msg)
        end
      )

      []

      [
        defp(encode_name(acc, msg)) do
          case(msg.name()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:name]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_primary_key(acc, msg)) do
          case(msg.primary_key()) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_string(value)]
                end)
              ]
          end
        end,
        defp(encode_defined_column(acc, msg)) do
          case(msg.defined_column()) do
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
        defp(encode_index_update_mode(acc, msg)) do
          case(msg.index_update_mode()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:index_update_mode]))

            field_value ->
              [
                acc,
                " ",
                field_value
                |> ExAliyunOts.TableStore.IndexUpdateMode.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        end,
        defp(encode_index_type(acc, msg)) do
          case(msg.index_type()) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:index_type]))

            field_value ->
              [
                acc,
                "(",
                field_value
                |> ExAliyunOts.TableStore.IndexType.encode()
                |> Protox.Encode.encode_enum()
              ]
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
          {msg, set_fields} = parse_key_value([], bytes, struct(ExAliyunOts.TableStore.IndexMeta))

          case([:name, :index_update_mode, :index_type] -- set_fields) do
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
                field = {:name, value}
                {[:name | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:primary_key, msg.primary_key() ++ List.wrap(value)}
                {[:primary_key | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:defined_column, msg.defined_column() ++ List.wrap(value)}
                {[:defined_column | set_fields], [field], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.IndexUpdateMode)

                field = {:index_update_mode, value}
                {[:index_update_mode | set_fields], [field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStore.IndexType)
                field = {:index_type, value}
                {[:index_type | set_fields], [field], rest}

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
        1 => {:name, {:default, ""}, :string},
        2 => {:primary_key, :unpacked, :string},
        3 => {:defined_column, :unpacked, :string},
        4 =>
          {:index_update_mode, {:default, :IUM_ASYNC_INDEX},
           {:enum, ExAliyunOts.TableStore.IndexUpdateMode}},
        5 =>
          {:index_type, {:default, :IT_GLOBAL_INDEX}, {:enum, ExAliyunOts.TableStore.IndexType}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        defined_column: {3, :unpacked, :string},
        index_type: {5, {:default, :IT_GLOBAL_INDEX}, {:enum, ExAliyunOts.TableStore.IndexType}},
        index_update_mode:
          {4, {:default, :IUM_ASYNC_INDEX}, {:enum, ExAliyunOts.TableStore.IndexUpdateMode}},
        name: {1, {:default, ""}, :string},
        primary_key: {2, :unpacked, :string}
      }
    end

    []
    @spec required_fields() :: [(:name | :index_update_mode) | :index_type]
    def(required_fields()) do
      [:name, :index_update_mode, :index_type]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:name)) do
        {:ok, ""}
      end,
      def(default(:primary_key)) do
        {:error, :no_default_value}
      end,
      def(default(:defined_column)) do
        {:error, :no_default_value}
      end,
      def(default(:index_update_mode)) do
        {:ok, :IUM_ASYNC_INDEX}
      end,
      def(default(:index_type)) do
        {:ok, :IT_GLOBAL_INDEX}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end