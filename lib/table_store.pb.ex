defmodule ExAliyunOts.TableStore.PrimaryKeyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :INTEGER | :STRING | :BINARY

  field :INTEGER, 1
  field :STRING, 2
  field :BINARY, 3
end

defmodule ExAliyunOts.TableStore.DefinedColumnType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :DCT_INTEGER | :DCT_DOUBLE | :DCT_BOOLEAN | :DCT_STRING | :DCT_BLOB

  field :DCT_INTEGER, 1
  field :DCT_DOUBLE, 2
  field :DCT_BOOLEAN, 3
  field :DCT_STRING, 4
  field :DCT_BLOB, 7
end

defmodule ExAliyunOts.TableStore.PrimaryKeyOption do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :AUTO_INCREMENT

  field :AUTO_INCREMENT, 1
end

defmodule ExAliyunOts.TableStore.IndexUpdateMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :IUM_ASYNC_INDEX | :IUM_SYNC_INDEX

  field :IUM_ASYNC_INDEX, 0
  field :IUM_SYNC_INDEX, 1
end

defmodule ExAliyunOts.TableStore.IndexType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :IT_GLOBAL_INDEX | :IT_LOCAL_INDEX

  field :IT_GLOBAL_INDEX, 0
  field :IT_LOCAL_INDEX, 1
end

defmodule ExAliyunOts.TableStore.RowExistenceExpectation do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :IGNORE | :EXPECT_EXIST | :EXPECT_NOT_EXIST

  field :IGNORE, 0
  field :EXPECT_EXIST, 1
  field :EXPECT_NOT_EXIST, 2
end

defmodule ExAliyunOts.TableStore.ReturnType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :RT_NONE | :RT_PK | :RT_AFTER_MODIFY

  field :RT_NONE, 0
  field :RT_PK, 1
  field :RT_AFTER_MODIFY, 2
end

defmodule ExAliyunOts.TableStore.OperationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :PUT | :UPDATE | :DELETE

  field :PUT, 1
  field :UPDATE, 2
  field :DELETE, 3
end

defmodule ExAliyunOts.TableStore.Direction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :FORWARD | :BACKWARD

  field :FORWARD, 0
  field :BACKWARD, 1
end

defmodule ExAliyunOts.TableStore.StreamStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :STREAM_ENABLING | :STREAM_ACTIVE

  field :STREAM_ENABLING, 1
  field :STREAM_ACTIVE, 2
end

defmodule ExAliyunOts.TableStore.ActionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :PUT_ROW | :UPDATE_ROW | :DELETE_ROW

  field :PUT_ROW, 1
  field :UPDATE_ROW, 2
  field :DELETE_ROW, 3
end

defmodule ExAliyunOts.TableStore.Error do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          code: String.t(),
          message: String.t()
        }
  defstruct [:code, :message]

  field :code, 1, required: true, type: :string
  field :message, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.PrimaryKeySchema do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStore.PrimaryKeyType.t(),
          option: ExAliyunOts.TableStore.PrimaryKeyOption.t()
        }
  defstruct [:name, :type, :option]

  field :name, 1, required: true, type: :string
  field :type, 2, required: true, type: ExAliyunOts.TableStore.PrimaryKeyType, enum: true
  field :option, 3, optional: true, type: ExAliyunOts.TableStore.PrimaryKeyOption, enum: true
end

defmodule ExAliyunOts.TableStore.DefinedColumnSchema do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStore.DefinedColumnType.t()
        }
  defstruct [:name, :type]

  field :name, 1, required: true, type: :string
  field :type, 2, required: true, type: ExAliyunOts.TableStore.DefinedColumnType, enum: true
end

defmodule ExAliyunOts.TableStore.TableOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time_to_live: integer,
          max_versions: integer,
          deviation_cell_version_in_sec: integer
        }
  defstruct [:time_to_live, :max_versions, :deviation_cell_version_in_sec]

  field :time_to_live, 1, optional: true, type: :int32
  field :max_versions, 2, optional: true, type: :int32
  field :deviation_cell_version_in_sec, 5, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStore.IndexMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          primary_key: [String.t()],
          defined_column: [String.t()],
          index_update_mode: ExAliyunOts.TableStore.IndexUpdateMode.t(),
          index_type: ExAliyunOts.TableStore.IndexType.t()
        }
  defstruct [:name, :primary_key, :defined_column, :index_update_mode, :index_type]

  field :name, 1, required: true, type: :string
  field :primary_key, 2, repeated: true, type: :string
  field :defined_column, 3, repeated: true, type: :string

  field :index_update_mode, 4,
    required: true,
    type: ExAliyunOts.TableStore.IndexUpdateMode,
    enum: true

  field :index_type, 5, required: true, type: ExAliyunOts.TableStore.IndexType, enum: true
