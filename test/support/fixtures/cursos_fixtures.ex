defmodule MatricularCurso.CursosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MatricularCurso.Cursos` context.
  """

  @doc """
  Generate a curso.
  """
  def curso_fixture(attrs \\ %{}) do
    {:ok, curso} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        nombre_curso: "some nombre_curso",
        numero_estudiantes: 42
      })
      |> MatricularCurso.Cursos.create_curso()

    curso
  end
end
