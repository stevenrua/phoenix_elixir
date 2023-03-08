defmodule MatricularCursoWeb.EstudianteControllerTest do
  use MatricularCursoWeb.ConnCase

  import MatricularCurso.EstudiantesFixtures

  alias MatricularCurso.Estudiantes.Estudiante

  @create_attrs %{
    apellidos: "some apellidos",
    edad: 42,
    nombres: "some nombres",
    num_identi: "some num_identi"
  }
  @update_attrs %{
    apellidos: "some updated apellidos",
    edad: 43,
    nombres: "some updated nombres",
    num_identi: "some updated num_identi"
  }
  @invalid_attrs %{apellidos: nil, edad: nil, nombres: nil, num_identi: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all estudiantes", %{conn: conn} do
      conn = get(conn, ~p"/api/estudiantes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create estudiante" do
    test "renders estudiante when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/estudiantes", estudiante: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/estudiantes/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "edad" => 42,
               "nombres" => "some nombres",
               "num_identi" => "some num_identi"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/estudiantes", estudiante: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update estudiante" do
    setup [:create_estudiante]

    test "renders estudiante when data is valid", %{conn: conn, estudiante: %Estudiante{id: id} = estudiante} do
      conn = put(conn, ~p"/api/estudiantes/#{estudiante}", estudiante: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/estudiantes/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "edad" => 43,
               "nombres" => "some updated nombres",
               "num_identi" => "some updated num_identi"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, estudiante: estudiante} do
      conn = put(conn, ~p"/api/estudiantes/#{estudiante}", estudiante: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete estudiante" do
    setup [:create_estudiante]

    test "deletes chosen estudiante", %{conn: conn, estudiante: estudiante} do
      conn = delete(conn, ~p"/api/estudiantes/#{estudiante}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/estudiantes/#{estudiante}")
      end
    end
  end

  defp create_estudiante(_) do
    estudiante = estudiante_fixture()
    %{estudiante: estudiante}
  end
end
