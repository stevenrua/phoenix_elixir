defmodule MatricularCurso.Repo.Migrations.CreateColegios do
  use Ecto.Migration

  def change do
    create table(:colegios, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre_colegio, :string
      add :ciudad, :string
      add :numero_estudiantes, :string
      add :tipo, :string
      timestamps()
    end

    #mejor trabajar con unique
    #create index(:colegios, [ :nombre_colegio])
    create unique_index(:colegios, [:nombre_colegio])
  end
end
