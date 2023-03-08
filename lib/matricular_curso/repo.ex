defmodule MatricularCurso.Repo do
  use Ecto.Repo,
    otp_app: :matricular_curso,
    adapter: Ecto.Adapters.Postgres
end
