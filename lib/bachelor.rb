require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |season_num, name|
    if season_num == season
      name.each do |status|
        if status.value?("Winner")
          return status["name"].split(" ").first
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.each do |stats|
      if stats["occupation"] == occupation
        return stats["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  hometown_nums = []
  data.collect do |season, info|
    info.collect do |stats|
      if stats["hometown"] == hometown
        i += 1
      end
    end
  end
  return i
end

def get_occupation(data, hometown)
  data.collect do |season, info|
    info.collect do |stats|
      if stats["hometown"] == hometown
        return stats["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_num, info|
    if season_num == season.to_s
      info.each do |age|
        ages << age.values[1].to_i
      end
    end
  end
  average = ages.flatten.compact.sum.to_f / ages.size
  average.round
end
