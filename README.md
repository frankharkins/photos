# Photo page

Source code for https://frankharkins.github.io/photos. Also a way for me to
experiment with Elm.

## Build the project

```sh
elm make src/Main.elm --output=static/main.js
```

Or, rebuild on file change:

```sh
while inotifywait -e close_write src/*; do elm make src/Main.elm --output=static/main.js; done
```

## Add files to the page

1. Export as AVIF from Darktable
2. Run from root of repo:
   ```sh
   ./import-image.sh <path-to-file>
   ```
3. Add new entry in `src/Data.elm`


## To do

* Accessibility / keyboard navigation
