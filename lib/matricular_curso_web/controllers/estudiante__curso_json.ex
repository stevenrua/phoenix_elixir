defmodule MatricularCursoWeb.Estudiante_CursoJSON do
  alias MatricularCurso.Estudiantes_Cursos.Estudiante_Curso

  @doc """
  Renders a list of estudiantes_cursos.
  """
  def index(%{estudiantes_cursos: estudiantes_cursos}) do
    %{data: for(estudiante__curso <- estudiantes_cursos, do: data(estudiante__curso))}
  end

  @doc """
  Renders a single estudiante__curso.
  """
  def show(%{estudiante__curso: estudiante__curso}) do
    %{data: data(estudiante__curso)}
  end

  defp data(%Estudiante_Curso{} = estudiante__curso) do
    %{
      id: estudiante__curso.id
    }
  end
end
