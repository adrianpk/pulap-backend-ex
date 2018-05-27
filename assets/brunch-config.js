exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      // joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      joinTo: {
        "js/app.js": /js/,
        "js/vendor.js": /(deps)|(vendor)/
      },
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "vendor/js/places.min.js",
      //     "vendor/js/search-places.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js"], //, "elm"

    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    // Standaby: Maybe will used in future admin app
    // elmBrunch: {
    //   mainModules: ["elm/Main.elm"],
    //   makeParameters: ["--debug"],
    //   outputFolder: "../assets/js"
    // },
    sass: {
      options: {
        includePaths: ["node_modules/bulma/sass"], // Tell sass-brunch where to look for files to @import
        precision: 8 // Minimum precision required by bootstrap-sass
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
      // "js/vendor.js": ["js/vendor"]
    }
  },

  npm: {
    enabled: true
    // whitelist: ['places.js'],
    // globals: {
    //   places: 'places.js'
    // }
  }
};
