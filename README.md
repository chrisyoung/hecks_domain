# 3DSL
A Domain Specific Language for generating Domain Driven Designs.

## WHY
* Independent of Frameworks. The architecture does not depend on the existence of some library of feature laden software. This allows you to use such frameworks as tools, rather than having to cram your system into their limited constraints.
* Testable. The business rules can be tested without the UI, Database, Web Server, or any other external element.
* Independent of UI. The UI can change easily, without changing the rest of the system. A Web UI could be replaced with a console UI, for example, without changing the business rules.
* Independent of Database. You can swap out Oracle or SQL Server, for Mongo, BigTable, CouchDB, or something else. Your business rules are not bound to the database.
* Independent of any external agency. In fact your business rules simply don’t know anything at all about the outside world.

## TODO
1. Commands should return self
1. Add Query interface
1. Create a facilitator app
1. What does a data port look like?
1. Make a Logger 'Driven'
1. DynamoDB Driver
1. Dynamic SQL Driver
1. Lambda Driver
1. Application Port
1. Hecks Domain Version in Domainfile
1. Domainfile instead of Hecksfile
1. Unit Tests for hecks domain
1. Unit Tests for hecksagaon
1. Rails Demo
1. Lean Coffee domain example
1. Move invariants check to command runner
1. Make a gem out of hecks domain
1. Soccer App project
1. Rewind commands
1. Replay commands
1. Value Store in Hecksagon
1. Break DomainObject template into Entity and Value
1. Generate a Java Domain
1. Rename SoccerSeason to Soccer
1. Fix Filehandling
1. Create automated build for examples
1. Generate a crud server (or make a generic one)
1. Play with including modules
1. Add Readme to all the projects
1. Generate a factory
1. Generate a command
1. How to do invariants to prevent a command from being called
1. Add default invariant module and default factory
