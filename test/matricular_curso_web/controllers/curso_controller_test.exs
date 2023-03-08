defmodule MatricularCursoWeb.CursoControllerTest do
  use MatricularCursoWeb.ConnCase

  import MatricularCurso.CursosFixtures

  alias MatricularCurso.Cursos.Curso

  @create_attrs %{
    descripcion: "some descripcion",
    nombre_curso: "some nombre_curso",
    numero_estudiantes: 42
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    nombre_curso: "some updated nombre_curso",
    numero_estudiantes: 43
  }
  @invalid_attrs %{descripcion: nil, nombre_curso: nil, numero_estudiantes: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cursos", %{conn: conn} do
      conn = get(conn, ~p"/api/cursos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create curso" do
    test "renders curso when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cursos", curso: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cursos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "nombre_curso" => "some nombre_curso",
               "numero_estudiantes" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cursos", curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update curso" do
    setup [:create_curso]

    test "renders curso when data is valid", %{conn: conn, curso: %Curso{id: id} = curso} do
      conn = put(conn, ~p"/api/cursos/#{curso}", curso: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cursos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "nombre_curso" => "some updated nombre_curso",
               "numero_estudiantes" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, curso: curso} do
      conn = put(conn, ~p"/api/cursos/#{curso}", curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete curso" do
    setup [:create_curso]

    test "deletes chosen curso", %{conn: conn, curso: curso} do
      conn = delete(conn, ~p"/api/cursos/#{curso}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cursos/#{curso}")
      end
    end
  end

  defp create_curso(_) do
    curso = curso_fixture()
    %{curso: curso}
  end
end
