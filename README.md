## MongoDb widget for Dashing

[Dashing](http://shopify.github.com/dashing) widget to display [mongodb](http://www.mongodb.com/) server status.

![](https://raw.githubusercontent.com/amalfra/dashing-mongo/master/screenshot.png)

## Dependencies

[mongodb ruby driver](https://github.com/mongodb/mongo-ruby-driver)

Add it to dashing's gemfile:

    gem 'mongo'

and run `bundle install`.

## Usage

1. copy `mongo_clients.coffee`, `mongo_clients.html`, `mongo_clients.scss` into the `/widgets/mongo_clients` directory of your Dashing app.

2. copy `mongo_network.coffee`, `mongo_network.html`, `mongo_network.scss` into the `/widgets/mongo_network` directory of your Dashing app.

3. Copy the `mongo.rb` file into your `/jobs` folder.

4. copy `mongo-background.png` into your `/assets/images/` folder

5. Now copy over the `mongo.yml` into the root directory of your Dashing application. Be sure to replace the following options inside of the config file:

```
:mongo_host: 'localhost'
:mongo_username: 'your username'
:mongo_password: 'your password'
```
*Remove ```mongo_username``` and ```mongo_password``` if you don't have authentication.*

Then include the widget in a dashboard, by adding the following snippet to your dashboard layout file:

* For the Mongo clients widget:
```html
    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
        <div data-id="mongo_connected_clients" data-view="MongoClients" data-title="MongoDb clients"></div>
    </li>
```

* For the Mongo network info widget:
```html
    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
        <div data-id="mongo_network_info" data-view="MongoNetwork" data-title="MongoDb network"></div>
    </li>
```

## Development

Questions, problems or suggestions? Please post them on the [issue tracker](https://github.com/amalfra/dashing-mongo/issues).

You can contribute changes by forking the project and submitting a pull request. Feel free to contribute :heart_eyes:

UNDER MIT LICENSE
=================

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