end

defmodule ExAliyunOts.TableStore.TableMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          primary_key: [ExAliyunOts.TableStore.PrimaryKeySchema.t()],
          defined_column: [ExAliyunOts.TableStore.DefinedColumnSchema.t()]
        }
  defstruct [:table_name, :primary_key, :defined_column]

  field :table_name, 1, required: true, type: :string
  field :primary_key, 2, repeated: true, type: ExAliyunOts.TableStore.PrimaryKeySchema
  field :defined_column, 3, repeated: true, type: ExAliyunOts.TableStore.DefinedColumnSchema
end

defmodule ExAliyunOts.TableStore.Condition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          row_existence: ExAliyunOts.TableStore.RowExistenceExpectation.t(),
          column_condition: binary
        }
  defstruct [:row_existence, :column_condition]

  field :row_existence, 1,
    required: true,
    type: ExAliyunOts.TableStore.RowExistenceExpectation,
    enum: true

  field :column_condition, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.CapacityUnit do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          read: integer,
          write: integer
        }
  defstruct [:read, :write]

  field :read, 1, optional: true, type: :int32
  field :write, 2, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStore.ReservedThroughputDetails do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity_unit: ExAliyunOts.TableStore.CapacityUnit.t() | nil,
          last_increase_time: integer,
          last_decrease_time: integer
        }
  defstruct [:capacity_unit, :last_increase_time, :last_decrease_time]

  field :capacity_unit, 1, required: true, type: ExAliyunOts.TableStore.CapacityUnit
  field :last_increase_time, 2, required: true, type: :int64
  field :last_decrease_time, 3, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStore.ReservedThroughput do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity_unit: ExAliyunOts.TableStore.CapacityUnit.t() | nil
        }
  defstruct [:capacity_unit]

  field :capacity_unit, 1, required: true, type: ExAliyunOts.TableStore.CapacityUnit
end

defmodule ExAliyunOts.TableStore.ConsumedCapacity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity_unit: ExAliyunOts.TableStore.CapacityUnit.t() | nil
        }
  defstruct [:capacity_unit]

  field :capacity_unit, 1, required: true, type: ExAliyunOts.TableStore.CapacityUnit
end

defmodule ExAliyunOts.TableStore.StreamSpecification do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          enable_stream: boolean,
          expiration_time: integer
        }
  defstruct [:enable_stream, :expiration_time]

  field :enable_stream, 1, required: true, type: :bool
  field :expiration_time, 2, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStore.StreamDetails do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          enable_stream: boolean,
          stream_id: String.t(),
          expiration_time: integer,
          last_enable_time: integer
        }
  defstruct [:enable_stream, :stream_id, :expiration_time, :last_enable_time]

  field :enable_stream, 1, required: true, type: :bool
  field :stream_id, 2, optional: true, type: :string
  field :expiration_time, 3, optional: true, type: :int32
  field :last_enable_time, 4, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStore.CreateTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_meta: ExAliyunOts.TableStore.TableMeta.t() | nil,
          reserved_throughput: ExAliyunOts.TableStore.ReservedThroughput.t() | nil,
          table_options: ExAliyunOts.TableStore.TableOptions.t() | nil,
          stream_spec: ExAliyunOts.TableStore.StreamSpecification.t() | nil,
          index_metas: [ExAliyunOts.TableStore.IndexMeta.t()]
        }
  defstruct [:table_meta, :reserved_throughput, :table_options, :stream_spec, :index_metas]

  field :table_meta, 1, required: true, type: ExAliyunOts.TableStore.TableMeta
  field :reserved_throughput, 2, required: true, type: ExAliyunOts.TableStore.ReservedThroughput
  field :table_options, 3, optional: true, type: ExAliyunOts.TableStore.TableOptions
  field :stream_spec, 5, optional: true, type: ExAliyunOts.TableStore.StreamSpecification
  field :index_metas, 7, repeated: true, type: ExAliyunOts.TableStore.IndexMeta
