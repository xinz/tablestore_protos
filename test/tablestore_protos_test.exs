defmodule TablestoreProtosTest do
  use ExUnit.Case

  alias ExAliyunOts.TableStoreSearch.RowCountSort

  test "encode with default enum" do
    encoded = RowCountSort.encode!(%RowCountSort{order: :SORT_ORDER_ASC}) |> IO.iodata_to_binary()
    assert encoded == <<8, 0>>
  end
end
