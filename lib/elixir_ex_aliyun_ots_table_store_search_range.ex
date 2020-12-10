# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.Range) do
  @moduledoc false
  (
    defstruct(from: nil, to: nil)

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
          [] |> encode_from(msg) |> encode_to(msg)
        end
      )

      []

      [
        defp(encode_from(acc, msg)) do
          field_value = msg.from()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\t", Protox.Encode.encode_double(field_value)]
          end
        end,
        defp(encode_to(acc, msg)) do
          field_value = msg.to()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<17>>, Protox.Encode.encode_double(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.Range))
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
                {value, rest} = Protox.Decode.parse_double(bytes)
                field = {:from, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_double(bytes)
                field = {:to, value}
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
      %{1 => {:from, {:default, 0.0}, :double}, 2 => {:to, {:default, 0.0}, :double}}
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{from: {1, {:default, 0.0}, :double}, to: {2, {:default, 0.0}, :double}}
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
      def(default(:from)) do
        {:ok, 0.0}
      end,
      def(default(:to)) do
        {:ok, 0.0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end