end

defmodule ExAliyunOts.TableStore.CreateTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.CreateIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          main_table_name: String.t(),
          index_meta: ExAliyunOts.TableStore.IndexMeta.t() | nil,
          include_base_data: boolean
        }
  defstruct [:main_table_name, :index_meta, :include_base_data]

  field :main_table_name, 1, required: true, type: :string
  field :index_meta, 2, required: true, type: ExAliyunOts.TableStore.IndexMeta
  field :include_base_data, 3, optional: true, type: :bool
end

defmodule ExAliyunOts.TableStore.CreateIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.DropIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          main_table_name: String.t(),
          index_name: String.t()
        }
  defstruct [:main_table_name, :index_name]

  field :main_table_name, 1, required: true, type: :string
  field :index_name, 2, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.DropIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.UpdateTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          reserved_throughput: ExAliyunOts.TableStore.ReservedThroughput.t() | nil,
          table_options: ExAliyunOts.TableStore.TableOptions.t() | nil,
          stream_spec: ExAliyunOts.TableStore.StreamSpecification.t() | nil
        }
  defstruct [:table_name, :reserved_throughput, :table_options, :stream_spec]

  field :table_name, 1, required: true, type: :string
  field :reserved_throughput, 2, optional: true, type: ExAliyunOts.TableStore.ReservedThroughput
  field :table_options, 3, optional: true, type: ExAliyunOts.TableStore.TableOptions
  field :stream_spec, 4, optional: true, type: ExAliyunOts.TableStore.StreamSpecification
end

defmodule ExAliyunOts.TableStore.UpdateTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reserved_throughput_details: ExAliyunOts.TableStore.ReservedThroughputDetails.t() | nil,
          table_options: ExAliyunOts.TableStore.TableOptions.t() | nil,
          stream_details: ExAliyunOts.TableStore.StreamDetails.t() | nil
        }
  defstruct [:reserved_throughput_details, :table_options, :stream_details]

  field :reserved_throughput_details, 1,
    required: true,
    type: ExAliyunOts.TableStore.ReservedThroughputDetails

  field :table_options, 2, required: true, type: ExAliyunOts.TableStore.TableOptions
  field :stream_details, 3, optional: true, type: ExAliyunOts.TableStore.StreamDetails
end

defmodule ExAliyunOts.TableStore.DescribeTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.DescribeTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_meta: ExAliyunOts.TableStore.TableMeta.t() | nil,
          reserved_throughput_details: ExAliyunOts.TableStore.ReservedThroughputDetails.t() | nil,
          table_options: ExAliyunOts.TableStore.TableOptions.t() | nil,
          stream_details: ExAliyunOts.TableStore.StreamDetails.t() | nil,
          shard_splits: [binary],
          index_metas: [ExAliyunOts.TableStore.IndexMeta.t()]
        }
  defstruct [
    :table_meta,
    :reserved_throughput_details,
    :table_options,
    :stream_details,
    :shard_splits,
    :index_metas
  ]

  field :table_meta, 1, required: true, type: ExAliyunOts.TableStore.TableMeta

  field :reserved_throughput_details, 2,
    required: true,
    type: ExAliyunOts.TableStore.ReservedThroughputDetails

  field :table_options, 3, required: true, type: ExAliyunOts.TableStore.TableOptions
  field :stream_details, 5, optional: true, type: ExAliyunOts.TableStore.StreamDetails
  field :shard_splits, 6, repeated: true, type: :bytes
  field :index_metas, 8, repeated: true, type: ExAliyunOts.TableStore.IndexMeta
end

defmodule ExAliyunOts.TableStore.ListTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.ListTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_names: [String.t()]
        }
  defstruct [:table_names]

  field :table_names, 1, repeated: true, type: :string
end

