# YDTD Frontend Components

Frontend components for [YDTD](http://www.yourdaytheirday.com). A mixture of
Coffeescript, SASS and HTML partials which are used within the main application.
Created using middleman, imported into Rails as a gem.

## Integrating with a rails app

`YdtdFrontend::Engine` isn't currently hosted on rubygems. To install using
bundler you can include the git repository in your `Gemfile`:

```
gem 'ydtd_frontend', :git => 'https://github.com/madebymade/ydtd-frontend.git',
                     :tag => 'v0.0.9'
```

All the files within `app`, `lib` and `vendor` will now be included in your 
rails application.

## Developing

To view the styleguide or to develop new styles you can run the middleman app.
Run the following to boot it:

``` sh
bundle exec middleman -p 5000
```

## Credits

[![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)][made]

Developed and maintained by [Made][made]. Key contributions:

 * [Rory MacDonald](https://github.com/RoryMacDonald)
 * [Seb Ashton](https://github.com/SebAshton)
 * [Scott Mason](https://github.com/sowasred2012)
 * [Luke Morton](https://github.com/DrPheltRight)

## License

Copyright © 2012-2014 Made by Made Ltd. It is free software, and may be
redistributed under the terms specified in the [MIT-LICENSE][license] file.

[made]: http://www.madetech.co.uk?ref=github&repo=ydtd_frontend
[license]: https://github.com/madebymade/ydtd-frontend/blob/master/LICENSE
[travis]: https://travis-ci.org/madebymade/ydtd-frontend
