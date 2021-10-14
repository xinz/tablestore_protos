# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.GetRpoResponse) do
  @moduledoc false
  (
    defstruct(rpo_infos: nil, tunnel_rpo_infos: nil)

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
          [] |> encode_rpo_infos(msg) |> encode_tunnel_rpo_infos(msg)
        end
      )

      []

      [
        defp(encode_rpo_infos(acc, msg)) do
          try do
            case(msg.rpo_infos) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_bytes(msg.rpo_infos)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:rpo_infos, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tunnel_rpo_infos(acc, msg)) do
          try do
            case(msg.tunnel_rpo_infos) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_bytes(msg.tunnel_rpo_infos)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:tunnel_rpo_infos, "invalid field value"),
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreTunnel.GetRpoResponse))
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
                {[rpo_infos: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tunnel_rpo_infos: delimited], rest}

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
          ExAliyunOts.TableStoreTunnel.GetRpoResponse,
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
      %{1 => {:rpo_infos, {:scalar, ""}, :bytes}, 2 => {:tunnel_rpo_infos, {:scalar, ""}, :bytes}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{rpo_infos: {1, {:scalar, ""}, :bytes}, tunnel_rpo_infos: {2, {:scalar, ""}, :bytes}}
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "rpoInfos",
          kind: {:scalar, ""},
          label: :optional,
          name: :rpo_infos,
          tag: 1,
          type: :bytes
        },
        %{
          __struct__: Protox.Field,
          json_name: "tunnelRpoInfos",
          kind: {:scalar, ""},
          label: :optional,
          name: :tunnel_rpo_infos,
          tag: 2,
          type: :bytes
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:rpo_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :rpo_infos,
             tag: 1,
             type: :bytes
           }}
        end

        def(field_def("rpoInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :rpo_infos,
             tag: 1,
             type: :bytes
           }}
        end

        def(field_def("rpo_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :rpo_infos,
             tag: 1,
             type: :bytes
           }}
        end
      ),
      (
        def(field_def(:tunnel_rpo_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_rpo_infos,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("tunnelRpoInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_rpo_infos,
             tag: 2,
             type: :bytes
           }}
        end

        def(field_def("tunnel_rpo_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tunnelRpoInfos",
             kind: {:scalar, ""},
             label: :optional,
             name: :tunnel_rpo_infos,
             tag: 2,
             type: :bytes
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
      def(default(:rpo_infos)) do
        {:ok, ""}
      end,
      def(default(:tunnel_rpo_infos)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end