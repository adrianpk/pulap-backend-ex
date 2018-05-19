defmodule PulapWeb.TenureControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.Tenure

  @create_attrs %{
    ends_at: "2010-04-17 14:00:00.000000Z",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    job_description: "some job_description",
    job_title: "some job_title",
    started_at: "2010-04-17 14:00:00.000000Z"
  }
  @update_attrs %{
    ends_at: "2011-05-18 15:01:01.000000Z",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    job_description: "some updated job_description",
    job_title: "some updated job_title",
    started_at: "2011-05-18 15:01:01.000000Z"
  }
  @invalid_attrs %{
    ends_at: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    job_description: nil,
    job_title: nil,
    started_at: nil
  }

  def fixture(:tenure) do
    {:ok, tenure} = Biz.create_tenure(@create_attrs)
    tenure
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tenures", %{conn: conn} do
      conn = get(conn, api_v1_tenure_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tenure" do
    test "renders tenure when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_tenure_path(conn, :create), tenure: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_tenure_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "ends_at" => "2010-04-17 14:00:00.000000Z",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "job_description" => "some job_description",
               "job_title" => "some job_title",
               "started_at" => "2010-04-17 14:00:00.000000Z"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_tenure_path(conn, :create), tenure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tenure" do
    setup [:create_tenure]

    test "renders tenure when data is valid", %{conn: conn, tenure: %Tenure{id: id} = tenure} do
      conn = put(conn, api_v1_tenure_path(conn, :update, tenure), tenure: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_tenure_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "ends_at" => "2011-05-18 15:01:01.000000Z",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "job_description" => "some updated job_description",
               "job_title" => "some updated job_title",
               "started_at" => "2011-05-18 15:01:01.000000Z"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, tenure: tenure} do
      conn = put(conn, api_v1_tenure_path(conn, :update, tenure), tenure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tenure" do
    setup [:create_tenure]

    test "deletes chosen tenure", %{conn: conn, tenure: tenure} do
      conn = delete(conn, api_v1_tenure_path(conn, :delete, tenure))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_tenure_path(conn, :show, tenure))
      end)
    end
  end

  defp create_tenure(_) do
    tenure = fixture(:tenure)
    {:ok, tenure: tenure}
  end
end
