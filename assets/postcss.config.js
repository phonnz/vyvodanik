const purgecss = require('@fullhuman/postcss-purgecss')({
    content: [
        "../**/*.html.eex",
        "../**/*.html.leex",
        "../**/**/*.ex",
        "./js/**/*.js"
    ],
    safelist: [":hover", ":focus"],
    defaultExtractor: content => content.match(/[\w-/:]*(?<!:)/g) || []
})

module.exports = {
 plugins: [
     require("postcss-import"),
     require("tailwindcss"),
     require("autoprefixer"),
    //  purgecss
 ]

}