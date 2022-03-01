# Fitnest

[fitnest-heroku.herokuapp.com](https://fitnest-heroku.herokuapp.com)

### About:
This repo was created as a final project for CTD Ruby on Rails (Red Eel) and subsequently refactored for the CTD RoR Practicum (Spring 2022).

This project was designed to help people find groups of people with similar fitness goals, in settings where groups are hard to find. 

### Contributors:
shylee873@gmail.com (admin)

kostik700015@gmail.com (collaborator)

jequel07@gmail.com (collaborator)

## Install

### Clone the repository:

```shell
https://github.com/ShyLee873/rails-final.git
cd rails-final
```

### Check your Ruby version:

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.1
```

### Install dependencies:

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle install
yarn install
```


### Initialize the database:

```shell
rails db:migrate 
```
contact shylee873@gmail.com for master.key or rake for new


## Local Server:

vagrant
```shell
bin/rails s -b 0.0.0.0
```

else
```shell
rails s 
```

