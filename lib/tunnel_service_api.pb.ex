defmodule ExAliyunOts.TableStoreTunnel.TunnelType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BaseData | :Stream | :BaseAndStream

  field :BaseData, 1
  field :Stream, 2
  field :BaseAndStream, 3
end

defmodule ExAliyunOts.TableStoreTunnel.ChannelStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :OPEN | :CLOSING | :CLOSE | :TERMINATED

  field :OPEN, 1
  field :CLOSING, 2
  field :CLOSE, 3
  field :TERMINATED, 4
end

defmodule ExAliyunOts.TableStoreTunnel.ActionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :PUT_ROW | :UPDATE_ROW | :DELETE_ROW

  field :PUT_ROW, 1
  field :UPDATE_ROW, 2
  field :DELETE_ROW, 3
end

defmodule ExAliyunOts.TableStoreTunnel.Error do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          code: String.t(),
          message: String.t(),
          tunnel_id: String.t()
        }
  defstruct [:code, :message, :tunnel_id]

  field :code, 1, required: true, type: :string
  field :message, 2, optional: true, type: :string
  field :tunnel_id, 3, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.Tunnel do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          tunnel_name: String.t(),
          tunnel_type: ExAliyunOts.TableStoreTunnel.TunnelType.t()
        }
  defstruct [:table_name, :tunnel_name, :tunnel_type]

  field :table_name, 1, required: true, type: :string
  field :tunnel_name, 3, required: true, type: :string
  field :tunnel_type, 4, required: true, type: ExAliyunOts.TableStoreTunnel.TunnelType, enum: true
end

defmodule ExAliyunOts.TableStoreTunnel.CreateTunnelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel: ExAliyunOts.TableStoreTunnel.Tunnel.t() | nil
        }
  defstruct [:tunnel]

  field :tunnel, 1, required: true, type: ExAliyunOts.TableStoreTunnel.Tunnel
end

defmodule ExAliyunOts.TableStoreTunnel.CreateTunnelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t()
        }
  defstruct [:tunnel_id]

  field :tunnel_id, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.DeleteTunnelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          tunnel_name: String.t(),
          tunnel_id: String.t()
        }
  defstruct [:table_name, :tunnel_name, :tunnel_id]

  field :table_name, 1, required: true, type: :string
  field :tunnel_name, 2, required: true, type: :string
  field :tunnel_id, 3, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.DeleteTunnelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreTunnel.ListTunnelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.TunnelInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          tunnel_type: String.t(),
          table_name: String.t(),
          instance_name: String.t(),
          stream_id: String.t(),
          stage: String.t(),
          expired: boolean,
          tunnel_name: String.t(),
          public: boolean
        }
  defstruct [
    :tunnel_id,
    :tunnel_type,
    :table_name,
    :instance_name,
    :stream_id,
    :stage,
    :expired,
    :tunnel_name,
    :public
  ]

  field :tunnel_id, 1, required: true, type: :string
  field :tunnel_type, 2, required: true, type: :string
  field :table_name, 3, required: true, type: :string
  field :instance_name, 4, required: true, type: :string
  field :stream_id, 5, required: true, type: :string
  field :stage, 6, required: true, type: :string
  field :expired, 7, optional: true, type: :bool
  field :tunnel_name, 8, optional: true, type: :string
  field :public, 9, optional: true, type: :bool
end

defmodule ExAliyunOts.TableStoreTunnel.ListTunnelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnels: [ExAliyunOts.TableStoreTunnel.TunnelInfo.t()]
        }
  defstruct [:tunnels]

  field :tunnels, 1, repeated: true, type: ExAliyunOts.TableStoreTunnel.TunnelInfo
end

defmodule ExAliyunOts.TableStoreTunnel.DescribeTunnelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          tunnel_name: String.t(),
          tunnel_id: String.t()
        }
  defstruct [:table_name, :tunnel_name, :tunnel_id]

  field :table_name, 1, required: true, type: :string
  field :tunnel_name, 2, required: true, type: :string
  field :tunnel_id, 3, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.ChannelInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          channel_status: String.t(),
          client_id: String.t(),
          channel_rpo: integer,
          channel_count: integer
        }
  defstruct [
    :channel_id,
    :channel_type,
    :channel_status,
    :client_id,
    :channel_rpo,
    :channel_count
  ]

  field :channel_id, 1, required: true, type: :string
  field :channel_type, 2, optional: true, type: :string
  field :channel_status, 3, optional: true, type: :string
  field :client_id, 4, optional: true, type: :string
  field :channel_rpo, 5, optional: true, type: :int64
  field :channel_count, 6, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel: ExAliyunOts.TableStoreTunnel.TunnelInfo.t() | nil,
          channels: [ExAliyunOts.TableStoreTunnel.ChannelInfo.t()],
          tunnel_rpo: integer
        }
  defstruct [:tunnel, :channels, :tunnel_rpo]

  field :tunnel, 1, required: true, type: ExAliyunOts.TableStoreTunnel.TunnelInfo
  field :channels, 2, repeated: true, type: ExAliyunOts.TableStoreTunnel.ChannelInfo
  field :tunnel_rpo, 3, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreTunnel.GetRpoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t()
        }
  defstruct [:tunnel_id]

  field :tunnel_id, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.GetRpoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rpo_infos: binary,
          tunnel_rpo_infos: binary
        }
  defstruct [:rpo_infos, :tunnel_rpo_infos]

  field :rpo_infos, 1, optional: true, type: :bytes
  field :tunnel_rpo_infos, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreTunnel.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          timeout: integer,
          client_tag: String.t()
        }
  defstruct [:timeout, :client_tag]

  field :timeout, 1, optional: true, type: :int64
  field :client_tag, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.ConnectRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_config: ExAliyunOts.TableStoreTunnel.ClientConfig.t() | nil
        }
  defstruct [:tunnel_id, :client_config]

  field :tunnel_id, 1, required: true, type: :string
  field :client_config, 2, optional: true, type: ExAliyunOts.TableStoreTunnel.ClientConfig
