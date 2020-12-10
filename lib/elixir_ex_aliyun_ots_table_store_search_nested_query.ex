# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.NestedQuery) do
  @moduledoc false
  (
    defstruct(path: nil, query: nil, score_mode: nil)

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
          [] |> encode_path(msg) |> encode_query(msg) |> encode_score_mode(msg)
        end
      )

      []

      [
        defp(encode_path(acc, msg)) do
          field_value = msg.path()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(field_value)]
          end
        end,
        defp(encode_query(acc, msg)) do
          field_value = msg.query()

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<18>>, Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_score_mode(acc, msg)) do
          field_value = msg.score_mode()

          case(field_value) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<24>>,
                field_value
                |> ExAliyunOts.TableStoreSearch.ScoreMode.encode()
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.NestedQuery))
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
                field = {:path, value}
                {[field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                field = {:query, Protox.Message.merge(msg.query(), value)}
                {[field], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.ScoreMode)

                field = {:score_mode, value}
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
        1 => {:path, {:default, ""}, :string},
        2 => {:query, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        3 =>
          {:score_mode, {:default, :SCORE_MODE_NONE},
           {:enum, ExAliyunOts.TableStoreSearch.ScoreMode}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        path: {1, {:default, ""}, :string},
        query: {2, {:default, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        score_mode:
          {3, {:default, :SCORE_MODE_NONE}, {:enum, ExAliyunOts.TableStoreSearch.ScoreMode}}
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
      def(default(:path)) do
        {:ok, ""}
      end,
      def(default(:query)) do
        {:ok, nil}
      end,
      def(default(:score_mode)) do
        {:ok, :SCORE_MODE_NONE}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end