defmodule ExAliyunOts.TableStoreSearch.QueryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :MATCH_QUERY
          | :MATCH_PHRASE_QUERY
          | :TERM_QUERY
          | :RANGE_QUERY
          | :PREFIX_QUERY
          | :BOOL_QUERY
          | :CONST_SCORE_QUERY
          | :FUNCTION_SCORE_QUERY
          | :NESTED_QUERY
          | :WILDCARD_QUERY
          | :MATCH_ALL_QUERY
          | :GEO_BOUNDING_BOX_QUERY
          | :GEO_DISTANCE_QUERY
          | :GEO_POLYGON_QUERY
          | :TERMS_QUERY
          | :EXISTS_QUERY

  field :MATCH_QUERY, 1
  field :MATCH_PHRASE_QUERY, 2
  field :TERM_QUERY, 3
  field :RANGE_QUERY, 4
  field :PREFIX_QUERY, 5
  field :BOOL_QUERY, 6
  field :CONST_SCORE_QUERY, 7
  field :FUNCTION_SCORE_QUERY, 8
  field :NESTED_QUERY, 9
  field :WILDCARD_QUERY, 10
  field :MATCH_ALL_QUERY, 11
  field :GEO_BOUNDING_BOX_QUERY, 12
  field :GEO_DISTANCE_QUERY, 13
  field :GEO_POLYGON_QUERY, 14
  field :TERMS_QUERY, 15
  field :EXISTS_QUERY, 16
end

defmodule ExAliyunOts.TableStoreSearch.QueryOperator do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :OR | :AND

  field :OR, 1
  field :AND, 2
end

defmodule ExAliyunOts.TableStoreSearch.ScoreMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :SCORE_MODE_NONE
          | :SCORE_MODE_AVG
          | :SCORE_MODE_MAX
          | :SCORE_MODE_TOTAL
          | :SCORE_MODE_MIN

  field :SCORE_MODE_NONE, 1
  field :SCORE_MODE_AVG, 2
  field :SCORE_MODE_MAX, 3
  field :SCORE_MODE_TOTAL, 4
  field :SCORE_MODE_MIN, 5
end

defmodule ExAliyunOts.TableStoreSearch.SortOrder do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :SORT_ORDER_ASC | :SORT_ORDER_DESC

  field :SORT_ORDER_ASC, 0
  field :SORT_ORDER_DESC, 1
end

defmodule ExAliyunOts.TableStoreSearch.SortMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :SORT_MODE_MIN | :SORT_MODE_MAX | :SORT_MODE_AVG

  field :SORT_MODE_MIN, 0
  field :SORT_MODE_MAX, 1
  field :SORT_MODE_AVG, 2
end

defmodule ExAliyunOts.TableStoreSearch.GeoDistanceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :GEO_DISTANCE_ARC | :GEO_DISTANCE_PLANE

  field :GEO_DISTANCE_ARC, 0
  field :GEO_DISTANCE_PLANE, 1
end

defmodule ExAliyunOts.TableStoreSearch.ColumnReturnType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :RETURN_ALL | :RETURN_SPECIFIED | :RETURN_NONE

  field :RETURN_ALL, 1
  field :RETURN_SPECIFIED, 2
  field :RETURN_NONE, 3
end

defmodule ExAliyunOts.TableStoreSearch.IndexOptions do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :DOCS | :FREQS | :POSITIONS | :OFFSETS

  field :DOCS, 1
  field :FREQS, 2
  field :POSITIONS, 3
  field :OFFSETS, 4
end

defmodule ExAliyunOts.TableStoreSearch.FieldType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :LONG | :DOUBLE | :BOOLEAN | :KEYWORD | :TEXT | :NESTED | :GEO_POINT

  field :LONG, 1
  field :DOUBLE, 2
  field :BOOLEAN, 3
  field :KEYWORD, 4
  field :TEXT, 5
  field :NESTED, 6
  field :GEO_POINT, 7
end

defmodule ExAliyunOts.TableStoreSearch.SyncPhase do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :FULL | :INCR

  field :FULL, 1
  field :INCR, 2
end

defmodule ExAliyunOts.TableStoreSearch.AggregationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer | :AGG_AVG | :AGG_DISTINCT_COUNT | :AGG_MAX | :AGG_MIN | :AGG_SUM | :AGG_COUNT

  field :AGG_AVG, 1
  field :AGG_DISTINCT_COUNT, 6
  field :AGG_MAX, 2
  field :AGG_MIN, 3
  field :AGG_SUM, 4
  field :AGG_COUNT, 5
