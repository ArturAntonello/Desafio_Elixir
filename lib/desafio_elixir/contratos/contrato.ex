defmodule DesafioElixir.Contratos.Contrato do
  use Ecto.Schema
  import Ecto.Changeset

  alias DesafioElixir.Contratos.{Rel_PF, Rel_PJ}

  schema "contratos" do
    field :data, :string
    field :descricao, :string
    field :nome, :string
    field :pdf, :string

    #belongs_to :contrato_rel_pessoa_fisica, Rel_PF
    #belongs_to :contrato_rel_pessoa_juridica, Rel_PJ
    #many_to_many :pessoas_juridicas, DesafioElixir.PessoasJuridicas.PessoaJuridica, join_through: "contrato_rel_pessoa_juridica"

    timestamps()
  end

  @required_fields [:nome, :data, :pdf]
  @optional_fields [:descricao]

  @doc false
  def changeset(contrato, attrs) do
    contrato
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
