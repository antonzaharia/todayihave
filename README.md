# TODAY I HAVE

#### A Ruby on Rails application designed to connect people within the company, so that they can tell each other about what they have been working on, on a daily basis.

Things you may want to cover:

- Ruby version `3.1.2`

## Install

- Clone the repository

```
git clone git@bitbucket.org:vpcltd/today-i-have.git
cd project
```

- Check your Ruby version

```
ruby -v
```

- Install the right version of Ruby if required

```
rbenv install 3.1.2
```

## Install dependencies

- Using Bundle and yarn

```
bundle && yarn
```

## Initialize the database

```
rails db:create db:migrate
```

## Install Redis

```
<!-- For Mac -->
brew install redis
```

## Start the server

```
bin/dev
```

And visit [https://localhost:3000](https://localhost:3000)
