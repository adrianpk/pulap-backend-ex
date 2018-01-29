defmodule PulapWeb.ProfileView do
  use PulapWeb, :view
  alias PulapWeb.ProfileView

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, ProfileView, "profile.json")}
  end

  def render("show.json", %{profile: profile}) do
    %{data: render_one(profile, ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    %{id: profile.id,
      id: profile.id,
      property_set_name: profile.property_set_name,
      name: profile.name,
      email: profile.email,
      description: profile.description,
      bio: profile.bio,
      moto: profile.moto,
      website: profile.website,
      anniversary_date: profile.anniversary_date,
      avatar_path: profile.avatar_path,
      avatar: profile.avatar,
      header_path: profile.header_path,
      header: profile.header,
      cards: profile.cards,
      annotations: profile.annotations,
      geolocation: profile.geolocation,
      is_active: profile.is_active,
      is_logical_deleted: profile.is_logical_deleted}
  end
end
