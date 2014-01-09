# Spacejam -- A simple tool to check on the status of a website

Spacejam is a ruby library for checking on the status of a website.
You can use it to check if a page or site is online. It's basically a
very simple wrapper around Curl. Here's how it works:

    require 'spacejam'

    Spacejam.online?('http://muffinlabs.com')
    => true


    x = Spacejam::HTTPCheck.new('http://muffinlabs.com')
    x.online?
    => true

Instead of just passing a URL, you can pass a URL and an expected
response code:

    x = Spacejam::HTTPCheck.new(url:'http://muffinlabs.com/missing_file.html', response_code:200)
    x.online?
    => false


You can also check non-200 response codes. Admittedly, looking for a
404 seems a little odd, but it still has it's uses.

    x = Spacejam::HTTPCheck.new(url:'http://muffinlabs.com/missing_file.html', response_code:404)
    x.online?
    => true

Or you can check the body content of the page:

    x = Spacejam::HTTPCheck.new(url:'http://muffinlabs.com/', body:"A string to check for")
    x.online?
    => true

Both body and response_code attributes can be a regex:

    x = Spacejam::HTTPCheck.new(
        url:'http://muffinlabs.com/',
        response_code:/20?/,
        body:/muffinlabs/)
    x.online?
    => true

If the request isn't successful, Spacejam can give you some
information about what went wrong via the **reason** attribute:

    x.reason
    => :response_code

The possible values are:
 * **:response_code** - an unexpected response code
 * **:body** - the body check failed
 * **:error** - a network/DNS error, etc. You would get this if the
     remote server was inaccessible or unresponsive.


## Installation

Add this line to your application's Gemfile:

    gem 'spacejam'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spacejam


## Contributing

Please do! Pull requests are welcomed.

## Copyright/License

Copyright (c) 2014 Colin Mitchell. MIT License. Keep Circulating The Tapes.

http://muffinlabs.com