end

defmodule ExAliyunOts.TableStoreSearch.GroupByType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer | :GROUP_BY_FIELD | :GROUP_BY_RANGE | :GROUP_BY_FILTER | :GROUP_BY_GEO_DISTANCE

  field :GROUP_BY_FIELD, 1
  field :GROUP_BY_RANGE, 2
  field :GROUP_BY_FILTER, 3
  field :GROUP_BY_GEO_DISTANCE, 4
end

defmodule ExAliyunOts.TableStoreSearch.MatchQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          text: String.t(),
          minimum_should_match: integer,
          operator: ExAliyunOts.TableStoreSearch.QueryOperator.t()
        }
  defstruct [:field_name, :text, :minimum_should_match, :operator]

  field :field_name, 1, optional: true, type: :string
  field :text, 2, optional: true, type: :string
  field :minimum_should_match, 3, optional: true, type: :int32
  field :operator, 4, optional: true, type: ExAliyunOts.TableStoreSearch.QueryOperator, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.MatchPhraseQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          text: String.t()
        }
  defstruct [:field_name, :text]

  field :field_name, 1, optional: true, type: :string
  field :text, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.MatchAllQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreSearch.TermQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          term: binary
        }
  defstruct [:field_name, :term]

  field :field_name, 1, optional: true, type: :string
  field :term, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.TermsQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          terms: [binary]
        }
  defstruct [:field_name, :terms]

  field :field_name, 1, optional: true, type: :string
  field :terms, 2, repeated: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.RangeQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          range_from: binary,
          range_to: binary,
          include_lower: boolean,
          include_upper: boolean
        }
  defstruct [:field_name, :range_from, :range_to, :include_lower, :include_upper]

  field :field_name, 1, optional: true, type: :string
  field :range_from, 2, optional: true, type: :bytes
  field :range_to, 3, optional: true, type: :bytes
  field :include_lower, 4, optional: true, type: :bool
  field :include_upper, 5, optional: true, type: :bool
end

defmodule ExAliyunOts.TableStoreSearch.PrefixQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          prefix: String.t()
        }
  defstruct [:field_name, :prefix]

  field :field_name, 1, optional: true, type: :string
  field :prefix, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.WildcardQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          value: String.t()
        }
  defstruct [:field_name, :value]

  field :field_name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.BoolQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          must_queries: [ExAliyunOts.TableStoreSearch.Query.t()],
          must_not_queries: [ExAliyunOts.TableStoreSearch.Query.t()],
          filter_queries: [ExAliyunOts.TableStoreSearch.Query.t()],
          should_queries: [ExAliyunOts.TableStoreSearch.Query.t()],
          minimum_should_match: integer
        }
  defstruct [
    :must_queries,
    :must_not_queries,
    :filter_queries,
    :should_queries,
    :minimum_should_match
  ]

  field :must_queries, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.Query
  field :must_not_queries, 2, repeated: true, type: ExAliyunOts.TableStoreSearch.Query
  field :filter_queries, 3, repeated: true, type: ExAliyunOts.TableStoreSearch.Query
  field :should_queries, 4, repeated: true, type: ExAliyunOts.TableStoreSearch.Query
  field :minimum_should_match, 5, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStoreSearch.ConstScoreQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          filter: ExAliyunOts.TableStoreSearch.Query.t() | nil
        }
  defstruct [:filter]

  field :filter, 1, optional: true, type: ExAliyunOts.TableStoreSearch.Query
end

defmodule ExAliyunOts.TableStoreSearch.FieldValueFactor do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t()
        }
  defstruct [:field_name]

  field :field_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.FunctionScoreQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          query: ExAliyunOts.TableStoreSearch.Query.t() | nil,
          field_value_factor: ExAliyunOts.TableStoreSearch.FieldValueFactor.t() | nil
        }
  defstruct [:query, :field_value_factor]

  field :query, 1, optional: true, type: ExAliyunOts.TableStoreSearch.Query

  field :field_value_factor, 2,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.FieldValueFactor
end

