defmodule MatricularCurso.EstudiantesTest do
  use MatricularCurso.DataCase

  alias MatricularCurso.Estudiantes

  describe "estudiantes" do
    alias MatricularCurso.Estudiantes.Estudiante

    import MatricularCurso.EstudiantesFixtures

    @invalid_attrs %{apellidos: nil, edad: nil, nombres: nil, num_identi: nil}

    test "list_estudiantes/0 returns all estudiantes" do
      estudiante = estudiante_fixture()
      assert Estudiantes.list_estudiantes() == [estudiante]
    end

    test "get_estudiante!/1 returns the estudiante with given id" do
      estudiante = estudiante_fixture()
      assert Estudiantes.get_estudiante!(estudiante.id) == estudiante
    end

    test "create_estudiante/1 with valid data creates a estudiante" do
      valid_attrs = %{apellidos: "some apellidos", edad: 42, nombres: "some nombres", num_identi: "some num_identi"}

      assert {:ok, %Estudiante{} = estudiante} = Estudiantes.create_estudiante(valid_attrs)
      assert estudiante.apellidos == "some apellidos"
      assert estudiante.edad == 42
      assert estudiante.nombres == "some nombres"
      assert estudiante.num_identi == "some num_identi"
    end

    test "create_estudiante/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Estudiantes.create_estudiante(@invalid_attrs)
    end

    test "update_estudiante/2 with valid data updates the estudiante" do
      estudiante = estudiante_fixture()
      update_attrs = %{apellidos: "some updated apellidos", edad: 43, nombres: "some updated nombres", num_identi: "some updated num_identi"}

      assert {:ok, %Estudiante{} = estudiante} = Estudiantes.update_estudiante(estudiante, update_attrs)
      assert estudiante.apellidos == "some updated apellidos"
      assert estudiante.edad == 43
      assert estudiante.nombres == "some updated nombres"
      assert estudiante.num_identi == "some updated num_identi"
    end

    test "update_estudiante/2 with invalid data returns error changeset" do
      estudiante = estudiante_fixture()
      assert {:error, %Ecto.Changeset{}} = Estudiantes.update_estudiante(estudiante, @invalid_attrs)
      assert estudiante == Estudiantes.get_estudiante!(estudiante.id)
    end

    test "delete_estudiante/1 deletes the estudiante" do
      estudiante = estudiante_fixture()
      assert {:ok, %Estudiante{}} = Estudiantes.delete_estudiante(estudiante)
      assert_raise Ecto.NoResultsError, fn -> Estudiantes.get_estudiante!(estudiante.id) end
    end

    test "change_estudiante/1 returns a estudiante changeset" do
      estudiante = estudiante_fixture()
      assert %Ecto.Changeset{} = Estudiantes.change_estudiante(estudiante)
    end
  end
end
