defmodule PulapWeb.AdministratorshipControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.Administratorship

  @create_attrs %{default: "some default", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{default: "some updated default", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{default: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, started_at: nil}

  def fixture(:administratorship) do
    {:ok, administratorship} = Biz.create_administratorship(@create_attrs)
    administratorship
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all administratorship", %{conn: conn} do
      conn = get conn, api_v1_administratorship_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create administratorship" do
    test "renders administratorship when data is valid", %{conn: conn} do
      conn = post conn, api_v1_administratorship_path(conn, :create), administratorship: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_administratorship_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "default" => "some default",
        "ends_at" => "2010-04-17 14:00:00.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "started_at" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_administratorship_path(conn, :create), administratorship: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update administratorship" do
    setup [:create_administratorship]

    test "renders administratorship when data is valid", %{conn: conn, administratorship: %Administratorship{id: id} = administratorship} do
      conn = put conn, api_v1_administratorship_path(conn, :update, administratorship), administratorship: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_administratorship_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        # "id" => id,
        "default" => "some updated default",
        "ends_at" => "2011-05-18 15:01:01.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "started_at" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, administratorship: administratorship} do
      conn = put conn, api_v1_administratorship_path(conn, :update, administratorship), administratorship: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete administratorship" do
    setup [:create_administratorship]

    test "deletes chosen administratorship", %{conn: conn, administratorship: administratorship} do
      conn = delete conn, api_v1_administratorship_path(conn, :delete, administratorship)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_administratorship_path(conn, :show, administratorship)
      end
    end
  end

  defp create_administratorship(_) do
    administratorship = fixture(:administratorship)
    {:ok, administratorship: administratorship}
  end
end