defmodule ExAliyunOts.TableStoreSearch.NestedQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          query: ExAliyunOts.TableStoreSearch.Query.t() | nil,
          score_mode: ExAliyunOts.TableStoreSearch.ScoreMode.t()
        }
  defstruct [:path, :query, :score_mode]

  field :path, 1, optional: true, type: :string
  field :query, 2, optional: true, type: ExAliyunOts.TableStoreSearch.Query
  field :score_mode, 3, optional: true, type: ExAliyunOts.TableStoreSearch.ScoreMode, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.GeoBoundingBoxQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          top_left: String.t(),
          bottom_right: String.t()
        }
  defstruct [:field_name, :top_left, :bottom_right]

  field :field_name, 1, optional: true, type: :string
  field :top_left, 2, optional: true, type: :string
  field :bottom_right, 3, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.GeoDistanceQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          center_point: String.t(),
          distance: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:field_name, :center_point, :distance]

  field :field_name, 1, optional: true, type: :string
  field :center_point, 2, optional: true, type: :string
  field :distance, 3, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.GeoPolygonQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          points: [String.t()]
        }
  defstruct [:field_name, :points]

  field :field_name, 1, optional: true, type: :string
  field :points, 2, repeated: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.ExistsQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t()
        }
  defstruct [:field_name]

  field :field_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.Query do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: ExAliyunOts.TableStoreSearch.QueryType.t(),
          query: binary
        }
  defstruct [:type, :query]

  field :type, 1, optional: true, type: ExAliyunOts.TableStoreSearch.QueryType, enum: true
  field :query, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.Collapse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t()
        }
  defstruct [:field_name]

  field :field_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.NestedFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          filter: ExAliyunOts.TableStoreSearch.Query.t() | nil
        }
  defstruct [:path, :filter]

  field :path, 1, optional: true, type: :string
  field :filter, 2, optional: true, type: ExAliyunOts.TableStoreSearch.Query
end

defmodule ExAliyunOts.TableStoreSearch.ScoreSort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          order: ExAliyunOts.TableStoreSearch.SortOrder.t()
        }
  defstruct [:order]

  field :order, 1, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.FieldSort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          order: ExAliyunOts.TableStoreSearch.SortOrder.t(),
          mode: ExAliyunOts.TableStoreSearch.SortMode.t(),
          nested_filter: ExAliyunOts.TableStoreSearch.NestedFilter.t() | nil
        }
  defstruct [:field_name, :order, :mode, :nested_filter]

  field :field_name, 1, optional: true, type: :string
  field :order, 2, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
  field :mode, 3, optional: true, type: ExAliyunOts.TableStoreSearch.SortMode, enum: true
  field :nested_filter, 4, optional: true, type: ExAliyunOts.TableStoreSearch.NestedFilter
end

defmodule ExAliyunOts.TableStoreSearch.GeoDistanceSort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          points: [String.t()],
          order: ExAliyunOts.TableStoreSearch.SortOrder.t(),
          mode: ExAliyunOts.TableStoreSearch.SortMode.t(),
          distance_type: ExAliyunOts.TableStoreSearch.GeoDistanceType.t(),
          nested_filter: ExAliyunOts.TableStoreSearch.NestedFilter.t() | nil
        }
  defstruct [:field_name, :points, :order, :mode, :distance_type, :nested_filter]

  field :field_name, 1, optional: true, type: :string
  field :points, 2, repeated: true, type: :string
  field :order, 3, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
  field :mode, 4, optional: true, type: ExAliyunOts.TableStoreSearch.SortMode, enum: true

  field :distance_type, 5,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.GeoDistanceType,
    enum: true

  field :nested_filter, 6, optional: true, type: ExAliyunOts.TableStoreSearch.NestedFilter
end

defmodule ExAliyunOts.TableStoreSearch.PrimaryKeySort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          order: ExAliyunOts.TableStoreSearch.SortOrder.t()
        }
  defstruct [:order]

  field :order, 1, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.Sorter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_sort: ExAliyunOts.TableStoreSearch.FieldSort.t() | nil,
          geo_distance_sort: ExAliyunOts.TableStoreSearch.GeoDistanceSort.t() | nil,
          score_sort: ExAliyunOts.TableStoreSearch.ScoreSort.t() | nil,
          pk_sort: ExAliyunOts.TableStoreSearch.PrimaryKeySort.t() | nil
        }
  defstruct [:field_sort, :geo_distance_sort, :score_sort, :pk_sort]

  field :field_sort, 1, optional: true, type: ExAliyunOts.TableStoreSearch.FieldSort
  field :geo_distance_sort, 2, optional: true, type: ExAliyunOts.TableStoreSearch.GeoDistanceSort
  field :score_sort, 3, optional: true, type: ExAliyunOts.TableStoreSearch.ScoreSort
  field :pk_sort, 4, optional: true, type: ExAliyunOts.TableStoreSearch.PrimaryKeySort
