# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GroupByResult) do
  @moduledoc false
  defstruct(name: nil, type: nil, group_by_result: nil)

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
        [] |> encode_name(msg) |> encode_type(msg) |> encode_group_by_result(msg)
      end
    )

    []

    [
      defp(encode_name(acc, msg)) do
        try do
          case(msg.name) do
            nil ->
              acc

            _ ->
              [acc, "\n", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_type(acc, msg)) do
        try do
          case(msg.type) do
            nil ->
              acc

            _ ->
              [
                acc,
                <<16>>,
                msg.type
                |> ExAliyunOts.TableStoreSearch.GroupByType.encode()
                |> Protox.Encode.encode_enum()
              ]
          end
        rescue
          ArgumentError ->
            reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
        end
      end,
      defp(encode_group_by_result(acc, msg)) do
        try do
          case(msg.group_by_result) do
            nil ->
              acc

            _ ->
              [acc, <<26>>, Protox.Encode.encode_bytes(msg.group_by_result)]
          end
        rescue
          ArgumentError ->
            reraise(
              Protox.EncodingError.new(:group_by_result, "invalid field value"),
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByResult))
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
              {[name: delimited], rest}

            {2, _, bytes} ->
              {value, rest} =
                Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.GroupByType)

              {[type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[group_by_result: delimited], rest}

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
        ExAliyunOts.TableStoreSearch.GroupByResult,
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
        1 => {:name, {:scalar, ""}, :string},
        2 =>
          {:type, {:scalar, :GROUP_BY_FIELD}, {:enum, ExAliyunOts.TableStoreSearch.GroupByType}},
        3 => {:group_by_result, {:scalar, ""}, :bytes}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        group_by_result: {3, {:scalar, ""}, :bytes},
        name: {1, {:scalar, ""}, :string},
        type: {2, {:scalar, :GROUP_BY_FIELD}, {:enum, ExAliyunOts.TableStoreSearch.GroupByType}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, :GROUP_BY_FIELD},
          label: :optional,
          name: :type,
          tag: 2,
          type: {:enum, ExAliyunOts.TableStoreSearch.GroupByType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "groupByResult",
          kind: {:scalar, ""},
          label: :optional,
          name: :group_by_result,
          tag: 3,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :GROUP_BY_FIELD},
             label: :optional,
             name: :type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreSearch.GroupByType}
           }}
        end

        def(field_def("type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, :GROUP_BY_FIELD},
             label: :optional,
             name: :type,
             tag: 2,
             type: {:enum, ExAliyunOts.TableStoreSearch.GroupByType}
           }}
        end

        []
      ),
      (
        def(field_def(:group_by_result)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByResult",
             kind: {:scalar, ""},
             label: :optional,
             name: :group_by_result,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("groupByResult")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByResult",
             kind: {:scalar, ""},
             label: :optional,
             name: :group_by_result,
             tag: 3,
             type: :bytes
           }}
        end

        def(field_def("group_by_result")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByResult",
             kind: {:scalar, ""},
             label: :optional,
             name: :group_by_result,
             tag: 3,
             type: :bytes
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
    def(default(:name)) do
      {:ok, ""}
    end,
    def(default(:type)) do
      {:ok, :GROUP_BY_FIELD}
    end,
    def(default(:group_by_result)) do
      {:ok, ""}
    end,
    def(default(_)) do
      {:error, :no_such_field}
    end
  ]
end