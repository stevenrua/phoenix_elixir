defmodule MatricularCursoWeb.ColegioController do
  use MatricularCursoWeb, :controller

  alias MatricularCurso.Colegios
  alias MatricularCurso.Colegios.Colegio

  action_fallback MatricularCursoWeb.FallbackController

  def index(conn, _params) do
    colegios = Colegios.list_colegios()
    render(conn, :index, colegios: colegios)
  end

  def create(conn, %{"colegio" => colegio_params}) do
    with {:ok, %Colegio{} = colegio} <- Colegios.create_colegio(colegio_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/colegios/#{colegio}")
      |> render(:show, colegio: colegio)
    end
  end

  def show(conn, %{"id" => id}) do
    colegio = Colegios.get_colegio!(id)
    render(conn, :show, colegio: colegio)
  end

  def update(conn, %{"id" => id, "colegio" => colegio_params}) do
    colegio = Colegios.get_colegio!(id)

    with {:ok, %Colegio{} = colegio} <- Colegios.update_colegio(colegio, colegio_params) do
      render(conn, :show, colegio: colegio)
    end
  end

  def delete(conn, %{"id" => id}) do
    colegio = Colegios.get_colegio!(id)

    with {:ok, %Colegio{}} <- Colegios.delete_colegio(colegio) do
      send_resp(conn, :no_content, "")
    end
  end
end