defmodule ExAliyunOts.TableStore.DeleteTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.DeleteTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.LoadTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.LoadTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.UnloadTableRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.UnloadTableResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.TimeRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          start_time: integer,
          end_time: integer,
          specific_time: integer
        }
  defstruct [:start_time, :end_time, :specific_time]

  field :start_time, 1, optional: true, type: :int64
  field :end_time, 2, optional: true, type: :int64
  field :specific_time, 3, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStore.ReturnContent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          return_type: ExAliyunOts.TableStore.ReturnType.t(),
          return_column_names: [String.t()]
        }
  defstruct [:return_type, :return_column_names]

  field :return_type, 1, optional: true, type: ExAliyunOts.TableStore.ReturnType, enum: true
  field :return_column_names, 2, repeated: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          primary_key: binary,
          columns_to_get: [String.t()],
          time_range: ExAliyunOts.TableStore.TimeRange.t() | nil,
          max_versions: integer,
          filter: binary,
          start_column: String.t(),
          end_column: String.t(),
          token: binary,
          transaction_id: String.t()
        }
  defstruct [
    :table_name,
    :primary_key,
    :columns_to_get,
    :time_range,
    :max_versions,
    :filter,
    :start_column,
    :end_column,
    :token,
    :transaction_id
  ]

  field :table_name, 1, required: true, type: :string
  field :primary_key, 2, required: true, type: :bytes
  field :columns_to_get, 3, repeated: true, type: :string
  field :time_range, 4, optional: true, type: ExAliyunOts.TableStore.TimeRange
  field :max_versions, 5, optional: true, type: :int32
  field :filter, 7, optional: true, type: :bytes
  field :start_column, 8, optional: true, type: :string
  field :end_column, 9, optional: true, type: :string
  field :token, 10, optional: true, type: :bytes
  field :transaction_id, 11, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary,
          next_token: binary
        }
  defstruct [:consumed, :row, :next_token]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 2, required: true, type: :bytes
  field :next_token, 3, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.UpdateRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          row_change: binary,
          condition: ExAliyunOts.TableStore.Condition.t() | nil,
          return_content: ExAliyunOts.TableStore.ReturnContent.t() | nil,
          transaction_id: String.t()
        }
  defstruct [:table_name, :row_change, :condition, :return_content, :transaction_id]

  field :table_name, 1, required: true, type: :string
  field :row_change, 2, required: true, type: :bytes
  field :condition, 3, required: true, type: ExAliyunOts.TableStore.Condition
  field :return_content, 4, optional: true, type: ExAliyunOts.TableStore.ReturnContent
  field :transaction_id, 5, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.UpdateRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary
        }
  defstruct [:consumed, :row]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.PutRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          row: binary,
          condition: ExAliyunOts.TableStore.Condition.t() | nil,
          return_content: ExAliyunOts.TableStore.ReturnContent.t() | nil,
          transaction_id: String.t()
        }
  defstruct [:table_name, :row, :condition, :return_content, :transaction_id]

  field :table_name, 1, required: true, type: :string
  field :row, 2, required: true, type: :bytes
  field :condition, 3, required: true, type: ExAliyunOts.TableStore.Condition
  field :return_content, 4, optional: true, type: ExAliyunOts.TableStore.ReturnContent
  field :transaction_id, 5, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.PutRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary
        }
  defstruct [:consumed, :row]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.DeleteRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          primary_key: binary,
          condition: ExAliyunOts.TableStore.Condition.t() | nil,
          return_content: ExAliyunOts.TableStore.ReturnContent.t() | nil,
          transaction_id: String.t()
        }
  defstruct [:table_name, :primary_key, :condition, :return_content, :transaction_id]

  field :table_name, 1, required: true, type: :string
  field :primary_key, 2, required: true, type: :bytes
  field :condition, 3, required: true, type: ExAliyunOts.TableStore.Condition
  field :return_content, 4, optional: true, type: ExAliyunOts.TableStore.ReturnContent
  field :transaction_id, 5, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.DeleteRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary
        }
  defstruct [:consumed, :row]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.TableInBatchGetRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          primary_key: [binary],
          token: [binary],
          columns_to_get: [String.t()],
          time_range: ExAliyunOts.TableStore.TimeRange.t() | nil,
          max_versions: integer,
          filter: binary,
          start_column: String.t(),
          end_column: String.t()
        }
  defstruct [
    :table_name,
    :primary_key,
    :token,
    :columns_to_get,
    :time_range,
    :max_versions,
    :filter,
    :start_column,
    :end_column
  ]

  field :table_name, 1, required: true, type: :string
  field :primary_key, 2, repeated: true, type: :bytes
  field :token, 3, repeated: true, type: :bytes
  field :columns_to_get, 4, repeated: true, type: :string
  field :time_range, 5, optional: true, type: ExAliyunOts.TableStore.TimeRange
  field :max_versions, 6, optional: true, type: :int32
  field :filter, 8, optional: true, type: :bytes
  field :start_column, 9, optional: true, type: :string
  field :end_column, 10, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.BatchGetRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tables: [ExAliyunOts.TableStore.TableInBatchGetRowRequest.t()]
        }
  defstruct [:tables]

  field :tables, 1, repeated: true, type: ExAliyunOts.TableStore.TableInBatchGetRowRequest
