# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.GroupBySorter do
  @moduledoc false
  defstruct group_key_sort: nil, row_count_sort: nil, sub_agg_sort: nil

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        [] |> encode_group_key_sort(msg) |> encode_row_count_sort(msg) |> encode_sub_agg_sort(msg)
      end
    )

    []

    [
      defp encode_group_key_sort(acc, msg) do
        try do
          case msg.group_key_sort do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_message(msg.group_key_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:group_key_sort, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_row_count_sort(acc, msg) do
        try do
          case msg.row_count_sort do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.row_count_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:row_count_sort, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_sub_agg_sort(acc, msg) do
        try do
          case msg.sub_agg_sort do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.sub_agg_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sub_agg_sort, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupBySorter))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 group_key_sort:
                   Protox.MergeMessage.merge(
                     msg.group_key_sort,
                     ExAliyunOts.TableStoreSearch.GroupKeySort.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 row_count_sort:
                   Protox.MergeMessage.merge(
                     msg.row_count_sort,
                     ExAliyunOts.TableStoreSearch.RowCountSort.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 sub_agg_sort:
                   Protox.MergeMessage.merge(
                     msg.sub_agg_sort,
                     ExAliyunOts.TableStoreSearch.SubAggSort.decode!(delimited)
                   )
               ], rest}

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
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStoreSearch.GroupBySorter,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 =>
          {:group_key_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}},
        2 =>
          {:row_count_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.RowCountSort}},
        3 => {:sub_agg_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SubAggSort}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        group_key_sort:
          {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}},
        row_count_sort:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.RowCountSort}},
        sub_agg_sort: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.SubAggSort}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "groupKeySort",
          kind: {:scalar, nil},
          label: :optional,
          name: :group_key_sort,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rowCountSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :row_count_sort,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.RowCountSort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "subAggSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :sub_agg_sort,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.SubAggSort}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:group_key_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupKeySort",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_key_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}
           }}
        end

        def field_def("groupKeySort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupKeySort",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_key_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}
           }}
        end

        def field_def("group_key_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupKeySort",
             kind: {:scalar, nil},
             label: :optional,
             name: :group_key_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupKeySort}
           }}
        end
      ),
      (
        def field_def(:row_count_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCountSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :row_count_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.RowCountSort}
           }}
        end

        def field_def("rowCountSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCountSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :row_count_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.RowCountSort}
           }}
        end

        def field_def("row_count_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rowCountSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :row_count_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.RowCountSort}
           }}
        end
      ),
      (
        def field_def(:sub_agg_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_agg_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.SubAggSort}
           }}
        end

        def field_def("subAggSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_agg_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.SubAggSort}
           }}
        end

        def field_def("sub_agg_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "subAggSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :sub_agg_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.SubAggSort}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:group_key_sort) do
      {:ok, nil}
    end,
    def default(:row_count_sort) do
      {:ok, nil}
    end,
    def default(:sub_agg_sort) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
