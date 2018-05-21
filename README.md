# Rogue Pod Interview Test

* User system is already in place with Devise

## Yarn

Yarn is needed.  To install yarn: [https://yarnpkg.com/en/docs/install]( https://yarnpkg.com/en/docs/install)

## Docker

Project can be ran with *Docker* and *Docker Compose*.

### Docker Compose Instructions

```
docker-compose build
docker-compose run --rm rails yarn install
docker-compose run --rm rails bundle install
docker-compose run --rm rails bundle exec rails db:migrate
docker-compose up
```

Then visit: `http://localhost:3000`

## Without Docker

```
yarn install
bundle install
bundle exec rails db:migrate
bundle exec rails s
```

Then visit: `http://localhost:3000`