end

defmodule ExAliyunOts.TableStore.RowInBatchGetRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          is_ok: boolean,
          error: ExAliyunOts.TableStore.Error.t() | nil,
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary,
          next_token: binary
        }
  defstruct [:is_ok, :error, :consumed, :row, :next_token]

  field :is_ok, 1, required: true, type: :bool
  field :error, 2, optional: true, type: ExAliyunOts.TableStore.Error
  field :consumed, 3, optional: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 4, optional: true, type: :bytes
  field :next_token, 5, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.TableInBatchGetRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          rows: [ExAliyunOts.TableStore.RowInBatchGetRowResponse.t()]
        }
  defstruct [:table_name, :rows]

  field :table_name, 1, required: true, type: :string
  field :rows, 2, repeated: true, type: ExAliyunOts.TableStore.RowInBatchGetRowResponse
end

defmodule ExAliyunOts.TableStore.BatchGetRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tables: [ExAliyunOts.TableStore.TableInBatchGetRowResponse.t()]
        }
  defstruct [:tables]

  field :tables, 1, repeated: true, type: ExAliyunOts.TableStore.TableInBatchGetRowResponse
end

defmodule ExAliyunOts.TableStore.RowInBatchWriteRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: ExAliyunOts.TableStore.OperationType.t(),
          row_change: binary,
          condition: ExAliyunOts.TableStore.Condition.t() | nil,
          return_content: ExAliyunOts.TableStore.ReturnContent.t() | nil
        }
  defstruct [:type, :row_change, :condition, :return_content]

  field :type, 1, required: true, type: ExAliyunOts.TableStore.OperationType, enum: true
  field :row_change, 2, required: true, type: :bytes
  field :condition, 3, required: true, type: ExAliyunOts.TableStore.Condition
  field :return_content, 4, optional: true, type: ExAliyunOts.TableStore.ReturnContent
end

defmodule ExAliyunOts.TableStore.TableInBatchWriteRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          rows: [ExAliyunOts.TableStore.RowInBatchWriteRowRequest.t()]
        }
  defstruct [:table_name, :rows]

  field :table_name, 1, required: true, type: :string
  field :rows, 2, repeated: true, type: ExAliyunOts.TableStore.RowInBatchWriteRowRequest
end

defmodule ExAliyunOts.TableStore.BatchWriteRowRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tables: [ExAliyunOts.TableStore.TableInBatchWriteRowRequest.t()],
          transaction_id: String.t()
        }
  defstruct [:tables, :transaction_id]

  field :tables, 1, repeated: true, type: ExAliyunOts.TableStore.TableInBatchWriteRowRequest
  field :transaction_id, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.RowInBatchWriteRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          is_ok: boolean,
          error: ExAliyunOts.TableStore.Error.t() | nil,
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          row: binary
        }
  defstruct [:is_ok, :error, :consumed, :row]

  field :is_ok, 1, required: true, type: :bool
  field :error, 2, optional: true, type: ExAliyunOts.TableStore.Error
  field :consumed, 3, optional: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :row, 4, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.TableInBatchWriteRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          rows: [ExAliyunOts.TableStore.RowInBatchWriteRowResponse.t()]
        }
  defstruct [:table_name, :rows]

  field :table_name, 1, required: true, type: :string
  field :rows, 2, repeated: true, type: ExAliyunOts.TableStore.RowInBatchWriteRowResponse
