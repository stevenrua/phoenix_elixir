defmodule MatricularCurso.Estudiantes_Cursos do
  @moduledoc """
  The Estudiantes_Cursos context.
  """

  import Ecto.Query, warn: false
  alias MatricularCurso.Repo

  alias MatricularCurso.Estudiantes_Cursos.Estudiante_Curso

  @doc """
  Returns the list of estudiantes_cursos.

  ## Examples

      iex> list_estudiantes_cursos()
      [%Estudiante_Curso{}, ...]

  """
  def list_estudiantes_cursos do
    Repo.all(Estudiante_Curso)
  end

  @doc """
  Gets a single estudiante__curso.

  Raises `Ecto.NoResultsError` if the Estudiante  curso does not exist.

  ## Examples

      iex> get_estudiante__curso!(123)
      %Estudiante_Curso{}

      iex> get_estudiante__curso!(456)
      ** (Ecto.NoResultsError)

  """
  def get_estudiante__curso!(id), do: Repo.get!(Estudiante_Curso, id)

  @doc """
  Creates a estudiante__curso.

  ## Examples

      iex> create_estudiante__curso(%{field: value})
      {:ok, %Estudiante_Curso{}}

      iex> create_estudiante__curso(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_estudiante__curso(attrs \\ %{}) do
    %Estudiante_Curso{}
    |> Estudiante_Curso.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a estudiante__curso.

  ## Examples

      iex> update_estudiante__curso(estudiante__curso, %{field: new_value})
      {:ok, %Estudiante_Curso{}}

      iex> update_estudiante__curso(estudiante__curso, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_estudiante__curso(%Estudiante_Curso{} = estudiante__curso, attrs) do
    estudiante__curso
    |> Estudiante_Curso.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a estudiante__curso.

  ## Examples

      iex> delete_estudiante__curso(estudiante__curso)
      {:ok, %Estudiante_Curso{}}

      iex> delete_estudiante__curso(estudiante__curso)
      {:error, %Ecto.Changeset{}}

  """
  def delete_estudiante__curso(%Estudiante_Curso{} = estudiante__curso) do
    Repo.delete(estudiante__curso)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking estudiante__curso changes.

  ## Examples

      iex> change_estudiante__curso(estudiante__curso)
      %Ecto.Changeset{data: %Estudiante_Curso{}}

  """
  def change_estudiante__curso(%Estudiante_Curso{} = estudiante__curso, attrs \\ %{}) do
    Estudiante_Curso.changeset(estudiante__curso, attrs)
  end
end
