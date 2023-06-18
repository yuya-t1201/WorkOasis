module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
        "primary": "#fef3c7",
        "secondary": "#0891b2",
        "accent": "#155e75",
        "neutral": "#2b3440",
        "base-100": "#ffffff",
        "info": "#3abff8",
        "success": "#36d399",
        "warning": "#fbbd23",
        "error": "#f87272",
        },
      },
    ],
  },
  plugins: [
    require('daisyui')
  ]
};
