# Question and Answer Web app
This is example question and answer web app, basicly using rubyonrails and mongodb.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
- rvm for install ruby version
- nodejs
- mongodb

```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
- install rvm (\curl -sSL https://get.rvm.io | bash -s stable)
- install nodejs (https://nodejs.org/en/download/)
- install mongodb (https://www.mongodb.com)
```

After installing:
- run mongod, to run mongodb
- run gem install bundler
- bundle and rake db:seed
- and setup rails server

to manage question
```
-- go to admin (your_local_url/admin)
-- get http auth (user: admin, password: admin)
```

## Running the tests

```
rspec spec
```

## Authors

* **Deden Ari Januar** - *Ruby on Rails Geekers* - [PurpleBooth](https://github.com/dedennufan)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
