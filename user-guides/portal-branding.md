# Eurotermbank Toolkit branding

While setting up Portals frontend docker image, it is possible to mount a directory that will override nodes default visual settings.
Directory path to mount:
/usr/share/nginx/html/assets/
Mounted directory after mounting:
/usr/share/nginx/html/assets/overrides/

## Files to override

Summary of files that can be overridden:

- logo-ondark.svg
- logo-onlight.svg
- favicon.ico
- custom-style.css
- settings.json

### Logo and favicon

- logo on light background (Portal landing page)
- logo on dark background (All the other Portal pages except landing)
- favicon - small icon that is showed in the browsers tab next to title.


### Colors

If you put in overrides folder file custom-style.css, you can override main portal colors. Sample file contents are like this:

```css
:root {
  /* buttons, links, icons */
  --primary-color:   #1842B4;
  --primary-button-text-color:#fff;

  --primary-color-darker: #12338b; /* hovered button background color */
  --primary-button-hover-text-color: #fff; /* hovered button text color */


  /* search button */
  --search-button: #ffcc00;;
  --search-button-darker: #dbb003; /* hovered button background color */
  --src-icon-color: #fff; /* The color of search button loupe icon */

  --heading-text-color: #002382;  /* The color of title text */
}

```

This file contains css variable, that are referenced across portal.
Primary color is main accent color and is used in link, button and icon colors. To change its value just change its rgb hex value to something else. To pick the right color a tool like [htmlcolorcodes](https://htmlcolorcodes.com/) can be used.

Example:
```css
--primary-color:   #F2D3FD;
```

If you pick primary color thats contrast ratio with text on it is too low, you might want to change this color to some other than white:

```css
--primary-button-text-color:#BC00FF;
```

Text that is between /* and */ are comments and can be deleted

```
/* this is comment */
```

### Page title

If you put in overrides folder file settings.json, you can adjust your Portal node title that is shown in tab:

Example contents of file settings.json:
```json
{
  "Title": "My Open toolkit"
}
```

The effect of this override:
![Menu item management](img/portal-title.png "Menu item management")

### Toolkit analytics

It is possible to add either Google or Matomo page analytics.
To do that, you should add the following piece of code to the settings.json file.
### Google analytics
Please fill "tracking_code" with page code that you receive when register site in Google Analytics.

```json
  "analytics": {
    "tracker": "google_analytics",
    "google_analytics": {
      "tracking_code":""
    }
  }
```

## Matomo analytics
Please fill "tracker_url" and "site_id" with code that you receive when register site in Matomo Analytics.

```json
  "analytics": {
    "tracker": "matomo",
    "matomo": {
      "tracker_url": "",
      "site_id": ""
    }
  }
```

Example settings.json file that has Toolkit title set and Google analytics set up:
```json
{
  "Title": "My personal toolkit",
  "analytics": {
    "tracker": "google_analytics",
    "google_analytics": {
      "tracking_code":"U-12345"
    }
  }
}
```

## Troubleshooting

All the files should have __exact__ names as mentioned in files to override section.
To make sure, that overrides work, each of the overriden file should be accessible from web. For example, color overrides:
https://your-portal-node/assets/overrides/custom-style.css


If you are not sure about correctness of settings.json file, please run a linter, for example [JSONLint](https://jsonlint.com/)