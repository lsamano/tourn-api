class PendingSentRequestSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :logo, :team_id

  # Grabs team name of the sent request
  def team_name
    object.team.name
  end

  # Grabs team logo of the sent request
  def logo
    object.team.logo
  end

  # Grabs team id of the sent request
  def team_id
    object.team.id
  end
end
