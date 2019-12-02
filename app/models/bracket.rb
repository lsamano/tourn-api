class Bracket < ApplicationRecord
  belongs_to :tournament
  belongs_to :node, optional: true
  # has_many :rounds

  def make_bracket(entrants)

    # This determines number of rounds, but is not used anywhere
    rounds = Math.log(2, entrants.length).ceil

    # Makes root_node, places it in an array
    root_node = Node.create
    self.update(node_id: root_node.id)
    array = [root_node]

    # defines creation of child nodes
    def create_child_nodes(array, entrants)
      # Of a given round (array), create next round (new_array)
      # with the entrants provided
      new_array = array.each_with_object([]) do |given_node, new_array|
        left_node = Node.create(parent_id: given_node.id)
        right_node = Node.create(parent_id: given_node.id)
        new_array << left_node
        new_array << right_node
      end

      ### BASE CASE
      # If the latest round includes as many or more nodes as there are entrants
      if new_array.length >= entrants.length
        # .each over them to fill them with the shuffled entrants
        shuffled_entrants = entrants.shuffle
        new_array.each do |node|
          node.update(name: shuffled_entrants[0]["name"])
          node.update(team_id: shuffled_entrants.shift()["id"])
        end
      else
        # Recursively create next round of Nodes
        create_child_nodes(new_array, entrants)
      end
    end

##############################################################

    def create_next_round(array, entrants)
      # Of a given round (array), create next round (new_array)
      # with the entrants provided
      new_array = array.each_with_object([]) do |given_node, new_array|
        left_node = Node.create(parent_id: given_node.id)
        right_node = Node.create(parent_id: given_node.id)
        new_array << left_node
        new_array << right_node
      end

      ### BASE CASE
      if new_array.length * 2 > entrants.length
        ## If the next round would include more nodes than needed,
        # Make only one more round on some nodes

        remaining_num_of_nodes_needed = new_array.length * 2 - entrants.length
        remaining_num_of_matches_to_create = remaining_num_of_nodes_needed / 2

        shuffled_entrants = entrants.shuffle

        if remaining_num_of_matches_to_create <= new_array.length / 2
          new_array.each_with_index do |node, index|
            if index % 2 == 0
              entrant = shuffled_entrants.shift()
              node.update(name: entrant["name"])
              node.update(team_id: entrant["id"])
            end
            break if shuffled_entrants.length == 0
          end
        else
          # need logic for handling more than half the extra matches
          # some matches/groups will be complete
        end

      elsif new_array.length == entrants.length
        ## If the current round has exactly enough nodes,
        # .each over them to fill them with the shuffled entrants
        shuffled_entrants = entrants.shuffle
        new_array.each do |node|
          node.update(name: shuffled_entrants[0]["name"])
          node.update(team_id: shuffled_entrants.shift()["id"])
        end
      else
        # Recursively create next round of Nodes
        create_next_round(new_array, entrants)
      end
    end

##############################################################


    # see above for definition (line 16)
    create_child_nodes(array, entrants)
  end
end
