# Quiet Comic

A simple webcomic theme with pagination support for your comic pages and any related art.

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "quiet-comic"
```

Then copy the [theme's default `_config.yml`](https://github.com/tjjjwxzq/quiet-comic/blob/master/_config.yml) into your Jekyll site's `_config.yml`, and then execute:

    $ bundle

Or install it yourself as:

    $ gem install quiet-comic

## Usage

### Getting Started

This gem ships with a start-up script that copies over the following files and folders into your project directory:

```
+- _config.yml
+- _pages/
+- _artworks/
+- assets/
+- pages_feed.xml
+- artworks_feed.xml
+- combined_feed.xml
```
To run the script:

```bash
bundle exec quiet-comic-setup
```

This will give you a base config file to work out from, the necessary folders (with demo files) for your pages and artworks collection, some demo images in `assets` so you can see thumbnail generation (with `jekyll-minimagick`) in action, and the feed templates jekyll requires to build a pages, artworks, and combined feed.

You probably only want to run this script on a fresh project, because it may override any existing files and folders with the same name, that you may have modified/worked on, if you let it. But the script will prompt you before copying each file, so you can feel free to skip some files while copying over others, should you want to 'reset' any file after messing something up.

### Configuration
Please copy and paste the [theme's default `_config.yml` file](https://github.com/tjjjwxzq/quiet-comic/blob/master/_config.yml) into your own and customize any of the variables you wish (best to use the setup script as detailed in the previous section).

### Home Page
The home page of this theme expects a main image that will cover the whole screen (set by the `main_image` key in `_config.yml`). You can also a specify a mobile-optimized main image with the `mobile-main-image` key. If you leave it out it will default to whatever was set for `main_image`.

By default the header for this theme will include a brand image which links to the home page (if you set it in the `brand_image` key in `_config.yml`) on every page. If you don't want this to show up on the home page, set the following in the frontmatter of `index.md`:

```
---
is_home: true
---
```

If you don't set the `brand_image` key, a text link to the homepage will be rendered in the header.

### Layouts

The layouts are:

- `default.html` - base layout for all layouts. Sets the doctype, `<head>` element, and a header include.
- `home.html` - landing page with a full screen div for your beautiful cover art
- `page.html` - a single comic page
- `artwork.html` - a single artwork page
- `autopage_collection.html` - this is used by the AutoPages feature of the `jekyll-paginate-v2` gem to generate a paginated index for comic pages as well as artworks (or any collections you care to add to your website)
- `post.html` - a very minimal layout for blog posts. If you really want proper blog posts on your website, make sure to override and style this layout properly (blog posts are not the focus of this theme, however - jekyll just provides this functionality by default)

To override these layouts, create a `_layouts` directory and a new file with the name corresponding to the layout you want to override (eg. `_layouts/home.html`).

### Includes
- `head.html` - defines the `<head></head>` tag used in the `default` layout
- `seo.html` - bunch of tags for SEO included in `head.html`
- `header.html` - defines the site's main header with a responsive navbar
- `footer.html` - site's footer with author bio and social media links (links will show up only if you specify a link to your social media sites in `_config.yml`)
- `google-analytics` - code analytics inserted in the `default` layout (only active in production)
- `comments` - code for facebook comment box
- `facebook_javascript_sdk.html` - code for including the Facebook Javascript SDK in the `default` layout
- `collection_feed.xml` - used to generate an Atom feed for each of your collections. You need to create a `<collection>_feed.xml` in your root folder for the feed file to be generated

### Sass
To override the Sass in this theme, create a `_sass` directory and add your desired sass files. Then, create a `assets/main.scss` file and import your files as well as the theme's stylesheet:

```scss
@import 'myfile';
\\ ... import your sass files above to override theme defaults
@import 'quiet-comic';
```

### Collections

#### Pages
You should at minimum include the following font matter in your page:

```
---
page_number: 1
date: 'YYYY-MM-DD'
image: 'path/to/comic/strip/image'
---
```

Your pages will be sorted on the paginated index page (`/pages`) by the `page_number` variable so it must be included. Also, jekyll seems to set the `page.next` and `page-previous` using a default ordering based on date, is not configurable at the moment, so you should add a date if you want your next and prev links to work properly.

The `image` should be the path to the comic strip file itself, relative to the base image directory. The base image directory for comic pages is `<base_image_dir>/pages`. Since the default base image directory is `assets/images`, this will be `assets/images/pages`. If you would like to change the base directory name, you can set the following in your config:

```yaml
base_image_dir: '/new/path/to/images/directory'
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

The `image` should be the path to the artwork file itself, relative to the base image directory. The base image directory for artworks is `<base_image_dir>/artworks`. Since the default base image directory is `assets/images`, this will be `assets/images/pages`. If you would like to change the directory name, you can set the following in your config:

```yaml
base_image_dir: '/new/path/to/images/directory'
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

Note that if you change the source directories, you should also make the relevant changes to the `base_image_dir`.

### Feed
This theme uses the `jekyll-feed` gem to generate an Atom feed for your posts (`feed.xml`) (if you are running a blog alongside your web comic). However this gem does not support feed for collections.

This theme will create a feed for your comic pages (`pages_feed.xml`), artwork (`artwork_feed.xml`) and a combined feed for both (`combined_feed.xml`). The feed will sort your comic pages according to `page_number`, and your artworks according to `date` (so ensure that those variables are set in your frontmatter).

### Syntax Highlighting
This theme uses [rouge](https://github.com/jneen/rouge) for syntax highlighting (which is Jekyll's default highlighter). The syntax highlighting stylsheet uses the Zenburn theme. To override the theme, create a `_sass/syntax_highlighting.scss` file, put in your desired styles, and import it before the `quiet_comic` stylesheet in `assets/main.scss`. You can find other syntax highlighting styles here: [http://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html](http://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html).

### SEO
A set of meta tags for SEO are included in `<head></head>`. To see what's included, check out the source file `_includes/seo.html` (Do `bundle open quiet-comic` to open the gem source). Config that affects the output of these SEO tags can be found in `_config.yml`.

### Analytics
If you have a google analytics tracking ID, add it to your config, and then build your site in production to ensure the google analytics script is generated on your pages:

```
JEKYLL_ENV=production bundle exec jekyll build
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hello. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `quiet-comic.gemspec` accordingly.

### TODO
- [X] Write a setup script
- [] Figure out image thumbnails in feed
- [] Home page illustration
- [] Six Comic pages
- [] One artwork
- [] Support grouping pages into chapters

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