end

defmodule ExAliyunOts.TableStoreSearch.Sort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sorter: [ExAliyunOts.TableStoreSearch.Sorter.t()]
        }
  defstruct [:sorter]

  field :sorter, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.Sorter
end

defmodule ExAliyunOts.TableStoreSearch.SearchQuery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          offset: integer,
          limit: integer,
          query: ExAliyunOts.TableStoreSearch.Query.t() | nil,
          collapse: ExAliyunOts.TableStoreSearch.Collapse.t() | nil,
          sort: ExAliyunOts.TableStoreSearch.Sort.t() | nil,
          getTotalCount: boolean,
          token: binary,
          aggs: ExAliyunOts.TableStoreSearch.Aggregations.t() | nil,
          group_bys: ExAliyunOts.TableStoreSearch.GroupBys.t() | nil
        }
  defstruct [:offset, :limit, :query, :collapse, :sort, :getTotalCount, :token, :aggs, :group_bys]

  field :offset, 1, optional: true, type: :int32
  field :limit, 2, optional: true, type: :int32
  field :query, 4, optional: true, type: ExAliyunOts.TableStoreSearch.Query
  field :collapse, 5, optional: true, type: ExAliyunOts.TableStoreSearch.Collapse
  field :sort, 6, optional: true, type: ExAliyunOts.TableStoreSearch.Sort
  field :getTotalCount, 8, optional: true, type: :bool
  field :token, 9, optional: true, type: :bytes
  field :aggs, 10, optional: true, type: ExAliyunOts.TableStoreSearch.Aggregations
  field :group_bys, 11, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBys
end

defmodule ExAliyunOts.TableStoreSearch.ColumnsToGet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          return_type: ExAliyunOts.TableStoreSearch.ColumnReturnType.t(),
          column_names: [String.t()]
        }
  defstruct [:return_type, :column_names]

  field :return_type, 1,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.ColumnReturnType,
    enum: true

  field :column_names, 2, repeated: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.SearchRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          index_name: String.t(),
          columns_to_get: ExAliyunOts.TableStoreSearch.ColumnsToGet.t() | nil,
          search_query: binary,
          routing_values: [binary]
        }
  defstruct [:table_name, :index_name, :columns_to_get, :search_query, :routing_values]

  field :table_name, 1, optional: true, type: :string
  field :index_name, 2, optional: true, type: :string
  field :columns_to_get, 3, optional: true, type: ExAliyunOts.TableStoreSearch.ColumnsToGet
  field :search_query, 4, optional: true, type: :bytes
  field :routing_values, 5, repeated: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.SearchResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          total_hits: integer,
          rows: [binary],
          is_all_succeeded: boolean,
          next_token: binary,
          aggs: binary,
          group_bys: binary
        }
  defstruct [:total_hits, :rows, :is_all_succeeded, :next_token, :aggs, :group_bys]

  field :total_hits, 1, optional: true, type: :int64
  field :rows, 2, repeated: true, type: :bytes
  field :is_all_succeeded, 3, optional: true, type: :bool
  field :next_token, 6, optional: true, type: :bytes
  field :aggs, 7, optional: true, type: :bytes
  field :group_bys, 8, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.SingleWordAnalyzerParameter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          case_sensitive: boolean,
          delimit_word: boolean
        }
  defstruct [:case_sensitive, :delimit_word]

  field :case_sensitive, 1, optional: true, type: :bool
  field :delimit_word, 2, optional: true, type: :bool
end

