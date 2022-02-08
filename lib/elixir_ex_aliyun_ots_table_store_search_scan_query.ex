# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.ScanQuery) do
  @moduledoc false
  defstruct(
    query: nil,
    limit: nil,
    alive_time: nil,
    token: nil,
    current_parallel_id: nil,
    max_parallel: nil
  )

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def(encode(msg)) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def(encode!(msg)) do
        []
        |> encode_query(msg)
        |> encode_limit(msg)
        |> encode_alive_time(msg)
        |> encode_token(msg)
        |> encode_current_parallel_id(msg)
        |> encode_max_parallel(msg)
      end
    )

    []

    [
      defp(encode_query(acc, msg)) do
        try do
          case(msg.query) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_message(msg.query)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:query, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_limit(acc, msg)) do
        try do
          case(msg.limit) do
            nil ->
              acc

            _ ->
              [acc, <<16>>, Protox.Encode.encode_int32(msg.limit)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:limit, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_alive_time(acc, msg)) do
        try do
          case(msg.alive_time) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int32(msg.alive_time)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:alive_time, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_token(acc, msg)) do
        try do
          case(msg.token) do
            nil ->
              acc

            _ ->
              [acc, "\"", Protox.Encode.encode_bytes(msg.token)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_current_parallel_id(acc, msg)) do
        try do
          case(msg.current_parallel_id) do
            nil ->
              acc

            _ ->
              [acc, "(", Protox.Encode.encode_int32(msg.current_parallel_id)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:current_parallel_id, "invalid field value"),
              __STACKTRACE__
            )
        end
      end,
      defp(encode_max_parallel(acc, msg)) do
        try do
          case(msg.max_parallel) do
            nil ->
              acc

            _ ->
              [acc, "0", Protox.Encode.encode_int32(msg.max_parallel)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:max_parallel, "invalid field value"),
              __STACKTRACE__
            )
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def(decode!(bytes)) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.ScanQuery))
        end
      )
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
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 query:
                   Protox.MergeMessage.merge(
                     msg.query,
                     ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[limit: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[alive_time: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[token: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[current_parallel_id: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[max_parallel: value], rest}

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

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def(json_decode(input, opts \\ [])) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError ->
          {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def(json_decode!(input, opts \\ [])) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStoreSearch.ScanQuery,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def(json_encode(msg, opts \\ [])) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError ->
          {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def(json_encode!(msg, opts \\ [])) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:query, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        2 => {:limit, {:scalar, 0}, :int32},
        3 => {:alive_time, {:scalar, 0}, :int32},
        4 => {:token, {:scalar, ""}, :bytes},
        5 => {:current_parallel_id, {:scalar, 0}, :int32},
        6 => {:max_parallel, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        alive_time: {3, {:scalar, 0}, :int32},
        current_parallel_id: {5, {:scalar, 0}, :int32},
        limit: {2, {:scalar, 0}, :int32},
        max_parallel: {6, {:scalar, 0}, :int32},
        query: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        token: {4, {:scalar, ""}, :bytes}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "query",
          kind: {:scalar, nil},
          label: :optional,
          name: :query,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        },
        %{
          __struct__: Protox.Field,
          json_name: "limit",
          kind: {:scalar, 0},
          label: :optional,
          name: :limit,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aliveTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :alive_time,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: {:scalar, ""},
          label: :optional,
          name: :token,
          tag: 4,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "currentParallelId",
          kind: {:scalar, 0},
          label: :optional,
          name: :current_parallel_id,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxParallel",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_parallel,
          tag: 6,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:query)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("query")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "query",
             kind: {:scalar, nil},
             label: :optional,
             name: :query,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        []
      ),
      (
        def(field_def(:limit)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limit",
             kind: {:scalar, 0},
             label: :optional,
             name: :limit,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("limit")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "limit",
             kind: {:scalar, 0},
             label: :optional,
             name: :limit,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:alive_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliveTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :alive_time,
             tag: 3,
             type: :int32
           }}
        end

        def(field_def("aliveTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliveTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :alive_time,
             tag: 3,
             type: :int32
           }}
        end

        def(field_def("alive_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aliveTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :alive_time,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 4,
             type: :bytes
           }}
        end

        def(field_def("token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 4,
             type: :bytes
           }}
        end

        []
      ),
      (
        def(field_def(:current_parallel_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentParallelId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_parallel_id,
             tag: 5,
             type: :int32
           }}
        end

        def(field_def("currentParallelId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentParallelId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_parallel_id,
             tag: 5,
             type: :int32
           }}
        end

        def(field_def("current_parallel_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentParallelId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_parallel_id,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:max_parallel)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxParallel",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_parallel,
             tag: 6,
             type: :int32
           }}
        end

        def(field_def("maxParallel")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxParallel",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_parallel,
             tag: 6,
             type: :int32
           }}
        end

        def(field_def("max_parallel")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxParallel",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_parallel,
             tag: 6,
             type: :int32
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def(syntax()) do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def(default(:query)) do
      {:ok, nil}
    end,
    def(default(:limit)) do
      {:ok, 0}
    end,
    def(default(:alive_time)) do
      {:ok, 0}
    end,
    def(default(:token)) do
      {:ok, ""}
    end,
    def(default(:current_parallel_id)) do
      {:ok, 0}
    end,
    def(default(:max_parallel)) do
      {:ok, 0}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end