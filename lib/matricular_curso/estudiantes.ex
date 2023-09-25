defmodule MatricularCurso.Estudiantes do
  @moduledoc """
  The Estudiantes context.
  """

  import Ecto.Query, warn: false
  alias MatricularCurso.Repo

  alias MatricularCurso.Estudiantes.Estudiante

  @doc """
  Returns the list of estudiantes.

  ## Examples

      iex> list_estudiantes()
      [%Estudiante{}, ...]

  """
  def list_estudiantes do
    Repo.all(Estudiante) |> Repo.preload(:cursos) |> Repo.preload(:colegio)
  end

  @doc """
  Gets a single estudiante.

  Raises `Ecto.NoResultsError` if the Estudiante does not exist.

  ## Examples

      iex> get_estudiante!(123)
      %Estudiante{}

      iex> get_estudiante!(456)
      ** (Ecto.NoResultsError)

  """
  def get_estudiante!(id), do: Repo.get!(Estudiante, id) |> Repo.preload(:cursos) |> Repo.preload(:colegio)

  #def get_estudiante_by_name!(nombres), do: Repo.get_by!(Estudiante, nombres: nombres) |> Repo.preload(:cursos) |> Repo.preload(:colegio)
  def buscar_por_nombre!(nombres) do
    from(e in Estudiante, where: e.nombres == ^nombres)
    |> Repo.all()
    |> Repo.preload(:cursos)
    |> Repo.preload(:colegio)
  end

  @doc """
  Creates a estudiante.

  ## Examples

      iex> create_estudiante(%{field: value})
      {:ok, %Estudiante{}}

      iex> create_estudiante(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_estudiante(attrs \\ %{}) do
    %Estudiante{}
    |> Estudiante.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a estudiante.

  ## Examples

      iex> update_estudiante(estudiante, %{field: new_value})
      {:ok, %Estudiante{}}

      iex> update_estudiante(estudiante, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_estudiante(%Estudiante{} = estudiante, attrs) do
    estudiante
    |> Estudiante.changeset(attrs)
    |> Repo.update()
  end



  @doc """
  Deletes a estudiante.

  ## Examples

      iex> delete_estudiante(estudiante)
      {:ok, %Estudiante{}}

      iex> delete_estudiante(estudiante)
      {:error, %Ecto.Changeset{}}

  """
  def delete_estudiante(%Estudiante{} = estudiante) do
    Repo.delete(estudiante)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking estudiante changes.

  ## Examples

      iex> change_estudiante(estudiante)
      %Ecto.Changeset{data: %Estudiante{}}

  """
  def change_estudiante(%Estudiante{} = estudiante, attrs \\ %{}) do
    Estudiante.changeset(estudiante, attrs)
  end
end