defmodule ExAliyunOts.TableStoreSearch.SplitAnalyzerParameter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          delimiter: String.t()
        }
  defstruct [:delimiter]

  field :delimiter, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.FuzzyAnalyzerParameter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min_chars: integer,
          max_chars: integer
        }
  defstruct [:min_chars, :max_chars]

  field :min_chars, 1, optional: true, type: :int32
  field :max_chars, 2, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStoreSearch.FieldSchema do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          field_type: ExAliyunOts.TableStoreSearch.FieldType.t(),
          index_options: ExAliyunOts.TableStoreSearch.IndexOptions.t(),
          analyzer: String.t(),
          index: boolean,
          sort_and_agg: boolean,
          store: boolean,
          field_schemas: [ExAliyunOts.TableStoreSearch.FieldSchema.t()],
          is_array: boolean,
          analyzer_parameter: binary
        }
  defstruct [
    :field_name,
    :field_type,
    :index_options,
    :analyzer,
    :index,
    :sort_and_agg,
    :store,
    :field_schemas,
    :is_array,
    :analyzer_parameter
  ]

  field :field_name, 1, optional: true, type: :string
  field :field_type, 2, optional: true, type: ExAliyunOts.TableStoreSearch.FieldType, enum: true

  field :index_options, 3,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.IndexOptions,
    enum: true

  field :analyzer, 4, optional: true, type: :string
  field :index, 5, optional: true, type: :bool
  field :sort_and_agg, 6, optional: true, type: :bool
  field :store, 7, optional: true, type: :bool
  field :field_schemas, 8, repeated: true, type: ExAliyunOts.TableStoreSearch.FieldSchema
  field :is_array, 9, optional: true, type: :bool
  field :analyzer_parameter, 10, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.IndexSchema do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_schemas: [ExAliyunOts.TableStoreSearch.FieldSchema.t()],
          index_setting: ExAliyunOts.TableStoreSearch.IndexSetting.t() | nil,
          index_sort: ExAliyunOts.TableStoreSearch.Sort.t() | nil
        }
  defstruct [:field_schemas, :index_setting, :index_sort]

  field :field_schemas, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.FieldSchema
  field :index_setting, 2, optional: true, type: ExAliyunOts.TableStoreSearch.IndexSetting
  field :index_sort, 3, optional: true, type: ExAliyunOts.TableStoreSearch.Sort
end

defmodule ExAliyunOts.TableStoreSearch.IndexSetting do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          number_of_shards: integer,
          routing_fields: [String.t()],
          routing_partition_size: integer
        }
  defstruct [:number_of_shards, :routing_fields, :routing_partition_size]

  field :number_of_shards, 1, optional: true, type: :int32
  field :routing_fields, 2, repeated: true, type: :string
  field :routing_partition_size, 3, optional: true, type: :int32
end

defmodule ExAliyunOts.TableStoreSearch.CreateSearchIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          index_name: String.t(),
          schema: ExAliyunOts.TableStoreSearch.IndexSchema.t() | nil
        }
  defstruct [:table_name, :index_name, :schema]

  field :table_name, 1, required: true, type: :string
  field :index_name, 2, required: true, type: :string
  field :schema, 3, optional: true, type: ExAliyunOts.TableStoreSearch.IndexSchema
end

defmodule ExAliyunOts.TableStoreSearch.CreateSearchIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreSearch.IndexInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          index_name: String.t()
        }
  defstruct [:table_name, :index_name]

  field :table_name, 1, optional: true, type: :string
  field :index_name, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.ListSearchIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t()
        }
  defstruct [:table_name]

  field :table_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.ListSearchIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          indices: [ExAliyunOts.TableStoreSearch.IndexInfo.t()]
        }
  defstruct [:indices]

  field :indices, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.IndexInfo
end

defmodule ExAliyunOts.TableStoreSearch.DeleteSearchIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          index_name: String.t()
        }
  defstruct [:table_name, :index_name]

  field :table_name, 1, optional: true, type: :string
  field :index_name, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.DeleteSearchIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ExAliyunOts.TableStoreSearch.SyncStat do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sync_phase: ExAliyunOts.TableStoreSearch.SyncPhase.t(),
          current_sync_timestamp: integer
        }
  defstruct [:sync_phase, :current_sync_timestamp]

  field :sync_phase, 1, optional: true, type: ExAliyunOts.TableStoreSearch.SyncPhase, enum: true
  field :current_sync_timestamp, 2, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreSearch.DescribeSearchIndexRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          table_name: String.t(),
          index_name: String.t()
        }
  defstruct [:table_name, :index_name]

  field :table_name, 1, optional: true, type: :string
  field :index_name, 2, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.DescribeSearchIndexResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          schema: ExAliyunOts.TableStoreSearch.IndexSchema.t() | nil,
          sync_stat: ExAliyunOts.TableStoreSearch.SyncStat.t() | nil
        }
  defstruct [:schema, :sync_stat]

  field :schema, 1, optional: true, type: ExAliyunOts.TableStoreSearch.IndexSchema
  field :sync_stat, 2, optional: true, type: ExAliyunOts.TableStoreSearch.SyncStat
end

