# jsonapi-resources-study

* Ruby version: ruby 2.6.1p33
* Rails version: 5.2.2.1

## Description

Just a study project for Rails JsonAPI

## Run the Project

```console
git clone https://github.com/icehaku/jsonapi-resources-study.git
bundle install
rake db:migrate
```

# End Points

* Parse Pages
Sample with curl:
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"url-origin":"https://miguxos-land.herokuapp.com/"}}}' https://jsonapi-resources-study.herokuapp.com/pages

Here we gonna parse the site "https://miguxos-land.herokuapp.com/" via the url-origin field.

* List the Pages
curl -i -H "Accept: application/vnd.api+json" "https://jsonapi-resources-study.herokuapp.com/pages"


# Hosted Project on Heroku

If you don't want to run the project local(but if you want you can), you can try here.

https://jsonapi-resources-study.herokuapp.com/pages
