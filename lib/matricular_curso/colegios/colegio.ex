defmodule MatricularCurso.Colegios.Colegio do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "colegios" do
    field :ciudad, :string
    field :nombre_colegio, :string
    field :numero_estudiantes, :string
    field :tipo, :string
    has_many :estudiantes, MatricularCurso.Estudiantes.Estudiante
    timestamps()
  end

  @doc false
  def changeset(colegio, attrs) do
    colegio
    |> cast(attrs, [:nombre_colegio, :ciudad, :numero_estudiantes, :tipo])
    |> validate_required([:nombre_colegio, :ciudad, :numero_estudiantes, :tipo])
  end
end
