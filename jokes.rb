###############################################
# using the API https://sv443.net/jokeapi/v2/ #
###############################################
require 'httparty'

category = {
  programming: true,
  miscellaneous: true,
  dark: true
}

blacklist = {
  nsfw: true
  religious: true
  political: true
  racist: true
  sexist: true
}

#todo: dynamically generate this link based on true / false of above values
response = HTTParty.get('https://sv443.net/jokeapi/v2/joke/Programming,Miscellaneous,Dark?blacklistFlags=nsfw,religious,political,racist,sexist')

