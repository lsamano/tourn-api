class Bracket < ApplicationRecord
  belongs_to :tournament
  belongs_to :node, optional:true
  # has_many :rounds

  def make_bracket(entrants)

  rounds = Math.log(2, entrants.length).ceil
  root_node = Node.create
  self.update(node_id: root_node.id)
  array = [root_node]
  def create_child_nodes(array, entrants)
    new_array = array.each_with_object([]) do |given_node, new_array|
      left_node = Node.create(parent_id: given_node.id)
      right_node = Node.create(parent_id: given_node.id)
      new_array << left_node
      new_array << right_node
    end

    if new_array.length >= entrants.length
      # .each over them to fill them with the entrants
      new_array.each do |node|
        node.update(name: entrants[0]["name"])
        node.update(team_id: entrants.shift()["id"])
      end
    else
      create_child_nodes(new_array, entrants)
    end
  end
  create_child_nodes(array, entrants)
end
end
