# README
## System Dependencies
- Ruby 3.0.2
- Postresql 13.0
## Development Setup
1. Install Postgresql and create `perx` role with password
   - In `psql` console: `CREATE USER perx WITH CREATEDB;`
2. Git clone this repository
3. `bundle install`
4. `rails db:create` 
5. `rails db:migrate`
6. `rails db:seed`
7. `rake db:setup`<br>
to update the data base with sample data
## Running Dev Server
`rails server`
## Running Tests
`rspec` to run the test scripts to reduce the issues
## Services
- Cron Job `bundle exec whenever` for running scheduled jobs
  Reference https://github.com/javan/whenever
## Git flow
A standard flow would go like this:
1. Create a separate working branch (ideally indicate the intent in the name such as fix/feature/refactor/hotfix)
2. After developing merge the working branch to the develop branch which will trigger deployment to staging environment
3. Test on staging and get the requester sign-off
4. Once the code is production-ready create a new PR from the same working branch but set the base branch as main.
5. In case of any conflicts resolve them by merging main into the working branch and of course resolving the remaining conflicts if any
6. Request review