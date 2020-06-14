###############################################
# using the API https://sv443.net/jokeapi/v2/ #
###############################################
require 'httparty'
base_uri = 'https://sv443.net/jokeapi/v2/joke/'

# default values for category and blacklist
category = {
  programming: true,
  miscellaneous: true,
  dark: false,
}

blacklist = {
  nsfw: true,
  religious: true,
  political: true,
  racist: true,
  sexist: true,
}

# construct category_string
category_string = ''

category.each do | key, value |
  puts '#{key}: #{value}'
  if value
    category_string += key.to_s + ","
  end
end

category_string.delete_suffix!(',')
puts category_string

# construct blacklist_string
blacklist_string = ''

blacklist.each do | key, value |
  puts '#{key}: #{value}'
  if value
    blacklist_string += key.to_s + ","
  end
end

blacklist_string.delete_suffix!(',')
puts blacklist_string

# construct uri
uri = base_uri + category_string + '?blacklistFlags=' + blacklist_string

# get response from uri
response = HTTParty.get(uri)

# debug printing
p response.parsed_response['category']
p uri
