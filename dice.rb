require "better_errors"
require "binding_of_caller"
require 'sinatra'
require 'sinatra/reloader'

use(BetterErrors::Middleware)
  BetterErrors.application_root = __dir__
  BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:home)
end

# 2 6-sided dice
get("/dice/2/6") do
  die1 = rand(1..6)
  die2 = rand(1..6)
  sum = die1 + die2

  @outcome = "You rolled a #{die1} and a #{die2} for a total of #{sum}."

  erb(:two_six)
end

# 2 10-sided dice
get("/dice/2/10") do
  die1 = rand(1..10)
  die2 = rand(1..10)
  sum = die1 + die2

  @outcome = "You rolled a #{die1} and a #{die2} for a total of #{sum}."

  erb(:two_ten)
end

# 1 20-sided dice
get("/dice/1/20") do
  die1 = rand(1..20)

  @outcome = "You rolled a #{die1}."

  erb(:one_twenty)
end

# 5 4-sided dice
get("/dice/5/4") do
  rolls = []

  5.times do
    rolls.push(rand(1..4))
  end

  @outcome = "You rolled " + rolls.map {|x| x.to_s}.join(", ") + " for a total of #{rolls.sum}."

  erb(:five_four)
end

# 100 6-sided dice
get("/dice/100/6") do
  @rolls = []

  100.times do
    @rolls.push(rand(1..6))
  end

  erb(:one_hundred_six)
end
