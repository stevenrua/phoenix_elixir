defmodule MatricularCurso.Cursos do
  @moduledoc """
  The Cursos context.
  """

  import Ecto.Query, warn: false
  alias MatricularCurso.Repo

  alias MatricularCurso.Cursos.Curso

  @doc """
  Returns the list of cursos.

  ## Examples

      iex> list_cursos()
      [%Curso{}, ...]

  """
  def list_cursos do
    Repo.all(Curso) |> Repo.preload(:estudiante)
  end

  @doc """
  Gets a single curso.

  Raises `Ecto.NoResultsError` if the Curso does not exist.

  ## Examples

      iex> get_curso!(123)
      %Curso{}

      iex> get_curso!(456)
      ** (Ecto.NoResultsError)

  """
  def get_curso!(id), do: Repo.get!(Curso, id) |> Repo.preload(:estudiante)

  @doc """
  Creates a curso.

  ## Examples

      iex> create_curso(%{field: value})
      {:ok, %Curso{}}

      iex> create_curso(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_curso(attrs \\ %{}) do
    %Curso{}
    |> Curso.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a curso.

  ## Examples

      iex> update_curso(curso, %{field: new_value})
      {:ok, %Curso{}}

      iex> update_curso(curso, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_curso(%Curso{} = curso, attrs) do
    curso
    |> Curso.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a curso.

  ## Examples

      iex> delete_curso(curso)
      {:ok, %Curso{}}

      iex> delete_curso(curso)
      {:error, %Ecto.Changeset{}}

  """
  def delete_curso(%Curso{} = curso) do
    Repo.delete(curso)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking curso changes.

  ## Examples

      iex> change_curso(curso)
      %Ecto.Changeset{data: %Curso{}}

  """
  def change_curso(%Curso{} = curso, attrs \\ %{}) do
    Curso.changeset(curso, attrs)
  end
end
