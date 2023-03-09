defmodule MatricularCurso.ColegiosTest do
  use MatricularCurso.DataCase

  alias MatricularCurso.Colegios

  describe "colegios" do
    alias MatricularCurso.Colegios.Colegio

    import MatricularCurso.ColegiosFixtures

    @invalid_attrs %{ciudad: nil, nombre_colegio: nil, numero_estudiantes: nil, tipo: nil}

    test "list_colegios/0 returns all colegios" do
      colegio = colegio_fixture()
      assert Colegios.list_colegios() == [colegio]
    end

    test "get_colegio!/1 returns the colegio with given id" do
      colegio = colegio_fixture()
      assert Colegios.get_colegio!(colegio.id) == colegio
    end

    test "create_colegio/1 with valid data creates a colegio" do
      valid_attrs = %{ciudad: "some ciudad", nombre_colegio: "some nombre_colegio", numero_estudiantes: "some numero_estudiantes", tipo: "some tipo"}

      assert {:ok, %Colegio{} = colegio} = Colegios.create_colegio(valid_attrs)
      assert colegio.ciudad == "some ciudad"
      assert colegio.nombre_colegio == "some nombre_colegio"
      assert colegio.numero_estudiantes == "some numero_estudiantes"
      assert colegio.tipo == "some tipo"
    end

    test "create_colegio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Colegios.create_colegio(@invalid_attrs)
    end

    test "update_colegio/2 with valid data updates the colegio" do
      colegio = colegio_fixture()
      update_attrs = %{ciudad: "some updated ciudad", nombre_colegio: "some updated nombre_colegio", numero_estudiantes: "some updated numero_estudiantes", tipo: "some updated tipo"}

      assert {:ok, %Colegio{} = colegio} = Colegios.update_colegio(colegio, update_attrs)
      assert colegio.ciudad == "some updated ciudad"
      assert colegio.nombre_colegio == "some updated nombre_colegio"
      assert colegio.numero_estudiantes == "some updated numero_estudiantes"
      assert colegio.tipo == "some updated tipo"
    end

    test "update_colegio/2 with invalid data returns error changeset" do
      colegio = colegio_fixture()
      assert {:error, %Ecto.Changeset{}} = Colegios.update_colegio(colegio, @invalid_attrs)
      assert colegio == Colegios.get_colegio!(colegio.id)
    end

    test "delete_colegio/1 deletes the colegio" do
      colegio = colegio_fixture()
      assert {:ok, %Colegio{}} = Colegios.delete_colegio(colegio)
      assert_raise Ecto.NoResultsError, fn -> Colegios.get_colegio!(colegio.id) end
    end

    test "change_colegio/1 returns a colegio changeset" do
      colegio = colegio_fixture()
      assert %Ecto.Changeset{} = Colegios.change_colegio(colegio)
    end
  end
end
