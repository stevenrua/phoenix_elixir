defmodule MatricularCursoWeb.Estudiante_CursoController do
  use MatricularCursoWeb, :controller
  import Plug.Conn
  alias MatricularCurso.Estudiantes_Cursos
  alias MatricularCurso.Estudiantes_Cursos.Estudiante_Curso

  action_fallback MatricularCursoWeb.FallbackController

  def index(conn, _params) do
    estudiantes_cursos = Estudiantes_Cursos.list_estudiantes_cursos()
    render(conn, :index, estudiantes_cursos: estudiantes_cursos)
  end

  # def create(conn, %{"estudiante__curso" => estudiante__curso_params}) do
  #   IO.puts("Entra al controlador")
  #   with {:ok, %Estudiante_Curso{} = estudiante__curso} <- Estudiantes_Cursos.create_estudiante__curso(estudiante__curso_params) do
  #     conn
  #     |> put_status(:created)
  #     #|> put_resp_header("location", ~p"/api/estudiantes_cursos/#{estudiante__curso}")
  #     |> render(:show, estudiante__curso: estudiante__curso)
  #   end
  # end

  def crear(conn, %{"estudiante__curso" => estudiante__curso_params}) do
    IO.puts("Entra al controlador")
    with {:ok, %Estudiante_Curso{} = estudiante__curso} <- Estudiantes_Cursos.create_estudiante__curso(estudiante__curso_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/estudiantes_cursos/#{estudiante__curso}")
      |> render(:show, estudiante__curso: estudiante__curso)
    end
  end

  def show(conn, %{"id" => id}) do
    estudiante__curso = Estudiantes_Cursos.get_estudiante__curso!(id)
    render(conn, :show, estudiante__curso: estudiante__curso)
  end

  def update(conn, %{"id" => id, "estudiante__curso" => estudiante__curso_params}) do
    estudiante__curso = Estudiantes_Cursos.get_estudiante__curso!(id)

    with {:ok, %Estudiante_Curso{} = estudiante__curso} <- Estudiantes_Cursos.update_estudiante__curso(estudiante__curso, estudiante__curso_params) do
      render(conn, :show, estudiante__curso: estudiante__curso)
    end
  end

  def delete(conn, %{"id" => id}) do
    estudiante__curso = Estudiantes_Cursos.get_estudiante__curso!(id)

    with {:ok, %Estudiante_Curso{}} <- Estudiantes_Cursos.delete_estudiante__curso(estudiante__curso) do
      send_resp(conn, :no_content, "")
    end
  end
end
