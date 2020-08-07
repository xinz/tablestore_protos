defmodule TablestoreProtosTest do
  use ExUnit.Case

  alias ExAliyunOts.TableStoreSearch.RowCountSort

  test "encode with default enum" do
    encoded = RowCountSort.new(order: :'SORT_ORDER_ASC') |> RowCountSort.encode()
    assert encoded == <<8, 0>>
  end
end
