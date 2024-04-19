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
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
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
  <h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
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
  <h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  die = rand(1..20)

  outcome = "You have rolled a a d20 dice and got #{die}."

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
  <h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  die1 = rand(1..4)
  die2 = rand(1..4)
  die3 = rand(1..4)
  die4 = rand(1..4)
  die5 = rand(1..4)
  sum = die1 + die2 + die3 + die4 + die5

  outcome = "You have rolled #{die1}, #{die2}, #{die3}, #{die4}, and #{die5} for a grand total of #{sum}."

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
  <h1>5d4</h1>
  <p>#{outcome}</p>"
end
