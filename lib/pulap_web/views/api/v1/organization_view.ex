defmodule PulapWeb.API.V1.OrganizationView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.OrganizationView

  def render("index.json", %{organizations: organizations}) do
    %{data: render_many(organizations, OrganizationView, "organization.json")}
  end

  def render("show.json", %{organization: organization}) do
    %{data: render_one(organization, OrganizationView, "organization.json")}
  end

  def render("organization.json", %{organization: organization}) do
    %{
      id: organization.id,
      owner_username: organization.owner_username,
      name: organization.name,
      description: organization.description,
      card: organization.card,
      annotations: organization.annotations,
      organizations: organization.organizations,
      started_at: organization.started_at,
      is_active: organization.is_active,
      default: organization.default,
      is_logical_deleted: organization.is_logical_deleted
    }
  end
end
