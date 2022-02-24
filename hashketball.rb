require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
## following expect :home or :away as param
def team_name(home_or_away) #string
  game_hash[home_or_away][:team_name]
end

def players(home_or_away) #array
  game_hash[home_or_away][:players]
end

def colors(home_or_away) #array
  game_hash[home_or_away][:colors]
end

def num_points_scored(player_input)
  game_hash.values.each {|team|
    team[:players].each {|player|
      if player[:player_name] == player_input
        return player[:points]
      end
    }
  }
end
num_points_scored("Reggie Evans")

def shoe_size(name_to_search)
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:player_name] == name_to_search
      return player[:shoe]
      end
    end
  end
end

def team_colors(team_name_input)
  game_hash.values.each do |team|
    if team[:team_name] == team_name_input
      return team[:colors]
    end
  end
end

def team_names
  # names = []
  # game_hash.values.each do |team|
  #   names << team[:team_name]
  # end
  # return names

  game_hash.values.map do |team|
    team[:team_name]
  end

end
team_names

def player_numbers(team_to_search)
  # jerseys = []
  # game_hash.values.each do |team|
  #   if team[:team_name] == team_to_search
  #     team[:players].each do |player|
  #       jerseys << player[:number]
  #     end
  #   end
  # end
  # return jerseys

  game_hash.values.each do |team|
    if team[:team_name] == team_to_search
      return team[:players].map { |player| player[:number] }
    end
  end

end

def player_stats(name_to_search)
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:player_name] == name_to_search
        return player
      end
    end
  end
end

def big_shoe_rebounds
  # my first attack was to push all the player hashes into a new single layer array, 
  # sort in place, then get the largest shoe - see below for a nicer example
  # all_players=[]
  # game_hash.values.each do |team|
  #   team[:players].each do |player|
  #     all_players << player
  #   end
  # end
  # all_players.sort_by! { |player| player[:shoe] }
  # # binding.pry
  # return all_players[-1][:rebounds]


  #adam larosa's version which is cooler and more expandable
  the_brain = {shoe_size: 0}

  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:shoe] > the_brain[:shoe_size]
        the_brain[:shoe_size] = player[:shoe]
        the_brain[:player] = player
      end
    end
  end
  the_brain[:player][:rebounds]

end
big_shoe_rebounds

# player_numbers("Brooklyn Nets")
# binding.pry
  
# binding.pry
0