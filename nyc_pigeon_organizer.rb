require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def names(data)
  array = []
  data.each do |attrb, details|
    details.each do |key, values|
      values.each do |v|
        array.push(v)
      end
    end
  end
  array.uniq!
  array
end

def nyc_pigeon_organizer(data)
  new_hash = {}
  names(data).each do |name|
    new_hash[name] = {:color => [], :gender => [], :lives => []}
  end
  data.each do |attrb, details|
    if attrb == :gender
      details.each do |key, values|
        values.each do |v|
          new_hash[v][:gender].push(key.to_s)
        end
      end
    elsif attrb == :lives
      details.each do |key, values|
        values.each do |v|
          new_hash[v][:lives].push(key)
        end
      end
    else
      details.each do |key, values|
        values.each do |v|
          new_hash[v][:color].push(key.to_s)
        end
      end
    end
  end
  new_hash
end