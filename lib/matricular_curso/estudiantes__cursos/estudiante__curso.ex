defmodule MatricularCurso.Estudiantes_Cursos.Estudiante_Curso do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "estudiantes_cursos" do

    belongs_to :estudiante, MatricularCurso.Estudiantes.Estudiante
    belongs_to :curso, MatricularCurso.Cursos.Curso

    timestamps()
  end

  @doc false
  def changeset(estudiante__curso, attrs) do
    estudiante__curso
    |> cast(attrs, [:estudiante_id, :curso_id])
    |> validate_required([])
  end
end
