defmodule MatricularCurso.ColegiosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MatricularCurso.Colegios` context.
  """

  @doc """
  Generate a colegio.
  """
  def colegio_fixture(attrs \\ %{}) do
    {:ok, colegio} =
      attrs
      |> Enum.into(%{
        ciudad: "some ciudad",
        nombre_colegio: "some nombre_colegio",
        numero_estudiantes: "some numero_estudiantes",
        tipo: "some tipo"
      })
      |> MatricularCurso.Colegios.create_colegio()

    colegio
  end
end
