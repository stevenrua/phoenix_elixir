defmodule MatricularCurso.Estudiantes_CursosTest do
  use MatricularCurso.DataCase

  alias MatricularCurso.Estudiantes_Cursos

  describe "estudiantes_cursos" do
    alias MatricularCurso.Estudiantes_Cursos.Estudiante_Curso

    import MatricularCurso.Estudiantes_CursosFixtures

    @invalid_attrs %{}

    test "list_estudiantes_cursos/0 returns all estudiantes_cursos" do
      estudiante__curso = estudiante__curso_fixture()
      assert Estudiantes_Cursos.list_estudiantes_cursos() == [estudiante__curso]
    end

    test "get_estudiante__curso!/1 returns the estudiante__curso with given id" do
      estudiante__curso = estudiante__curso_fixture()
      assert Estudiantes_Cursos.get_estudiante__curso!(estudiante__curso.id) == estudiante__curso
    end

    test "create_estudiante__curso/1 with valid data creates a estudiante__curso" do
      valid_attrs = %{}

      assert {:ok, %Estudiante_Curso{} = estudiante__curso} = Estudiantes_Cursos.create_estudiante__curso(valid_attrs)
    end

    test "create_estudiante__curso/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Estudiantes_Cursos.create_estudiante__curso(@invalid_attrs)
    end

    test "update_estudiante__curso/2 with valid data updates the estudiante__curso" do
      estudiante__curso = estudiante__curso_fixture()
      update_attrs = %{}

      assert {:ok, %Estudiante_Curso{} = estudiante__curso} = Estudiantes_Cursos.update_estudiante__curso(estudiante__curso, update_attrs)
    end

    test "update_estudiante__curso/2 with invalid data returns error changeset" do
      estudiante__curso = estudiante__curso_fixture()
      assert {:error, %Ecto.Changeset{}} = Estudiantes_Cursos.update_estudiante__curso(estudiante__curso, @invalid_attrs)
      assert estudiante__curso == Estudiantes_Cursos.get_estudiante__curso!(estudiante__curso.id)
    end

    test "delete_estudiante__curso/1 deletes the estudiante__curso" do
      estudiante__curso = estudiante__curso_fixture()
      assert {:ok, %Estudiante_Curso{}} = Estudiantes_Cursos.delete_estudiante__curso(estudiante__curso)
      assert_raise Ecto.NoResultsError, fn -> Estudiantes_Cursos.get_estudiante__curso!(estudiante__curso.id) end
    end

    test "change_estudiante__curso/1 returns a estudiante__curso changeset" do
      estudiante__curso = estudiante__curso_fixture()
      assert %Ecto.Changeset{} = Estudiantes_Cursos.change_estudiante__curso(estudiante__curso)
    end
  end
end