end

defmodule ExAliyunOts.TableStoreTunnel.ConnectResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          client_id: String.t()
        }
  defstruct [:client_id]

  field :client_id, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.Channel do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          channel_id: String.t(),
          version: integer,
          status: ExAliyunOts.TableStoreTunnel.ChannelStatus.t(),
          detail: binary
        }
  defstruct [:channel_id, :version, :status, :detail]

  field :channel_id, 1, required: true, type: :string
  field :version, 2, required: true, type: :int64
  field :status, 3, required: true, type: ExAliyunOts.TableStoreTunnel.ChannelStatus, enum: true
  field :detail, 4, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreTunnel.HeartbeatRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_id: String.t(),
          channels: [ExAliyunOts.TableStoreTunnel.Channel.t()]
        }
  defstruct [:tunnel_id, :client_id, :channels]

  field :tunnel_id, 1, required: true, type: :string
  field :client_id, 2, required: true, type: :string
  field :channels, 3, repeated: true, type: ExAliyunOts.TableStoreTunnel.Channel
end

defmodule ExAliyunOts.TableStoreTunnel.HeartbeatResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          channels: [ExAliyunOts.TableStoreTunnel.Channel.t()]
        }
  defstruct [:channels]

  field :channels, 1, repeated: true, type: ExAliyunOts.TableStoreTunnel.Channel
end

defmodule ExAliyunOts.TableStoreTunnel.ShutdownRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_id: String.t()
        }
  defstruct [:tunnel_id, :client_id]

  field :tunnel_id, 1, required: true, type: :string
  field :client_id, 2, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.ShutdownResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreTunnel.GetCheckpointRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_id: String.t(),
          channel_id: String.t()
        }
  defstruct [:tunnel_id, :client_id, :channel_id]

  field :tunnel_id, 1, required: true, type: :string
  field :client_id, 2, required: true, type: :string
  field :channel_id, 3, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.GetCheckpointResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          checkpoint: String.t(),
          sequence_number: integer
        }
  defstruct [:checkpoint, :sequence_number]

  field :checkpoint, 1, required: true, type: :string
  field :sequence_number, 2, required: true, type: :int64
end

defmodule ExAliyunOts.TableStoreTunnel.CheckpointRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_id: String.t(),
          channel_id: String.t(),
          checkpoint: String.t(),
          sequence_number: integer
        }
  defstruct [:tunnel_id, :client_id, :channel_id, :checkpoint, :sequence_number]

  field :tunnel_id, 1, required: true, type: :string
  field :client_id, 2, required: true, type: :string
  field :channel_id, 3, required: true, type: :string
  field :checkpoint, 4, required: true, type: :string
  field :sequence_number, 5, required: true, type: :int64
end

defmodule ExAliyunOts.TableStoreTunnel.CheckpointResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreTunnel.ReadRecordsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tunnel_id: String.t(),
          client_id: String.t(),
          channel_id: String.t(),
          token: String.t()
        }
  defstruct [:tunnel_id, :client_id, :channel_id, :token]

  field :tunnel_id, 1, required: true, type: :string
  field :client_id, 2, required: true, type: :string
  field :channel_id, 3, required: true, type: :string
  field :token, 4, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.Record do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          action_type: ExAliyunOts.TableStoreTunnel.ActionType.t(),
          record: binary
        }
  defstruct [:action_type, :record]

  field :action_type, 1, required: true, type: ExAliyunOts.TableStoreTunnel.ActionType, enum: true
  field :record, 2, required: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreTunnel.ReadRecordsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          records: [ExAliyunOts.TableStoreTunnel.Record.t()],
          next_token: String.t()
        }
  defstruct [:records, :next_token]

  field :records, 1, repeated: true, type: ExAliyunOts.TableStoreTunnel.Record
  field :next_token, 2, required: true, type: :string
end

defmodule ExAliyunOts.TableStoreTunnel.Token do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          version: integer,
          content: binary
        }
  defstruct [:version, :content]

  field :version, 1, required: true, type: :int64
  field :content, 2, required: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreTunnel.TokenContent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          primary_key: binary,
          iterator: String.t(),
          timestamp: integer
        }
  defstruct [:primary_key, :iterator, :timestamp]

  field :primary_key, 1, optional: true, type: :bytes
  field :iterator, 2, optional: true, type: :string
  field :timestamp, 3, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreTunnel.TokenContentV2 do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          primary_key: binary,
          iterator: String.t(),
          timestamp: integer,
          total_count: integer
        }
  defstruct [:primary_key, :iterator, :timestamp, :total_count]

  field :primary_key, 1, optional: true, type: :bytes
  field :iterator, 2, optional: true, type: :string
  field :timestamp, 3, optional: true, type: :int64
  field :total_count, 4, optional: true, type: :int64
end
