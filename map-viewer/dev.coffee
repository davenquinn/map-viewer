gulp = require "gulp"

# Define a new `reload` task in Gulp that simply refreshes the current page
gulp.task 'reload', ->
    # Log that we're reloading the app
    console.log 'Reloading app...'
    # Clear and delete node-webkit's global required modules cache.
    # See: http://stackoverflow.com/q/25143532/
    for module_name, module of global.require.cache
        delete global.require.cache[module_name]
    # Refresh the page
    window.location.reload()

# Set Gulp to watch all files, and reload the page when it detects a change.
gulp.watch '**/*.coffee', ['reload']
