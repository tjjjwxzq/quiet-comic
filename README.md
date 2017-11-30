# Quiet Comic

A simple webcomic theme with pagination support for you comic pages and any related art (that isn't part of the comic itself).

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

### Collections

#### Pages
You can name your pages something like`<page number>-<title>.<extension>`. Alternatively, you can do something like `<date>-<title>.<extension>` similar to how you would name a jekyll post. Or actually, name them however you like, because your pages are going to be sorted by the `page_number` field specified in your front matter anyway.

You should at minimum include the following font matter in your page:

```
---
page_number: 1
image: 'path/to/comic/strip/image'
---
```

The `page_number` will be displayed on the page itself, and, depending on your config, in the pages index on the thumbnail for that page (see how to generate your thumbnail images [here](#thumbnails)).

The `image` should be the path to the comic strip file itself, relative to the base image directory. The default base image directory for comic pages is `assets/images/pages` directory. If you would like to change the directory name, you can set the following in your config:

```yaml
pages_image_dir: '/new/path/to/images/directory'
```

You can optionally include a `title`, `date` key (it's recommended), and this will be displayed on the page alongside the `page_number`.

You can specify whether you want the thumbnail label to show the `page_number` or the `title` by setting the following key in your `_config.yml` (`page_number` is the default):

```yaml
thumbnail_label: "page_number" # or "title"
```

Likewise, you can specify whether the feed `<title></title>` tag in each feed `<entry>` should show the `page_number` or the `title` by setting the following in your `_config.yml` (`page_number` is the default):

```yaml
feed_label: "page_number" # or title
```

Note that if you don't have a `title` key specified in your frontmatter, the `page.title` variable defaults to the name of your file (which may or may not be what you expect).

##### Chapters

#### Artworks
Your frontmatter should at minimum include:

```
---
title: Some title
date: YYYY-MM-DD
image: "path/to/image/file"
---
```

The date is required to sort your artworks in chronological order (when displayed in the gallery page as well as in the feed). Note that it must be written in the `YYYY-MM-DD` ISO 8601 format for it to be recognized as a `Date` by Jekyll (or it will end up a string and sorting won't work as expected).

The `image` should be the path to the comic strip file itself, relative to the base image directory. The default base image directory for artworks is `assets/images/artworks` directory. If you would like to change the directory name, you can set the following in your config:

```yaml
artworks_image_dir: '/new/path/to/images/directory'
```

### <a name="thumbnails">Thumbnails</a>

This theme uses the `jekyll-minimagick` gem to automatically generate thumbnails for your comics or artworks based on your supplied configuration. By default you should put your comic page images into `assets/images/pages` and your artwork images into `assets/images/artworks`, and the thumbnails will be generated in the `assets/images/pages/thumbnails` and `assets/images/artworks/thumbnails` directories respectively. If you would like to change the default config, you can edit the `mini_magick` key in `_config.yml`:

```yaml
# jekyll-minimagick config
mini_magick:
  pages_thumbnails:
    source: "assets/images/pages"
    destination: "assets/images/pages/thumbnails"
    crop: "300x300+0+0"
  artworks_thumbnails:
    source: "assets/images/artworks"
    destination: "assets/images/artworks/thumbnails"
    crop: "300x300+0+0"
```

(For the `crop` option, the value must be of the form `width x height + x-offset + y-offset`. The offsets are mandatory, or minimagick will throw an error)

Note that if you change the source directories, you should also make the relevant changes to the `base_image_dir`, `pages_image_dir` and `artworks_image_dir`.

### Feed
This theme uses the `jekyll-feed` gem to generate an Atom feed for your posts (if you are running a blog alongside your web comic). However this gem does not support feed for collections.

This theme will create a feed for your comic pages (`pages/feed.xml`) as well as artwork (`artwork/feed.xml`). The feed will sort your comic pages according to `page_number`, and your artworks according to `date` (so ensure that those variables are set in your frontmatter).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hello. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `quiet-comic.gemspec` accordingly.

### TODO
1. Figure out image thumbnails in feed

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