defmodule ExAliyunOts.TableStoreSearch.Aggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStoreSearch.AggregationType.t(),
          body: binary
        }
  defstruct [:name, :type, :body]

  field :name, 1, optional: true, type: :string
  field :type, 2, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationType, enum: true
  field :body, 3, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.Aggregations do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          aggs: [ExAliyunOts.TableStoreSearch.Aggregation.t()]
        }
  defstruct [:aggs]

  field :aggs, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.Aggregation
end

defmodule ExAliyunOts.TableStoreSearch.GroupBy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStoreSearch.GroupByType.t(),
          body: binary
        }
  defstruct [:name, :type, :body]

  field :name, 1, optional: true, type: :string
  field :type, 2, optional: true, type: ExAliyunOts.TableStoreSearch.GroupByType, enum: true
  field :body, 3, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.GroupBys do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_bys: [ExAliyunOts.TableStoreSearch.GroupBy.t()]
        }
  defstruct [:group_bys]

  field :group_bys, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.GroupBy
end

defmodule ExAliyunOts.TableStoreSearch.AvgAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          missing: binary
        }
  defstruct [:field_name, :missing]

  field :field_name, 1, optional: true, type: :string
  field :missing, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.MaxAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          missing: binary
        }
  defstruct [:field_name, :missing]

  field :field_name, 1, optional: true, type: :string
  field :missing, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.MinAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          missing: binary
        }
  defstruct [:field_name, :missing]

  field :field_name, 1, optional: true, type: :string
  field :missing, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.SumAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          missing: binary
        }
  defstruct [:field_name, :missing]

  field :field_name, 1, optional: true, type: :string
  field :missing, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.CountAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t()
        }
  defstruct [:field_name]

  field :field_name, 1, optional: true, type: :string
end

defmodule ExAliyunOts.TableStoreSearch.DistinctCountAggregation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          missing: binary
        }
  defstruct [:field_name, :missing]

  field :field_name, 1, optional: true, type: :string
  field :missing, 2, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.GroupKeySort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          order: ExAliyunOts.TableStoreSearch.SortOrder.t()
        }
  defstruct [:order]

  field :order, 1, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.RowCountSort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          order: ExAliyunOts.TableStoreSearch.SortOrder.t()
        }
  defstruct [:order]

  field :order, 1, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.SubAggSort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sub_agg_name: String.t(),
          order: ExAliyunOts.TableStoreSearch.SortOrder.t()
        }
  defstruct [:sub_agg_name, :order]

  field :sub_agg_name, 1, optional: true, type: :string
  field :order, 2, optional: true, type: ExAliyunOts.TableStoreSearch.SortOrder, enum: true
end

defmodule ExAliyunOts.TableStoreSearch.GroupBySorter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_key_sort: ExAliyunOts.TableStoreSearch.GroupKeySort.t() | nil,
          row_count_sort: ExAliyunOts.TableStoreSearch.RowCountSort.t() | nil,
          sub_agg_sort: ExAliyunOts.TableStoreSearch.SubAggSort.t() | nil
        }
  defstruct [:group_key_sort, :row_count_sort, :sub_agg_sort]

  field :group_key_sort, 1, optional: true, type: ExAliyunOts.TableStoreSearch.GroupKeySort
  field :row_count_sort, 2, optional: true, type: ExAliyunOts.TableStoreSearch.RowCountSort
  field :sub_agg_sort, 3, optional: true, type: ExAliyunOts.TableStoreSearch.SubAggSort
end

defmodule ExAliyunOts.TableStoreSearch.GroupBySort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sorters: [ExAliyunOts.TableStoreSearch.GroupBySorter.t()]
        }
  defstruct [:sorters]

  field :sorters, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.GroupBySorter
end

defmodule ExAliyunOts.TableStoreSearch.GroupByField do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          size: integer,
          sort: ExAliyunOts.TableStoreSearch.GroupBySort.t() | nil,
          sub_aggs: ExAliyunOts.TableStoreSearch.Aggregations.t() | nil,
          sub_group_bys: ExAliyunOts.TableStoreSearch.GroupBys.t() | nil
        }
  defstruct [:field_name, :size, :sort, :sub_aggs, :sub_group_bys]

  field :field_name, 1, optional: true, type: :string
  field :size, 2, optional: true, type: :int32
  field :sort, 3, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBySort
  field :sub_aggs, 4, optional: true, type: ExAliyunOts.TableStoreSearch.Aggregations
  field :sub_group_bys, 5, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBys
end

