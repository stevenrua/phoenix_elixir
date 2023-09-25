defmodule MatricularCursoWeb.CursoJSON do
  alias MatricularCurso.Cursos.Curso

  @doc """
  Renders a list of cursos.
  """
  def index(%{cursos: cursos}) do
    %{data: for(curso <- cursos, do: data(curso))}
  end

  @doc """
  Renders a single curso.
  """
  def show(%{curso: curso}) do
    %{data: data(curso)}
  end

  defp data(%Curso{} = curso) do
    estudiante = case is_list(curso.estudiantes) do
      false -> []
      true -> curso.estudiantes
      |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :cursos, :colegio_id, :colegio, :inserted_at,
      :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end
    # estudiante = [curso.estudiante]
    # |> Enum.map(& Map.from_struct(&1))
    # |> Enum.map(& Enum.reduce([:__meta__, :cursos, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    # |> List.first()
    %{
      id: curso.id,
      nombre_curso: curso.nombre_curso,
      descripcion: curso.descripcion,
      numero_estudiantes: curso.numero_estudiantes,
      nota: curso.nota,
      estudiante: estudiante
    }
  end
end
