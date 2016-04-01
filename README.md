# Are you happy?

## Developer Setup

1. git clone git@github.com:rocketsofawesome/are_you_happy.git
2. cd are_you_happy
3. bundle
3. rake db:setup

Get rolling on Heroku:

0. Get yourself a [Flickr API key](https://www.flickr.com/services/api/misc.api_keys.html).
1. heroku create
2. git push heroku master
5. heroku run rake db:migrate
6. heroku config:add QUOTE_SOURCE="startrek+simpsons_ralph+simpsons_homer" FLICKR_API_KEY=XXXXXXX
6. heroku open
