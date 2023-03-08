defmodule MatricularCursoWeb.EstudianteController do
  use MatricularCursoWeb, :controller

  alias MatricularCurso.Estudiantes
  alias MatricularCurso.Estudiantes.Estudiante

  action_fallback MatricularCursoWeb.FallbackController

  def index(conn, _params) do
    estudiantes = Estudiantes.list_estudiantes()
    render(conn, :index, estudiantes: estudiantes)
  end

  def create(conn, %{"estudiante" => estudiante_params}) do
    with {:ok, %Estudiante{} = estudiante} <- Estudiantes.create_estudiante(estudiante_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/estudiantes/#{estudiante}")
      |> render(:show, estudiante: estudiante)
    end
  end

  def show(conn, %{"id" => id}) do
    estudiante = Estudiantes.get_estudiante!(id)
    render(conn, :show, estudiante: estudiante)
  end

  def update(conn, %{"id" => id, "estudiante" => estudiante_params}) do
    estudiante = Estudiantes.get_estudiante!(id)

    with {:ok, %Estudiante{} = estudiante} <- Estudiantes.update_estudiante(estudiante, estudiante_params) do
      render(conn, :show, estudiante: estudiante)
    end
  end

  def delete(conn, %{"id" => id}) do
    estudiante = Estudiantes.get_estudiante!(id)

    with {:ok, %Estudiante{}} <- Estudiantes.delete_estudiante(estudiante) do
      send_resp(conn, :no_content, "")
    end
  end
end
