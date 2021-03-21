defmodule DesafioElixir.Contratos.Rel_PJ do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contrato_rel_pessoa_juridica" do
    field :pessoa_juridica_id, :id
    field :contratos_id, :id

    #has_many :contratos, Contratos.Contrato
    #has_many :pessoas_juridicas, PessoasJuridicas.PessoaJuridica

    timestamps()
  end

  @doc false
  def changeset(rel_pj, attrs) do
    rel_pj
    |> cast(attrs, [])
    |> validate_required([])
  end
end
