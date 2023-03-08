defmodule MatricularCurso.EstudiantesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MatricularCurso.Estudiantes` context.
  """

  @doc """
  Generate a estudiante.
  """
  def estudiante_fixture(attrs \\ %{}) do
    {:ok, estudiante} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        edad: 42,
        nombres: "some nombres",
        num_identi: "some num_identi"
      })
      |> MatricularCurso.Estudiantes.create_estudiante()

    estudiante
  end
end
