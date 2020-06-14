require 'httparty'

# Use the class methods to get down to business quickly
response = HTTParty.get('https://pokeapi.co/api/v2/pokemon/1')
#response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=1&offset=200')

### get the value of the key "count"
# puts response["count"]

### create an array of keys
#p response.keys

### iterate over a hash
#response.each do | key, value |
#  puts "#{key}: #{value}"
#end

abilities = response["abilities"]
name = response["species"]["name"]

puts "#{name.capitalize}'s abilties:"

for ability in abilities
  puts "• " + ability["ability"]["name"]
end
