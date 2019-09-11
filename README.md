# HECKS DOMAIN
A Domain Specific Language for generating Domain Driven Designs.

## WHY
`Independent of Frameworks.` The architecture does not depend on the existence of some library of feature laden software. This allows you to use such frameworks as tools, rather than having to cram your system into their limited constraints.

`Testable.` The business rules can be tested without the UI, Database, Web Server, or any other external element.

`Independent of UI.` The UI can change easily, without changing the rest of the system. A Web UI could be replaced with a console UI, for example, without changing the business rules.
 
`Independent of Database.` You can swap out Oracle or SQL Server, for Mongo, BigTable, CouchDB, or something else. Your business rules are not bound to the database.

`Independent of any external agency.` In fact your business rules simply don’t know anything at all about the outside world.

## DDD Patterns

#### Aggregates

`Matches::Match`

#### Repositories

`Matches::Match::Repository`

##### Heads

`Matches::Head`

#### Entities

#### Values

#### Factories
```
> Matches::Match::Factories::Default#factory

# or

> Matches::Match.default
```

#### Events
##### Subscribers

#### Commands
/matches/match/commands/add_goal.rb
```
> SoccerSeason::Domain::Matches::Match::Commands::AddGoal
> match.add_goal!
```

#### Queries

#### Services

## TODO

### High Priority
1. Generate Build factories (rename default to build)
1. Helpers to work with repository, i.e. object.save
1. Generate spec files for commands

### Backlog
1. Values are immutable, so provide equality
1. Option to ignore commmands that already exist when generating
1. Clean up event handlers to make more sense
1. Hecks Domain Version in Domainfile
1. Create automated build for examples
1. Make a binary for running CLI
1. Generate initial Readme
1. Generate a factory
1. Clean up filemaker
1. Break DomainObject template into Entity and Value
1. Rewind commands
1. Replay commands
1. Unit Tests
1. Rename SoccerSeason to Soccer
1. Generate a Java Domain