defmodule ExAliyunOts.TableStoreSearch.Range do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          from: float | :infinity | :negative_infinity | :nan,
          to: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:from, :to]

  field :from, 1, optional: true, type: :double
  field :to, 2, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.GroupByRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          ranges: [ExAliyunOts.TableStoreSearch.Range.t()],
          sub_aggs: ExAliyunOts.TableStoreSearch.Aggregations.t() | nil,
          sub_group_bys: ExAliyunOts.TableStoreSearch.GroupBys.t() | nil
        }
  defstruct [:field_name, :ranges, :sub_aggs, :sub_group_bys]

  field :field_name, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: ExAliyunOts.TableStoreSearch.Range
  field :sub_aggs, 3, optional: true, type: ExAliyunOts.TableStoreSearch.Aggregations
  field :sub_group_bys, 4, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBys
end

defmodule ExAliyunOts.TableStoreSearch.GroupByFilter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          filters: [ExAliyunOts.TableStoreSearch.Query.t()],
          sub_aggs: ExAliyunOts.TableStoreSearch.Aggregations.t() | nil,
          sub_group_bys: ExAliyunOts.TableStoreSearch.GroupBys.t() | nil
        }
  defstruct [:filters, :sub_aggs, :sub_group_bys]

  field :filters, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.Query
  field :sub_aggs, 2, optional: true, type: ExAliyunOts.TableStoreSearch.Aggregations
  field :sub_group_bys, 3, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBys
end

defmodule ExAliyunOts.TableStoreSearch.GeoPoint do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          lat: float | :infinity | :negative_infinity | :nan,
          lon: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:lat, :lon]

  field :lat, 1, optional: true, type: :double
  field :lon, 2, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.GroupByGeoDistance do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          field_name: String.t(),
          origin: ExAliyunOts.TableStoreSearch.GeoPoint.t() | nil,
          ranges: [ExAliyunOts.TableStoreSearch.Range.t()],
          sub_aggs: ExAliyunOts.TableStoreSearch.Aggregations.t() | nil,
          sub_group_bys: ExAliyunOts.TableStoreSearch.GroupBys.t() | nil
        }
  defstruct [:field_name, :origin, :ranges, :sub_aggs, :sub_group_bys]

  field :field_name, 1, optional: true, type: :string
  field :origin, 2, optional: true, type: ExAliyunOts.TableStoreSearch.GeoPoint
  field :ranges, 3, repeated: true, type: ExAliyunOts.TableStoreSearch.Range
  field :sub_aggs, 4, optional: true, type: ExAliyunOts.TableStoreSearch.Aggregations
  field :sub_group_bys, 5, optional: true, type: ExAliyunOts.TableStoreSearch.GroupBys
end

defmodule ExAliyunOts.TableStoreSearch.AvgAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.DistinctCountAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: integer
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreSearch.MaxAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.MinAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.SumAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :double
end

defmodule ExAliyunOts.TableStoreSearch.CountAggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: integer
        }
  defstruct [:value]

  field :value, 1, optional: true, type: :int64
end

defmodule ExAliyunOts.TableStoreSearch.AggregationResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStoreSearch.AggregationType.t(),
          agg_result: binary
        }
  defstruct [:name, :type, :agg_result]

  field :name, 1, optional: true, type: :string
  field :type, 2, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationType, enum: true
  field :agg_result, 3, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.AggregationsResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          agg_results: [ExAliyunOts.TableStoreSearch.AggregationResult.t()]
        }
  defstruct [:agg_results]

  field :agg_results, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.AggregationResult
end

defmodule ExAliyunOts.TableStoreSearch.GroupByFieldResultItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          row_count: integer,
          sub_aggs_result: ExAliyunOts.TableStoreSearch.AggregationsResult.t() | nil,
          sub_group_bys_result: ExAliyunOts.TableStoreSearch.GroupBysResult.t() | nil
        }
  defstruct [:key, :row_count, :sub_aggs_result, :sub_group_bys_result]

  field :key, 1, optional: true, type: :string
  field :row_count, 2, optional: true, type: :int64
  field :sub_aggs_result, 3, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationsResult

  field :sub_group_bys_result, 4,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.GroupBysResult
end

defmodule ExAliyunOts.TableStoreSearch.GroupByFieldResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_by_field_result_items: [ExAliyunOts.TableStoreSearch.GroupByFieldResultItem.t()]
        }
  defstruct [:group_by_field_result_items]

  field :group_by_field_result_items, 1,
    repeated: true,
    type: ExAliyunOts.TableStoreSearch.GroupByFieldResultItem
