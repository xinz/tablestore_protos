# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GeoBoundingBoxQuery) do
  @moduledoc false
  (
    defstruct(field_name: nil, top_left: nil, bottom_right: nil)

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
          [] |> encode_field_name(msg) |> encode_top_left(msg) |> encode_bottom_right(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          field_value = msg.field_name()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_top_left(acc, msg)) do
          field_value = msg.top_left()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_bottom_right(acc, msg)) do
          field_value = msg.bottom_right()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_string(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GeoBoundingBoxQuery))
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
                value = delimited
                field = {:field_name, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:top_left, value}
                {[field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:bottom_right, value}
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
        1 => {:field_name, {:default, ""}, :string},
        2 => {:top_left, {:default, ""}, :string},
        3 => {:bottom_right, {:default, ""}, :string}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        bottom_right: {3, {:default, ""}, :string},
        field_name: {1, {:default, ""}, :string},
        top_left: {2, {:default, ""}, :string}
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
      def(default(:field_name)) do
        {:ok, ""}
      end,
      def(default(:top_left)) do
        {:ok, ""}
      end,
      def(default(:bottom_right)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end