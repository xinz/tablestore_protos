# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TableOptions) do
  @moduledoc false
  (
    defstruct(time_to_live: nil, max_versions: nil, deviation_cell_version_in_sec: nil)

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
          |> encode_time_to_live(msg)
          |> encode_max_versions(msg)
          |> encode_deviation_cell_version_in_sec(msg)
        end
      )

      []

      [
        defp(encode_time_to_live(acc, msg)) do
          field_value = msg.time_to_live()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\b", Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_max_versions(acc, msg)) do
          field_value = msg.max_versions()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
          end
        end,
        defp(encode_deviation_cell_version_in_sec(acc, msg)) do
          field_value = msg.deviation_cell_version_in_sec()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int64(field_value)]
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStore.TableOptions))
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:time_to_live, value}
                {[field], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                field = {:max_versions, value}
                {[field], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:deviation_cell_version_in_sec, value}
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
        1 => {:time_to_live, {:default, 0}, :int32},
        2 => {:max_versions, {:default, 0}, :int32},
        5 => {:deviation_cell_version_in_sec, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        deviation_cell_version_in_sec: {5, {:default, 0}, :int64},
        max_versions: {2, {:default, 0}, :int32},
        time_to_live: {1, {:default, 0}, :int32}
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
      def(default(:time_to_live)) do
        {:ok, 0}
      end,
      def(default(:max_versions)) do
        {:ok, 0}
      end,
      def(default(:deviation_cell_version_in_sec)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end