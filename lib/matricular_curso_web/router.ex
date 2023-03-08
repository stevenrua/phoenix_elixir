defmodule MatricularCursoWeb.Router do
  alias MatricularCursoWeb.CursoController
  alias MatricularCursoWeb.EstudianteController
  use MatricularCursoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    resources "/estudiantes", EstudianteController, except: [:edit, :new, :update]
    put "/estudiantes/:id", EstudianteController, :update

    resources "/cursos", CursoController, except: [:edit, :new, :update]
    put "/cursos/:id", CursoController, :update
  end
end
