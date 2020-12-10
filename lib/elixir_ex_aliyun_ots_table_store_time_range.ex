# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TimeRange) do
  @moduledoc false
  (
    defstruct(start_time: nil, end_time: nil, specific_time: nil)

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
          [] |> encode_start_time(msg) |> encode_end_time(msg) |> encode_specific_time(msg)
        end
      )

      []

      [
        defp(encode_start_time(acc, msg)) do
          field_value = msg.start_time()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_end_time(acc, msg)) do
          field_value = msg.end_time()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int64(field_value)]
          end
        end,
        defp(encode_specific_time(acc, msg)) do
          field_value = msg.specific_time()

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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.TimeRange))
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
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:start_time, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:end_time, value}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:specific_time, value}
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
        1 => {:start_time, {:default, 0}, :int64},
        2 => {:end_time, {:default, 0}, :int64},
        3 => {:specific_time, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        end_time: {2, {:default, 0}, :int64},
        specific_time: {3, {:default, 0}, :int64},
        start_time: {1, {:default, 0}, :int64}
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
      def(default(:start_time)) do
        {:ok, 0}
      end,
      def(default(:end_time)) do
        {:ok, 0}
      end,
      def(default(:specific_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end