defmodule PulapWeb.ManagershipControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.Managership

  @create_attrs %{default: "some default", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{default: "some updated default", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{default: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, started_at: nil}

  def fixture(:managership) do
    {:ok, managership} = Biz.create_managership(@create_attrs)
    managership
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all managership", %{conn: conn} do
      conn = get conn, api_v1_managership_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create managership" do
    test "renders managership when data is valid", %{conn: conn} do
      conn = post conn, api_v1_managership_path(conn, :create), managership: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_managership_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "default" => "some default",
        "ends_at" => "2010-04-17 14:00:00.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "started_at" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_managership_path(conn, :create), managership: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update managership" do
    setup [:create_managership]

    test "renders managership when data is valid", %{conn: conn, managership: %Managership{id: id} = managership} do
      conn = put conn, api_v1_managership_path(conn, :update, managership), managership: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_managership_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        # "id" => id,
        "default" => "some updated default",
        "ends_at" => "2011-05-18 15:01:01.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "started_at" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, managership: managership} do
      conn = put conn, api_v1_managership_path(conn, :update, managership), managership: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete managership" do
    setup [:create_managership]

    test "deletes chosen managership", %{conn: conn, managership: managership} do
      conn = delete conn, api_v1_managership_path(conn, :delete, managership)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_managership_path(conn, :show, managership)
      end
    end
  end

  defp create_managership(_) do
    managership = fixture(:managership)
    {:ok, managership: managership}
  end
end
