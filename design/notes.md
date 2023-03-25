# Spec Roadmap

- [ ] GameSession
  - [x] #start
    - [x] prompt/initialize human player (name)
    - [x] prompt/initialize AI players (how many)
    - [x] start the first round

# Design Notes

## Considerations / Requirements

- Will it be necessary to store data between program invocations? Probably not.
- How many human players will there be? Probably just one for now.
- AI Players???

## Starting a new session / invoking the main program

When the user invokes the program, a new GameSession instance should be created.
This encapsulates everything that happens from program invocation to program
termination.

When the user starts a new GameSession, they should be prompted for how many AI
players they want to play against.

Also prompt the user for their name.

## Form of poker to be used for this application: five-card draw

"Five Card Draw is one of the most common variations of poker, and is the type
of poker that is often played at home among friends. Because it is the simplest
form of poker, this is where a lot of players start out. Here is a run-down on
how this game works."

1. Five cards are dealt to each player
2. A round of betting follows
3. Next, each player has the opportunity to either “stand pat”, which means they keep all five of their cards, or to get rid of up to three cards, which will be replaced by another three cards
4. Another round of betting takes place
5. Hands are revealed. This is what we call the Showdown
6. The player with the highest hand wins the pot
7. The pot is transferred to the player who won
8. At the end of the round, check: is human player out of money? did all the AI
players lose? if either of these conditions are true, the game is over, and a
winner is declared.
9. If neither of those conditions are true, ask the player if they want to play
another round, start another round if yes, exit the program if no.

## Handling starting money / the pot

How are chips/money handled? Perhaps each player starts with a certain amount of
chips, and chips carry over each round, and then... you win if you won all the
chips, and you lose if you run out of chips?

- Perhaps at the beginning of the session, each player is giving a set amount of
chips, like 100 chips or something, and that's all you get until the game is
over. I like that idea.