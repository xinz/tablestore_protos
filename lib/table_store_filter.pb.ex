defmodule ExAliyunOts.TableStoreFilter.FilterType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer | :FT_SINGLE_COLUMN_VALUE | :FT_COMPOSITE_COLUMN_VALUE | :FT_COLUMN_PAGINATION

  field :FT_SINGLE_COLUMN_VALUE, 1
  field :FT_COMPOSITE_COLUMN_VALUE, 2
  field :FT_COLUMN_PAGINATION, 3
end

defmodule ExAliyunOts.TableStoreFilter.ComparatorType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :CT_EQUAL
          | :CT_NOT_EQUAL
          | :CT_GREATER_THAN
          | :CT_GREATER_EQUAL
          | :CT_LESS_THAN
          | :CT_LESS_EQUAL

  field :CT_EQUAL, 1
  field :CT_NOT_EQUAL, 2
  field :CT_GREATER_THAN, 3
  field :CT_GREATER_EQUAL, 4
  field :CT_LESS_THAN, 5
  field :CT_LESS_EQUAL, 6
end

defmodule ExAliyunOts.TableStoreFilter.LogicalOperator do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :LO_NOT | :LO_AND | :LO_OR

  field :LO_NOT, 1
  field :LO_AND, 2
  field :LO_OR, 3
end

defmodule ExAliyunOts.TableStoreFilter.SingleColumnValueFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          comparator: ExAliyunOts.TableStoreFilter.ComparatorType.t(),
          column_name: String.t(),
          column_value: binary,
          filter_if_missing: boolean,
          latest_version_only: boolean
        }
  defstruct [:comparator, :column_name, :column_value, :filter_if_missing, :latest_version_only]

  field :comparator, 1,
    required: true,
    type: ExAliyunOts.TableStoreFilter.ComparatorType,
    enum: true

  field :column_name, 2, required: true, type: :string
  field :column_value, 3, required: true, type: :bytes
  field :filter_if_missing, 4, required: true, type: :bool
  field :latest_version_only, 5, required: true, type: :bool
end

defmodule ExAliyunOts.TableStoreFilter.CompositeColumnValueFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          combinator: ExAliyunOts.TableStoreFilter.LogicalOperator.t(),
          sub_filters: [ExAliyunOts.TableStoreFilter.Filter.t()]
        }
  defstruct [:combinator, :sub_filters]

  field :combinator, 1,
    required: true,
    type: ExAliyunOts.TableStoreFilter.LogicalOperator,
    enum: true

  field :sub_filters, 2, repeated: true, type: ExAliyunOts.TableStoreFilter.Filter
end

defmodule ExAliyunOts.TableStoreFilter.ColumnPaginationFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          offset: integer,
          limit: integer
        }
  defstruct [:offset, :limit]

  field :offset, 1, required: true, type: :int32
  field :limit, 2, required: true, type: :int32
end

defmodule ExAliyunOts.TableStoreFilter.Filter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: ExAliyunOts.TableStoreFilter.FilterType.t(),
          filter: binary
        }
  defstruct [:type, :filter]

  field :type, 1, required: true, type: ExAliyunOts.TableStoreFilter.FilterType, enum: true
  field :filter, 2, required: true, type: :bytes
end
