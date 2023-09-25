defmodule MatricularCurso.Estudiantes_CursosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MatricularCurso.Estudiantes_Cursos` context.
  """

  @doc """
  Generate a estudiante__curso.
  """
  def estudiante__curso_fixture(attrs \\ %{}) do
    {:ok, estudiante__curso} =
      attrs
      |> Enum.into(%{

      })
      |> MatricularCurso.Estudiantes_Cursos.create_estudiante__curso()

    estudiante__curso
  end
end
