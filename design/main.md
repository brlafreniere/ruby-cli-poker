# Considerations / Requirements

- Will it be necessary to store data between program invocations? Probably not.
- How many human players will there be? Probably just one for now.
- AI Players???

# Starting a new session / invoking the main program

When the user invokes the program, a new GameSession instance should be created.
This encapsulates everything that happens from program invocation to program
termination.

When the user starts a new GameSession, they should be prompted for how many AI
players they want to play against.

Also prompt the user for their name.