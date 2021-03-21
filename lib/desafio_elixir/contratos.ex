defmodule DesafioElixir.Contratos do
  @moduledoc """
  The Contratos context.
  """

  import Ecto.Query, warn: false
  alias DesafioElixir.Repo

  alias DesafioElixir.Contratos.Contrato
  alias DesafioElixir.Contratos.Rel_PF
  alias DesafioElixir.Contratos.Rel_PJ

  @doc """
  Returns the list of contratos.

  ## Examples

      iex> list_contratos()
      [%Contrato{}, ...]

  """
  def list_contratos do
    Repo.all(Contrato)
  end

  @doc """
  Gets a single contrato.

  Raises `Ecto.NoResultsError` if the Contrato does not exist.

  ## Examples

      iex> get_contrato!(123)
      %Contrato{}

      iex> get_contrato!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contrato!(id), do: Repo.get!(Contrato, id)

  @doc """
  Creates a contrato.

  ## Examples

      iex> create_contrato(%{field: value})
      {:ok, %Contrato{}}

      iex> create_contrato(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contrato(attrs \\ %{}) do
    %Contrato{}
    |> Contrato.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Cria um relacionamento entre contrato e PF para cada PF da lista
  """

  def create_rel_pf(attrs \\ %{}, contrato_id) do
    #%Contrato{}
    #|> Contrato.changeset(attrs)
    #|> Repo.insert()

    %Rel_PF{}
    |> Rel_PF.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Cria um relacionamento entre contrato e PJ para cada PJ da lista
  """

  def create_rel_pj(attrs \\ %{}, contrato_id) do
    #%Contrato{}
    #|> Contrato.changeset(attrs)
    #|> Repo.insert()

    %Rel_PJ{}
    |> Rel_PJ.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contrato.

  ## Examples

      iex> update_contrato(contrato, %{field: new_value})
      {:ok, %Contrato{}}

      iex> update_contrato(contrato, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contrato(%Contrato{} = contrato, attrs) do
    contrato
    |> Contrato.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contrato.

  ## Examples

      iex> delete_contrato(contrato)
      {:ok, %Contrato{}}

      iex> delete_contrato(contrato)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contrato(%Contrato{} = contrato) do
    Repo.delete(contrato)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contrato changes.

  ## Examples

      iex> change_contrato(contrato)
      %Ecto.Changeset{data: %Contrato{}}

  """
  def change_contrato(%Contrato{} = contrato, attrs \\ %{}) do
    Contrato.changeset(contrato, attrs)
  end
end
