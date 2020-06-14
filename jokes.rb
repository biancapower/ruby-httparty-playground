###############################################
# using the API https://sv443.net/jokeapi/v2/ #
###############################################
require 'httparty'

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

base_uri = 'https://sv443.net/jokeapi/v2/joke/'
#category_string = 'Programming,Miscellaneous,Dark'
category_string = ''
blacklist_string = 'nsfw,religious,political,racist,sexist'

category.each do | key, value |
  puts '#{key}: #{value}'
  if value
    category_string += key.to_s + ","
  end
end

category_string.delete_suffix!(',')
puts category_string

uri = base_uri + category_string + '?blacklistFlags=' + blacklist_string

#todo: dynamically generate this link based on true / false of above values
#response = HTTParty.get('https://sv443.net/jokeapi/v2/joke/Programming,Miscellaneous,Dark?blacklistFlags=nsfw,religious,political,racist,sexist')
response = HTTParty.get(uri)
p response.parsed_response['category']
p uri
