# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.Sorter do
  @moduledoc false
  defstruct field_sort: nil, geo_distance_sort: nil, score_sort: nil, pk_sort: nil

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
        []
        |> encode_field_sort(msg)
        |> encode_geo_distance_sort(msg)
        |> encode_score_sort(msg)
        |> encode_pk_sort(msg)
      end
    )

    []

    [
      defp encode_field_sort(acc, msg) do
        try do
          case msg.field_sort do
            nil -> acc
            _ -> [acc, "\n", Protox.Encode.encode_message(msg.field_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_sort, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_geo_distance_sort(acc, msg) do
        try do
          case msg.geo_distance_sort do
            nil -> acc
            _ -> [acc, "\x12", Protox.Encode.encode_message(msg.geo_distance_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:geo_distance_sort, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_score_sort(acc, msg) do
        try do
          case msg.score_sort do
            nil -> acc
            _ -> [acc, "\x1A", Protox.Encode.encode_message(msg.score_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:score_sort, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pk_sort(acc, msg) do
        try do
          case msg.pk_sort do
            nil -> acc
            _ -> [acc, "\"", Protox.Encode.encode_message(msg.pk_sort)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pk_sort, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.Sorter))
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
                 field_sort:
                   Protox.MergeMessage.merge(
                     msg.field_sort,
                     ExAliyunOts.TableStoreSearch.FieldSort.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 geo_distance_sort:
                   Protox.MergeMessage.merge(
                     msg.geo_distance_sort,
                     ExAliyunOts.TableStoreSearch.GeoDistanceSort.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 score_sort:
                   Protox.MergeMessage.merge(
                     msg.score_sort,
                     ExAliyunOts.TableStoreSearch.ScoreSort.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 pk_sort:
                   Protox.MergeMessage.merge(
                     msg.pk_sort,
                     ExAliyunOts.TableStoreSearch.PrimaryKeySort.decode!(delimited)
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
        ExAliyunOts.TableStoreSearch.Sorter,
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
        1 => {:field_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldSort}},
        2 =>
          {:geo_distance_sort, {:scalar, nil},
           {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}},
        3 => {:score_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.ScoreSort}},
        4 => {:pk_sort, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        field_sort: {1, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.FieldSort}},
        geo_distance_sort:
          {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}},
        pk_sort: {4, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}},
        score_sort: {3, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.ScoreSort}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fieldSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :field_sort,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.FieldSort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "geoDistanceSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :geo_distance_sort,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "scoreSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :score_sort,
          tag: 3,
          type: {:message, ExAliyunOts.TableStoreSearch.ScoreSort}
        },
        %{
          __struct__: Protox.Field,
          json_name: "pkSort",
          kind: {:scalar, nil},
          label: :optional,
          name: :pk_sort,
          tag: 4,
          type: {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:field_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSort}
           }}
        end

        def field_def("fieldSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSort}
           }}
        end

        def field_def("field_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :field_sort,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.FieldSort}
           }}
        end
      ),
      (
        def field_def(:geo_distance_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "geoDistanceSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :geo_distance_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}
           }}
        end

        def field_def("geoDistanceSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "geoDistanceSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :geo_distance_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}
           }}
        end

        def field_def("geo_distance_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "geoDistanceSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :geo_distance_sort,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.GeoDistanceSort}
           }}
        end
      ),
      (
        def field_def(:score_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :score_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ScoreSort}
           }}
        end

        def field_def("scoreSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :score_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ScoreSort}
           }}
        end

        def field_def("score_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :score_sort,
             tag: 3,
             type: {:message, ExAliyunOts.TableStoreSearch.ScoreSort}
           }}
        end
      ),
      (
        def field_def(:pk_sort) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :pk_sort,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}
           }}
        end

        def field_def("pkSort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :pk_sort,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}
           }}
        end

        def field_def("pk_sort") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pkSort",
             kind: {:scalar, nil},
             label: :optional,
             name: :pk_sort,
             tag: 4,
             type: {:message, ExAliyunOts.TableStoreSearch.PrimaryKeySort}
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
    def default(:field_sort) do
      {:ok, nil}
    end,
    def default(:geo_distance_sort) do
      {:ok, nil}
    end,
    def default(:score_sort) do
      {:ok, nil}
    end,
    def default(:pk_sort) do
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
