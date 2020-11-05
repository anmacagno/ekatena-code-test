# Ekatena Code Test

This steps are necessary to get the application up and running.

### Prerequisites

- Ruby 2.7.0
- Rails 6.0.3
- PostgreSQL

### Check out the repository

```bash
$ git clone https://github.com/anmacagno/ekatena-code-test.git
```

### Dependencies

```bash
$ bundle install
```

### Create and setup the database

```bash
$ rails db:create
$ rails db:setup
```

### Run the test suite

```bash
$ bundle exec rspec
```

### Run the synchronization script

For the correct execution of the script it is necessary to be authenticated on the site https://www.poderjudicialvirtual.com/entrar.

Below are 4 invalid cases and 2 valid cases:

```bash
$ rake record:synchronize
$ rake record:synchronize[]
$ rake record:synchronize['']
$ rake record:synchronize['test']
$ rake record:synchronize['mn-banco-santander-mexico-s-a--banco-santander-mexico']
$ rake record:synchronize['df-trejo-bouquet-jacqueline-del-carmen--nueva-wal-mart-de-mexico-s-de-r-l-de-c-v-y-servicios-adminis-26/2020']
```
