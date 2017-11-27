# Quiet Comic

A simple webcomic theme.

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "quiet-comic"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: quiet-comic
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quiet-comic

## Usage

### Layouts

The layouts are:

- `default.html` - base layout for all layouts. Sets the doctype, `<head>` element, and a header include.
- `home.html` - landing page with a full screen div for your beautiful cover art
- `pages.html` - index page for all your comic pages
- `page.html` - a single comic page
- `gallery.html` - index page for related artworks that are not pages in the comic (concept art, character art etc)
- `artwork.html` - a single artwork page

To override these layouts, create a `_layouts` directory and a new file with the name corresponding to the layout you want to override (eg. `_layouts/home.html`).

### Includes
- `head.html` - defines the `<head></head>` tag used in the `default` layout
- `header.html` - defines the site's main header with a responsive navbar
- `google-analytics` - inserts google analytics (only active in production)
- `facebook-comments` - code for facebook comment box


### Sass
To override the Sass in this theme, create a `_sass` directory and add your desired sass files. Then, create a `assets/main.scss` file and import your files as well as the theme's stylesheet:

```scss
@import 'myfile';
\\ ... import your sass files above to override theme defaults
@import 'quiet-comic';
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hello. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `quiet-comic.gemspec` accordingly.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
