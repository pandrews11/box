# Box

[![Build Status](https://travis-ci.org/pandrews11/box.svg?branch=master)](https://travis-ci.org/pandrews11/box)

To Login:
```ruby
user = Box::User.login 'my_email@xyz.com', 'my_password'
```

To get a list of your stations:
```ruby
user.stations
```

To get the names of the next 4 songs for a certain station:
```ruby
user.stations.first.playlist.map &:song_name
```