defmodule MatricularCurso.Cursos.Curso do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cursos" do
    field :descripcion, :string
    field :nombre_curso, :string
    field :numero_estudiantes, :integer
    field :nota, :float
    many_to_many :estudiantes, MatricularCurso.Estudiantes.Estudiante, join_through: "estudiantes_cursos"
    timestamps()
  end

  @doc false
  def changeset(curso, attrs) do
    curso
    |> cast(attrs, [:nombre_curso, :descripcion, :numero_estudiantes, :nota])
    |> validate_required([:nombre_curso, :descripcion, :numero_estudiantes, :nota])
    |> validate_length(:nombre_curso, min: 10, message: "el nombre del curso debe tener minimo 10 caracteres")
    |> unique_constraint(:nombre_curso, message: "el curso ya existe en la BD")
  end
end
