defmodule MatricularCurso.CursosTest do
  use MatricularCurso.DataCase

  alias MatricularCurso.Cursos

  describe "cursos" do
    alias MatricularCurso.Cursos.Curso

    import MatricularCurso.CursosFixtures

    @invalid_attrs %{descripcion: nil, nombre_curso: nil, numero_estudiantes: nil}

    test "list_cursos/0 returns all cursos" do
      curso = curso_fixture()
      assert Cursos.list_cursos() == [curso]
    end

    test "get_curso!/1 returns the curso with given id" do
      curso = curso_fixture()
      assert Cursos.get_curso!(curso.id) == curso
    end

    test "create_curso/1 with valid data creates a curso" do
      valid_attrs = %{descripcion: "some descripcion", nombre_curso: "some nombre_curso", numero_estudiantes: 42}

      assert {:ok, %Curso{} = curso} = Cursos.create_curso(valid_attrs)
      assert curso.descripcion == "some descripcion"
      assert curso.nombre_curso == "some nombre_curso"
      assert curso.numero_estudiantes == 42
    end

    test "create_curso/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cursos.create_curso(@invalid_attrs)
    end

    test "update_curso/2 with valid data updates the curso" do
      curso = curso_fixture()
      update_attrs = %{descripcion: "some updated descripcion", nombre_curso: "some updated nombre_curso", numero_estudiantes: 43}

      assert {:ok, %Curso{} = curso} = Cursos.update_curso(curso, update_attrs)
      assert curso.descripcion == "some updated descripcion"
      assert curso.nombre_curso == "some updated nombre_curso"
      assert curso.numero_estudiantes == 43
    end

    test "update_curso/2 with invalid data returns error changeset" do
      curso = curso_fixture()
      assert {:error, %Ecto.Changeset{}} = Cursos.update_curso(curso, @invalid_attrs)
      assert curso == Cursos.get_curso!(curso.id)
    end

    test "delete_curso/1 deletes the curso" do
      curso = curso_fixture()
      assert {:ok, %Curso{}} = Cursos.delete_curso(curso)
      assert_raise Ecto.NoResultsError, fn -> Cursos.get_curso!(curso.id) end
    end

    test "change_curso/1 returns a curso changeset" do
      curso = curso_fixture()
      assert %Ecto.Changeset{} = Cursos.change_curso(curso)
    end
  end
end
