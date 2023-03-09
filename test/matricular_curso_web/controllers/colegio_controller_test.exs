defmodule MatricularCursoWeb.ColegioControllerTest do
  use MatricularCursoWeb.ConnCase

  import MatricularCurso.ColegiosFixtures

  alias MatricularCurso.Colegios.Colegio

  @create_attrs %{
    ciudad: "some ciudad",
    nombre_colegio: "some nombre_colegio",
    numero_estudiantes: "some numero_estudiantes",
    tipo: "some tipo"
  }
  @update_attrs %{
    ciudad: "some updated ciudad",
    nombre_colegio: "some updated nombre_colegio",
    numero_estudiantes: "some updated numero_estudiantes",
    tipo: "some updated tipo"
  }
  @invalid_attrs %{ciudad: nil, nombre_colegio: nil, numero_estudiantes: nil, tipo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all colegios", %{conn: conn} do
      conn = get(conn, ~p"/api/colegios")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create colegio" do
    test "renders colegio when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/colegios", colegio: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/colegios/#{id}")

      assert %{
               "id" => ^id,
               "ciudad" => "some ciudad",
               "nombre_colegio" => "some nombre_colegio",
               "numero_estudiantes" => "some numero_estudiantes",
               "tipo" => "some tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/colegios", colegio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update colegio" do
    setup [:create_colegio]

    test "renders colegio when data is valid", %{conn: conn, colegio: %Colegio{id: id} = colegio} do
      conn = put(conn, ~p"/api/colegios/#{colegio}", colegio: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/colegios/#{id}")

      assert %{
               "id" => ^id,
               "ciudad" => "some updated ciudad",
               "nombre_colegio" => "some updated nombre_colegio",
               "numero_estudiantes" => "some updated numero_estudiantes",
               "tipo" => "some updated tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, colegio: colegio} do
      conn = put(conn, ~p"/api/colegios/#{colegio}", colegio: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete colegio" do
    setup [:create_colegio]

    test "deletes chosen colegio", %{conn: conn, colegio: colegio} do
      conn = delete(conn, ~p"/api/colegios/#{colegio}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/colegios/#{colegio}")
      end
    end
  end

  defp create_colegio(_) do
    colegio = colegio_fixture()
    %{colegio: colegio}
  end
end
