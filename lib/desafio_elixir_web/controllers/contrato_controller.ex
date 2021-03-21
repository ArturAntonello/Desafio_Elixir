defmodule DesafioElixirWeb.ContratoController do
  use DesafioElixirWeb, :controller

  alias DesafioElixir.Contratos
  alias DesafioElixir.Contratos.Contrato
  alias DesafioElixir.Contratos.Rel_PF
  alias DesafioElixir.Contratos.Rel_PJ

  action_fallback DesafioElixirWeb.FallbackController

  def index(conn, _params) do
    contratos = Contratos.list_contratos()
    render(conn, "index.json", contratos: contratos)
  end

  def create(conn, %{"contrato" => contrato_params, "pessoa_fisica" => pessoa_fisica_params,"pessoa_juridica" => pessoa_juridica_params}) do
    with {:ok, %Contrato{} = contrato} <- Contratos.create_contrato(contrato_params) do
      #Após criar contrato, criar os relacionamentos com Rel_PF/Rel_PJ
      #pessoa_fisica_params = lista de ids de PFs
      #pessoa_juridica_params = lista de ids de PJ

      #Contratos.create_rel_pf(pessoa_fisica_params, contrato.id)
      #Contratos.create_rel_pj(pessoa_juridica_params, contrato.id)

      #Retorna json do contrato
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.contrato_path(conn, :show, contrato))
      |> render("show.json", contrato: contrato)
    end
  end

  def show(conn, %{"id" => id}) do
    contrato = Contratos.get_contrato!(id)
    render(conn, "show.json", contrato: contrato)
  end

  def update(conn, %{"id" => id, "contrato" => contrato_params}) do
    contrato = Contratos.get_contrato!(id)

    with {:ok, %Contrato{} = contrato} <- Contratos.update_contrato(contrato, contrato_params) do
      render(conn, "show.json", contrato: contrato)
    end
  end

  def delete(conn, %{"id" => id}) do
    contrato = Contratos.get_contrato!(id)

    with {:ok, %Contrato{}} <- Contratos.delete_contrato(contrato) do
      send_resp(conn, :no_content, "")
    end
  end
end