end

defmodule ExAliyunOts.TableStoreSearch.GroupByRangeResultItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          from: float | :infinity | :negative_infinity | :nan,
          to: float | :infinity | :negative_infinity | :nan,
          row_count: integer,
          sub_aggs_result: ExAliyunOts.TableStoreSearch.AggregationsResult.t() | nil,
          sub_group_bys_result: ExAliyunOts.TableStoreSearch.GroupBysResult.t() | nil
        }
  defstruct [:from, :to, :row_count, :sub_aggs_result, :sub_group_bys_result]

  field :from, 1, optional: true, type: :double
  field :to, 2, optional: true, type: :double
  field :row_count, 3, optional: true, type: :int64
  field :sub_aggs_result, 4, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationsResult

  field :sub_group_bys_result, 5,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.GroupBysResult
end

defmodule ExAliyunOts.TableStoreSearch.GroupByRangeResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_by_range_result_items: [ExAliyunOts.TableStoreSearch.GroupByRangeResultItem.t()]
        }
  defstruct [:group_by_range_result_items]

  field :group_by_range_result_items, 1,
    repeated: true,
    type: ExAliyunOts.TableStoreSearch.GroupByRangeResultItem
end

defmodule ExAliyunOts.TableStoreSearch.GroupByGeoDistanceResultItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          from: float | :infinity | :negative_infinity | :nan,
          to: float | :infinity | :negative_infinity | :nan,
          row_count: integer,
          sub_aggs_result: ExAliyunOts.TableStoreSearch.AggregationsResult.t() | nil,
          sub_group_bys_result: ExAliyunOts.TableStoreSearch.GroupBysResult.t() | nil
        }
  defstruct [:from, :to, :row_count, :sub_aggs_result, :sub_group_bys_result]

  field :from, 1, optional: true, type: :double
  field :to, 2, optional: true, type: :double
  field :row_count, 3, optional: true, type: :int64
  field :sub_aggs_result, 4, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationsResult

  field :sub_group_bys_result, 5,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.GroupBysResult
end

defmodule ExAliyunOts.TableStoreSearch.GroupByGeoDistanceResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_by_geo_distance_result_items: [
            ExAliyunOts.TableStoreSearch.GroupByGeoDistanceResultItem.t()
          ]
        }
  defstruct [:group_by_geo_distance_result_items]

  field :group_by_geo_distance_result_items, 1,
    repeated: true,
    type: ExAliyunOts.TableStoreSearch.GroupByGeoDistanceResultItem
end

defmodule ExAliyunOts.TableStoreSearch.GroupByFilterResultItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          row_count: integer,
          sub_aggs_result: ExAliyunOts.TableStoreSearch.AggregationsResult.t() | nil,
          sub_group_bys_result: ExAliyunOts.TableStoreSearch.GroupBysResult.t() | nil
        }
  defstruct [:row_count, :sub_aggs_result, :sub_group_bys_result]

  field :row_count, 1, optional: true, type: :int64
  field :sub_aggs_result, 2, optional: true, type: ExAliyunOts.TableStoreSearch.AggregationsResult

  field :sub_group_bys_result, 3,
    optional: true,
    type: ExAliyunOts.TableStoreSearch.GroupBysResult
end

defmodule ExAliyunOts.TableStoreSearch.GroupByFilterResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_by_filter_result_items: [ExAliyunOts.TableStoreSearch.GroupByFilterResultItem.t()]
        }
  defstruct [:group_by_filter_result_items]

  field :group_by_filter_result_items, 1,
    repeated: true,
    type: ExAliyunOts.TableStoreSearch.GroupByFilterResultItem
end

defmodule ExAliyunOts.TableStoreSearch.GroupByResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: ExAliyunOts.TableStoreSearch.GroupByType.t(),
          group_by_result: binary
        }
  defstruct [:name, :type, :group_by_result]

  field :name, 1, optional: true, type: :string
  field :type, 2, optional: true, type: ExAliyunOts.TableStoreSearch.GroupByType, enum: true
  field :group_by_result, 3, optional: true, type: :bytes
end

defmodule ExAliyunOts.TableStoreSearch.GroupBysResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_by_results: [ExAliyunOts.TableStoreSearch.GroupByResult.t()]
        }
  defstruct [:group_by_results]

  field :group_by_results, 1, repeated: true, type: ExAliyunOts.TableStoreSearch.GroupByResult
end
