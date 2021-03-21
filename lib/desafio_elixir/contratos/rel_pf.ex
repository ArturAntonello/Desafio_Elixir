defmodule DesafioElixir.Contratos.Rel_PF do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contrato_rel_pessoa_fisica" do
    field :pessoa_fisica_id, :id
    field :contratos_id, :id

    #has_many :contratos, Contratos.Contrato
    #has_many :pessoas_fisicas, PessoasFisicas.PessoaFisica

    timestamps()
  end

  @doc false
  def changeset(rel_pf, attrs) do
    rel_pf
    |> cast(attrs, [])
    |> validate_required([])
  end
end
