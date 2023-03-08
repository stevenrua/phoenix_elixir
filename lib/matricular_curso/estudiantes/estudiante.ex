defmodule MatricularCurso.Estudiantes.Estudiante do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "estudiantes" do
    field :apellidos, :string
    field :edad, :integer
    field :nombres, :string
    field :num_identi, :string
    has_many :cursos, MatricularCurso.Cursos.Curso
    timestamps()
  end

  @doc false
  def changeset(estudiante, attrs) do
    estudiante
    |> cast(attrs, [:num_identi, :nombres, :apellidos, :edad])
    |> validate_required([:num_identi, :nombres, :apellidos, :edad])
    |> validate_length(:num_identi, min: 10, message: "número de identificación solo tiene 10 digitos")
    |> unique_constraint(:num_identi, message: "Estudiante ya existe en DB")
  end
end
