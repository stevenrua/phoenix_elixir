defmodule MatricularCursoWeb.Estudiante_CursoControllerTest do
  use MatricularCursoWeb.ConnCase

  import MatricularCurso.Estudiantes_CursosFixtures

  alias MatricularCurso.Estudiantes_Cursos.Estudiante_Curso

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all estudiantes_cursos", %{conn: conn} do
      conn = get(conn, ~p"/api/estudiantes_cursos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create estudiante__curso" do
    test "renders estudiante__curso when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/estudiantes_cursos", estudiante__curso: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/estudiantes_cursos/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/estudiantes_cursos", estudiante__curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update estudiante__curso" do
    setup [:create_estudiante__curso]

    test "renders estudiante__curso when data is valid", %{conn: conn, estudiante__curso: %Estudiante_Curso{id: id} = estudiante__curso} do
      conn = put(conn, ~p"/api/estudiantes_cursos/#{estudiante__curso}", estudiante__curso: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/estudiantes_cursos/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, estudiante__curso: estudiante__curso} do
      conn = put(conn, ~p"/api/estudiantes_cursos/#{estudiante__curso}", estudiante__curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete estudiante__curso" do
    setup [:create_estudiante__curso]

    test "deletes chosen estudiante__curso", %{conn: conn, estudiante__curso: estudiante__curso} do
      conn = delete(conn, ~p"/api/estudiantes_cursos/#{estudiante__curso}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/estudiantes_cursos/#{estudiante__curso}")
      end
    end
  end

  defp create_estudiante__curso(_) do
    estudiante__curso = estudiante__curso_fixture()
    %{estudiante__curso: estudiante__curso}
  end
end
