defmodule MatricularCursoWeb.ColegioJSON do
  alias MatricularCurso.Colegios.Colegio

  @doc """
  Renders a list of colegios.
  """
  def index(%{colegios: colegios}) do
    %{data: for(colegio <- colegios, do: data(colegio))}
  end

  @doc """
  Renders a single colegio.
  """
  def show(%{colegio: colegio}) do
    %{data: data(colegio)}
  end

  defp data(%Colegio{} = colegio) do
    estudiantes = case is_list(colegio.estudiantes) do
      false -> []
      true -> colegio.estudiantes
      |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :colegio_id, :colegio, :cursos, :inserted_at,
      :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end
    %{
      id: colegio.id,
      nombre_colegio: colegio.nombre_colegio,
      ciudad: colegio.ciudad,
      numero_estudiantes: colegio.numero_estudiantes,
      tipo: colegio.tipo,
      estudiantes: estudiantes
    }
  end
end
