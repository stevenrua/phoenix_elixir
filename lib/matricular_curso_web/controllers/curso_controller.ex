defmodule MatricularCursoWeb.CursoController do
  use MatricularCursoWeb, :controller

  alias MatricularCurso.Cursos
  alias MatricularCurso.Cursos.Curso

  action_fallback MatricularCursoWeb.FallbackController

  def index(conn, _params) do
    cursos = Cursos.list_cursos()
    render(conn, :index, cursos: cursos)
  end

  def create(conn, %{"curso" => curso_params}) do
    with {:ok, %Curso{} = curso} <- Cursos.create_curso(curso_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/cursos/#{curso}")
      |> render(:show, curso: curso)
    end
  end

  def show(conn, %{"id" => id}) do
    curso = Cursos.get_curso!(id)
    render(conn, :show, curso: curso)
  end

  def update(conn, %{"id" => id, "curso" => curso_params}) do
    curso = Cursos.get_curso!(id)

    with {:ok, %Curso{} = curso} <- Cursos.update_curso(curso, curso_params) do
      render(conn, :show, curso: curso)
    end
  end

  def delete(conn, %{"id" => id}) do
    curso = Cursos.get_curso!(id)

    with {:ok, %Curso{}} <- Cursos.delete_curso(curso) do
      send_resp(conn, :no_content, "")
    end
  end
end
