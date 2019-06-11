# Jekyll Vibrantjs

Generate a set of CSS override rules from a template based on the prominent colors from a given image.

## Why?

Doesn't Vibrantjs have an in-browser library that can do all this in real time? Yes, but with Jekyll we have an opportunity to do all the work to generate the entire static site before even deploying it to the web. So if we're using these colors to theme static pages, why *wouldn't* we take advantage of that, rather than potentially putting all that work on the browser, eating up users' batteries, or even showing the un-themed version for a few seconds before processing is completed.

## Prerequisites

Requires `node-vibrant` installed (<https://github.com/akfish/node-vibrant/>).

### Installing `node-vibrant` in your jekyll project 

If you have an existing `package.json`, just add it there and run `npm install`. Otherwise, at the root level of your project, run `npm install node-vibrant` (and remember to add `node_modules` to your `.gitignore` file and check in the new `package-lock.json`).

## Installation

(https://jekyllrb.com/docs/plugins/installation/)

One of two options:

### Bundler Config
:warning: **If using bundler with a vendor prefix, this is the required method**

1. In your `Gemfile`, add the `jekyll_plugins` group if it doesn't already exist, and add `jekyll-vibrantjs` to it. For example: 

  ```ruby
  group :jekyll_plugins do
    gem "jekyll-vibrantjs"
  end
  ```

2. Tell bundler to install any plugins with

  ```
  $ bundle install
  ```


### Jekyll Config

1. In your `_config.yml`, add the `plugins` key if it doesn't already exist, and add a value of `jekyll-vibrantjs`. For example:

	```yaml
	plugins: 
	  - jekyll-vibrantjs
	```

2. Install this gem

  ```
  $ gem install jekyll-vibrantjs
  ```

## Usage

### Tag

Wherever you want to generate the set of CSS rules, add the `vibrantjs` tag with a path (relative to the Jekyll project root) to the image you want colors extracted from.

As a string:

```
{% vibrantjs "assets/img/mycoolphoto.jpg" %}
```

From frontmatter:

```
{% vibrantjs post.image.feature %}
```

Or just a variable:

```
{% assign the_image = "assets/pictures_of_butts/butt.png" %}
...
{% vibrantjs the_image %}
```

### CSS Output

At build time, this tag will be replaced with CSS using the colors extracted from the given image. The default CSS template will generate a style tag containing override (using `!important`) class rules for each of the six extracted colors to be used as a CSS `color` property or `background-color`, including `:hover` states. For example:

```html
<style type="text/css">
  /* background-color */
  .background-color-vibrant{ background-color: rgba(124, 76, 36, 1) !important; }
  .background-color-light-vibrant{ background-color: rgba(252, 252, 204, 1) !important; }
  .background-color-dark-vibrant{ background-color: rgba(4, 52, 100, 1) !important; }
  .background-color-muted{ background-color: rgba(104, 132, 164, 1) !important; }
  .background-color-light-muted{ background-color: rgba(190, 190, 157, 1) !important; }
  .background-color-dark-muted{ background-color: rgba(63, 63, 61, 1) !important; }
  /* background-color :hover */
  .hover-background-color-vibrant:hover{ background-color: rgba(124, 76, 36, 1) !important; }
  .hover-background-color-light-vibrant:hover{ background-color: rgba(252, 252, 204, 1) !important; }
  .hover-background-color-dark-vibrant:hover{ background-color: rgba(4, 52, 100, 1) !important; }
  .hover-background-color-muted:hover{ background-color: rgba(104, 132, 164, 1) !important; }
  .hover-background-color-light-muted:hover{ background-color: rgba(190, 190, 157, 1) !important; }
  .hover-background-color-dark-muted:hover{ background-color: rgba(63, 63, 61, 1) !important; }
  /* color */
  .color-vibrant{ color: rgba(124, 76, 36, 1) !important; }
  .color-light-vibrant{ color: rgba(252, 252, 204, 1) !important; }
  .color-dark-vibrant{ color: rgba(4, 52, 100, 1) !important; }
  .color-muted{ color: rgba(104, 132, 164, 1) !important; }
  .color-light-muted{ color: rgba(190, 190, 157, 1) !important; }
  .color-dark-muted{ color: rgba(63, 63, 61, 1) !important; }
  /* color :hover */
  .hover-color-vibrant:hover{ color: rgba(124, 76, 36, 1) !important; }
  .hover-color-light-vibrant:hover{ color: rgba(252, 252, 204, 1) !important; }
  .hover-color-dark-vibrant:hover{ color: rgba(4, 52, 100, 1) !important; }
  .hover-color-muted:hover{ color: rgba(104, 132, 164, 1) !important; }
  .hover-color-light-muted:hover{ color: rgba(190, 190, 157, 1) !important; }
  .hover-color-dark-muted:hover{ color: rgba(63, 63, 61, 1) !important; }
</style>
```

Use these classes in your HTML to dynamically change these colors for some particular image source.

### Custom Template

You can specify a custom template by adding a file named `_includes/vibrantjs-css.html` in your jekyll project. All six colors' rgb values (ex: `rgba(104, 132, 164, 1)`) are available as template variables with the prefix "rgb" to use like `{{ rgbDarkVibrant }}`.

### Colors

Six colors are available (see <https://jariz.github.io/vibrant.js/> for examples):

- Vibrant
- LightVibrant
- DarkVibrant
- Muted
- LightMuted
- DarkMuted
