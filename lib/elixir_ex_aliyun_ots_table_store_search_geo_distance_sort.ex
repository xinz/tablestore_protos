# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.GeoDistanceSort) do
  @moduledoc false
  (
    defstruct(
      field_name: nil,
      points: [],
      order: nil,
      mode: nil,
      distance_type: nil,
      nested_filter: nil
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
          |> encode_field_name(msg)
          |> encode_points(msg)
          |> encode_order(msg)
          |> encode_mode(msg)
          |> encode_distance_type(msg)
          |> encode_nested_filter(msg)
        end
      )

      []

      [
        defp(encode_field_name(acc, msg)) do
          try do
            case(msg.field_name) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.field_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:field_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_points(acc, msg)) do
          try do
            case(msg.points) do
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
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:points, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_order(acc, msg)) do
          try do
            case(msg.order) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  <<24>>,
                  msg.order
                  |> ExAliyunOts.TableStoreSearch.SortOrder.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:order, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_mode(acc, msg)) do
          try do
            case(msg.mode) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  " ",
                  msg.mode
                  |> ExAliyunOts.TableStoreSearch.SortMode.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:mode, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_distance_type(acc, msg)) do
          try do
            case(msg.distance_type) do
              nil ->
                acc

              _ ->
                [
                  acc,
                  "(",
                  msg.distance_type
                  |> ExAliyunOts.TableStoreSearch.GeoDistanceType.encode()
                  |> Protox.Encode.encode_enum()
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:distance_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_nested_filter(acc, msg)) do
          try do
            case(msg.nested_filter) do
              nil ->
                acc

              _ ->
                [acc, "2", Protox.Encode.encode_message(msg.nested_filter)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:nested_filter, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GeoDistanceSort))
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
                {[field_name: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[points: msg.points ++ [delimited]], rest}

              {3, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SortOrder)

                {[order: value], rest}

              {4, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.SortMode)

                {[mode: value], rest}

              {5, _, bytes} ->
                {value, rest} =
                  Protox.Decode.parse_enum(bytes, ExAliyunOts.TableStoreSearch.GeoDistanceType)

                {[distance_type: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   nested_filter:
                     Protox.Message.merge(
                       msg.nested_filter,
                       ExAliyunOts.TableStoreSearch.NestedFilter.decode!(delimited)
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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
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

      @spec json_decode!(iodata(), keyword()) :: iodata() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStoreSearch.GeoDistanceSort,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:field_name, {:scalar, ""}, :string},
        2 => {:points, :unpacked, :string},
        3 =>
          {:order, {:scalar, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}},
        4 => {:mode, {:scalar, :SORT_MODE_MIN}, {:enum, ExAliyunOts.TableStoreSearch.SortMode}},
        5 =>
          {:distance_type, {:scalar, :GEO_DISTANCE_ARC},
           {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}},
        6 =>
          {:nested_filter, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.NestedFilter}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        distance_type:
          {5, {:scalar, :GEO_DISTANCE_ARC}, {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}},
        field_name: {1, {:scalar, ""}, :string},
        mode: {4, {:scalar, :SORT_MODE_MIN}, {:enum, ExAliyunOts.TableStoreSearch.SortMode}},
        nested_filter: {6, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.NestedFilter}},
        order: {3, {:scalar, :SORT_ORDER_ASC}, {:enum, ExAliyunOts.TableStoreSearch.SortOrder}},
        points: {2, :unpacked, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fieldName",
          kind: {:scalar, ""},
          label: :optional,
          name: :field_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "points",
          kind: :unpacked,
          label: :repeated,
          name: :points,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "order",
          kind: {:scalar, :SORT_ORDER_ASC},
          label: :optional,
          name: :order,
          tag: 3,
          type: {:enum, ExAliyunOts.TableStoreSearch.SortOrder}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mode",
          kind: {:scalar, :SORT_MODE_MIN},
          label: :optional,
          name: :mode,
          tag: 4,
          type: {:enum, ExAliyunOts.TableStoreSearch.SortMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "distanceType",
          kind: {:scalar, :GEO_DISTANCE_ARC},
          label: :optional,
          name: :distance_type,
          tag: 5,
          type: {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nestedFilter",
          kind: {:scalar, nil},
          label: :optional,
          name: :nested_filter,
          tag: 6,
          type: {:message, ExAliyunOts.TableStoreSearch.NestedFilter}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:field_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("fieldName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("field_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldName",
             kind: {:scalar, ""},
             label: :optional,
             name: :field_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:points)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: :unpacked,
             label: :repeated,
             name: :points,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("points")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: :unpacked,
             label: :repeated,
             name: :points,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:order)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "order",
             kind: {:scalar, :SORT_ORDER_ASC},
             label: :optional,
             name: :order,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreSearch.SortOrder}
           }}
        end

        def(field_def("order")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "order",
             kind: {:scalar, :SORT_ORDER_ASC},
             label: :optional,
             name: :order,
             tag: 3,
             type: {:enum, ExAliyunOts.TableStoreSearch.SortOrder}
           }}
        end

        []
      ),
      (
        def(field_def(:mode)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, :SORT_MODE_MIN},
             label: :optional,
             name: :mode,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreSearch.SortMode}
           }}
        end

        def(field_def("mode")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, :SORT_MODE_MIN},
             label: :optional,
             name: :mode,
             tag: 4,
             type: {:enum, ExAliyunOts.TableStoreSearch.SortMode}
           }}
        end

        []
      ),
      (
        def(field_def(:distance_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distanceType",
             kind: {:scalar, :GEO_DISTANCE_ARC},
             label: :optional,
             name: :distance_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}
           }}
        end

        def(field_def("distanceType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distanceType",
             kind: {:scalar, :GEO_DISTANCE_ARC},
             label: :optional,
             name: :distance_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}
           }}
        end

        def(field_def("distance_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "distanceType",
             kind: {:scalar, :GEO_DISTANCE_ARC},
             label: :optional,
             name: :distance_type,
             tag: 5,
             type: {:enum, ExAliyunOts.TableStoreSearch.GeoDistanceType}
           }}
        end
      ),
      (
        def(field_def(:nested_filter)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nestedFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :nested_filter,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.NestedFilter}
           }}
        end

        def(field_def("nestedFilter")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nestedFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :nested_filter,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.NestedFilter}
           }}
        end

        def(field_def("nested_filter")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nestedFilter",
             kind: {:scalar, nil},
             label: :optional,
             name: :nested_filter,
             tag: 6,
             type: {:message, ExAliyunOts.TableStoreSearch.NestedFilter}
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

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
      def(default(:points)) do
        {:error, :no_default_value}
      end,
      def(default(:order)) do
        {:ok, :SORT_ORDER_ASC}
      end,
      def(default(:mode)) do
        {:ok, :SORT_MODE_MIN}
      end,
      def(default(:distance_type)) do
        {:ok, :GEO_DISTANCE_ARC}
      end,
      def(default(:nested_filter)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end