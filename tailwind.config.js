module.exports = {
  content: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("daisyui"),
  ],
  daisyui: {
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "night",
  },
};
