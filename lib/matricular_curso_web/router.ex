defmodule MatricularCursoWeb.Router do
  alias MatricularCursoWeb.Estudiante_CursoController
  alias MatricularCursoWeb.ColegioController
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
    put "/estudiantes/calcularprom/:id", EstudianteController, :calcular
    get "/estudiantes/findbyname/:name", EstudianteController, :findbyname

    resources "/cursos", CursoController, except: [:edit, :new, :update]
    put "/cursos/:id", CursoController, :update

    resources "/colegios", ColegioController, except: [:edit, :new, :update]
    put "/colegios/:id", ColegioController, :update

    resources "/estudiantescursos", Estudiante_CursoController, except: [:edit, :new, :update, :create]
    post "/estudiantescursos", Estudiante_CursoController, :crear
    put "/estudiantescursos/:id", Estudiante_CursoController, :update
  end
end
