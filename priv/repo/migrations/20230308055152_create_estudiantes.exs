defmodule MatricularCurso.Repo.Migrations.CreateEstudiantes do
  use Ecto.Migration

  def change do
    create table(:estudiantes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_identi, :string
      add :nombres, :string
      add :apellidos, :string
      add :edad, :integer

      timestamps()
    end

    create unique_index(:estudiantes, [:num_identi])

  end
end