end

defmodule ExAliyunOts.TableStore.BatchWriteRowResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          tables: [ExAliyunOts.TableStore.TableInBatchWriteRowResponse.t()]
        }
  defstruct [:tables]

  field :tables, 1, repeated: true, type: ExAliyunOts.TableStore.TableInBatchWriteRowResponse
end

defmodule ExAliyunOts.TableStore.GetRangeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          direction: ExAliyunOts.TableStore.Direction.t(),
          columns_to_get: [String.t()],
          time_range: ExAliyunOts.TableStore.TimeRange.t() | nil,
          max_versions: integer,
          limit: integer,
          inclusive_start_primary_key: binary,
          exclusive_end_primary_key: binary,
          filter: binary,
          start_column: String.t(),
          end_column: String.t(),
          token: binary,
          transaction_id: String.t()
        }
  defstruct [
    :table_name,
    :direction,
    :columns_to_get,
    :time_range,
    :max_versions,
    :limit,
    :inclusive_start_primary_key,
    :exclusive_end_primary_key,
    :filter,
    :start_column,
    :end_column,
    :token,
    :transaction_id
  ]

  field :table_name, 1, required: true, type: :string
  field :direction, 2, required: true, type: ExAliyunOts.TableStore.Direction, enum: true
  field :columns_to_get, 3, repeated: true, type: :string
  field :time_range, 4, optional: true, type: ExAliyunOts.TableStore.TimeRange
  field :max_versions, 5, optional: true, type: :int32
  field :limit, 6, optional: true, type: :int32
  field :inclusive_start_primary_key, 7, required: true, type: :bytes
  field :exclusive_end_primary_key, 8, required: true, type: :bytes
  field :filter, 10, optional: true, type: :bytes
  field :start_column, 11, optional: true, type: :string
  field :end_column, 12, optional: true, type: :string
  field :token, 13, optional: true, type: :bytes
  field :transaction_id, 14, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetRangeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          rows: binary,
          next_start_primary_key: binary,
          next_token: binary
        }
  defstruct [:consumed, :rows, :next_start_primary_key, :next_token]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :rows, 2, required: true, type: :bytes
  field :next_start_primary_key, 3, optional: true, type: :bytes
  field :next_token, 4, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.StartLocalTransactionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          key: binary
        }
  defstruct [:table_name, :key]

  field :table_name, 1, required: true, type: :string
  field :key, 2, required: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.StartLocalTransactionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          transaction_id: String.t()
        }
  defstruct [:transaction_id]

  field :transaction_id, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.CommitTransactionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          transaction_id: String.t()
        }
  defstruct [:transaction_id]

  field :transaction_id, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.CommitTransactionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.AbortTransactionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          transaction_id: String.t()
        }
  defstruct [:transaction_id]

  field :transaction_id, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.AbortTransactionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStore.ListStreamRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.Stream do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stream_id: String.t(),
          table_name: String.t(),
          creation_time: integer
        }
  defstruct [:stream_id, :table_name, :creation_time]

  field :stream_id, 1, required: true, type: :string
  field :table_name, 2, required: true, type: :string
  field :creation_time, 3, required: true, type: :int64
end

defmodule ExAliyunOts.TableStore.ListStreamResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          streams: [ExAliyunOts.TableStore.Stream.t()]
        }
  defstruct [:streams]

  field :streams, 1, repeated: true, type: ExAliyunOts.TableStore.Stream
end

