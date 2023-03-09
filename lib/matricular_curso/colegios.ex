defmodule MatricularCurso.Colegios do
  @moduledoc """
  The Colegios context.
  """

  import Ecto.Query, warn: false
  alias MatricularCurso.Repo

  alias MatricularCurso.Colegios.Colegio

  @doc """
  Returns the list of colegios.

  ## Examples

      iex> list_colegios()
      [%Colegio{}, ...]

  """
  def list_colegios do
    Repo.all(Colegio) |> Repo.preload(:estudiantes)
  end

  @doc """
  Gets a single colegio.

  Raises `Ecto.NoResultsError` if the Colegio does not exist.

  ## Examples

      iex> get_colegio!(123)
      %Colegio{}

      iex> get_colegio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_colegio!(id), do: Repo.get!(Colegio, id) |> Repo.preload(:estudiantes)

  @doc """
  Creates a colegio.

  ## Examples

      iex> create_colegio(%{field: value})
      {:ok, %Colegio{}}

      iex> create_colegio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_colegio(attrs \\ %{}) do
    %Colegio{}
    |> Colegio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a colegio.

  ## Examples

      iex> update_colegio(colegio, %{field: new_value})
      {:ok, %Colegio{}}

      iex> update_colegio(colegio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_colegio(%Colegio{} = colegio, attrs) do
    colegio
    |> Colegio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a colegio.

  ## Examples

      iex> delete_colegio(colegio)
      {:ok, %Colegio{}}

      iex> delete_colegio(colegio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_colegio(%Colegio{} = colegio) do
    Repo.delete(colegio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking colegio changes.

  ## Examples

      iex> change_colegio(colegio)
      %Ecto.Changeset{data: %Colegio{}}

  """
  def change_colegio(%Colegio{} = colegio, attrs \\ %{}) do
    Colegio.changeset(colegio, attrs)
  end
end
