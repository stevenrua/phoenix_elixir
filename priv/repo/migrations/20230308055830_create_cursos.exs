defmodule MatricularCurso.Repo.Migrations.CreateCursos do
  use Ecto.Migration

  def change do
    create table(:cursos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre_curso, :string
      add :descripcion, :string
      add :numero_estudiantes, :integer
      add :estudiante_id, references(:estudiantes, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:cursos, [:estudiante_id, :nombre_curso])
  end
end
