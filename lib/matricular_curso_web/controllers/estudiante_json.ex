defmodule MatricularCursoWeb.EstudianteJSON do
  alias MatricularCurso.Estudiantes.Estudiante

  @doc """
  Renders a list of estudiantes.
  """
  def index(%{estudiantes: estudiantes}) do
    %{data: for(estudiante <- estudiantes, do: data(estudiante))}
  end

  @doc """
  Renders a single estudiante.
  """
  def show(%{estudiante: estudiante}) do
    %{data: data(estudiante)}
  end

  defp data(%Estudiante{} = estudiante) do
    cursos = case is_list(estudiante.cursos) do
      false -> []
      true -> estudiante.cursos
      |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :estudiante, :estudiante_id, :inserted_at,
      :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end

    # cursos = estudiante.cursos
    # |> Enum.map(& Map.from_struct(&1))
    # |> Enum.map(& Enum.reduce([:__meta__, :estudiante, :estudiante_id, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    %{
      id: estudiante.id,
      num_identi: estudiante.num_identi,
      nombres: estudiante.nombres,
      apellidos: estudiante.apellidos,
      edad: estudiante.edad,
      cursos: cursos
    }
  end
end