defmodule ExAliyunOts.TableStore.StreamShard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          shard_id: String.t(),
          parent_id: String.t(),
          parent_sibling_id: String.t()
        }
  defstruct [:shard_id, :parent_id, :parent_sibling_id]

  field :shard_id, 1, required: true, type: :string
  field :parent_id, 2, optional: true, type: :string
  field :parent_sibling_id, 3, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.DescribeStreamRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stream_id: String.t(),
          inclusive_start_shard_id: String.t(),
          shard_limit: integer
        }
  defstruct [:stream_id, :inclusive_start_shard_id, :shard_limit]

  field :stream_id, 1, required: true, type: :string
  field :inclusive_start_shard_id, 2, optional: true, type: :string
  field :shard_limit, 3, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStore.DescribeStreamResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stream_id: String.t(),
          expiration_time: integer,
          table_name: String.t(),
          creation_time: integer,
          stream_status: ExAliyunOts.TableStore.StreamStatus.t(),
          shards: [ExAliyunOts.TableStore.StreamShard.t()],
          next_shard_id: String.t()
        }
  defstruct [
    :stream_id,
    :expiration_time,
    :table_name,
    :creation_time,
    :stream_status,
    :shards,
    :next_shard_id
  ]

  field :stream_id, 1, required: true, type: :string
  field :expiration_time, 2, required: true, type: :int32
  field :table_name, 3, required: true, type: :string
  field :creation_time, 4, required: true, type: :int64
  field :stream_status, 5, required: true, type: ExAliyunOts.TableStore.StreamStatus, enum: true
  field :shards, 6, repeated: true, type: ExAliyunOts.TableStore.StreamShard
  field :next_shard_id, 7, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetShardIteratorRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stream_id: String.t(),
          shard_id: String.t()
        }
  defstruct [:stream_id, :shard_id]

  field :stream_id, 1, required: true, type: :string
  field :shard_id, 2, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetShardIteratorResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          shard_iterator: String.t()
        }
  defstruct [:shard_iterator]

  field :shard_iterator, 1, required: true, type: :string
end

defmodule ExAliyunOts.TableStore.GetStreamRecordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          shard_iterator: String.t(),
          limit: integer
        }
  defstruct [:shard_iterator, :limit]

  field :shard_iterator, 1, required: true, type: :string
  field :limit, 2, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          action_type: ExAliyunOts.TableStore.ActionType.t(),
          record: binary
        }
  defstruct [:action_type, :record]

  field :action_type, 1, required: true, type: ExAliyunOts.TableStore.ActionType, enum: true
  field :record, 2, required: true, type: :bytes
end

defmodule ExAliyunOts.TableStore.GetStreamRecordResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stream_records: [ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord.t()],
          next_shard_iterator: String.t()
        }
  defstruct [:stream_records, :next_shard_iterator]

  field :stream_records, 1,
    repeated: true,
    type: ExAliyunOts.TableStore.GetStreamRecordResponse.StreamRecord

  field :next_shard_iterator, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.ComputeSplitPointsBySizeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          split_size: integer,
          split_size_unit_in_byte: integer
        }
  defstruct [:table_name, :split_size, :split_size_unit_in_byte]

  field :table_name, 1, required: true, type: :string
  field :split_size, 2, required: true, type: :int64
  field :split_size_unit_in_byte, 3, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          location: String.t(),
          repeat: integer
        }
  defstruct [:location, :repeat]

  field :location, 1, required: true, type: :string
  field :repeat, 2, required: true, type: :sint64
end

defmodule ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          consumed: ExAliyunOts.TableStore.ConsumedCapacity.t() | nil,
          schema: [ExAliyunOts.TableStore.PrimaryKeySchema.t()],
          split_points: [binary],
          locations: [ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation.t()]
        }
  defstruct [:consumed, :schema, :split_points, :locations]

  field :consumed, 1, required: true, type: ExAliyunOts.TableStore.ConsumedCapacity
  field :schema, 2, repeated: true, type: ExAliyunOts.TableStore.PrimaryKeySchema
  field :split_points, 3, repeated: true, type: :bytes

  field :locations, 4,
    repeated: true,
    type: ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation
end

defmodule ExAliyunOts.TableStore.ComputeSplitsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          search_index_splits_options: ExAliyunOts.TableStore.SearchIndexSplitsOptions.t() | nil
        }
  defstruct [:table_name, :search_index_splits_options]

  field :table_name, 1, optional: true, type: :string

  field :search_index_splits_options, 2,
    optional: true,
    type: ExAliyunOts.TableStore.SearchIndexSplitsOptions
end

defmodule ExAliyunOts.TableStore.SearchIndexSplitsOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          index_name: String.t()
        }
  defstruct [:index_name]

  field :index_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStore.ComputeSplitsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          session_id: binary,
          splits_size: integer
        }
  defstruct [:session_id, :splits_size]

  field :session_id, 1, optional: true, type: :bytes
  field :splits_size, 2, optional: true, type: :int32
end
