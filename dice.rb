require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# get('/') is supposed to be the webpage path of the ruby application
# Lines within quotes ("")are gonna be the raw html that the webpage will display

get("/") do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dicemenu")do
=begin
  "<style>
  .navbar {
    display: flex;
    justify-content: space-around;
  }
</style>
  <div class='navbar'>
  <div><a href='/dicemenu'>Home</a></div>
  <div><a href='/dice/2/6'>2d6</a></div>
  <div><a href='/dice/2/10'>2d10</a></div>
  <div><a href='/dice/1/20'>1d20</a></div>
  <div><a href='/dice/5/4'>5d4</a></div>
</div>
  <h1>Dice Rolling options menu</h1>
  <ul>
    <li><a href='/dice/2/6'>Roll two 6-sided dice</a></li>
    <li><a href='/dice/2/10'>Roll two 10-sided dice</a></li>
    <li><a href='/dice/1/20'>Roll one 20-sided dice</a></li>
    <li><a href='/dice/5/4'>Roll five 4-sided dice</a></li>
  </ul>"
=end
    erb(:dicemenu,{:layout => :header})
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	@rolls = []
  @rolls.push(first_die)
  @rolls.push(second_die)
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	@header1 = "2d6"

  erb(:generic, {:layout => :header})
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)

  sum = first_die + second_die

	@rolls = []
  @rolls.push(first_die)
  @rolls.push(second_die)

  @outcome = "A total of #{sum}."
  @header1 = "2d10"

  erb(:generic, {:layout => :header})
end

get("/dice/1/20") do
  @die = rand(1..20)
  
  @rolls = []
  @rolls.push(@die)
  
  @outcome = "You have rolled a a d20 dice and got #{@die}."
  @header1 = "1d20"

  erb(:one_twenty, {:layout => :header})
end

get("/dice/5/4") do
  @rolls = []
  sum = 0
  5.times do 
    die = rand(1..4)
    sum += die
    @rolls.push(die)
  end
  @header1 = "5d4"
  @outcome = "A grand total of #{sum}."

  erb(:generic, {:layout => :header})
end
