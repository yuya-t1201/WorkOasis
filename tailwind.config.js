module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        main: ['Noto Serif JP', 'selif']
      },
      animation: {
        "text-focus-in": "text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530)   both"
      },
      keyframes: {
        "text-focus-in": {
          "0%": {
            filter: "blur(12px)",
            opacity: "0"
          },
          to: {
            filter: "blur(0)",
            opacity: "10"
          }

        }
      },
      colors: {
        red: {
          400: '#f87171'
        },
        green: {
          400: '#4ade80'
        }
      }
      
    }
  },
  daisyui: {
    themes: [
      {
        mytheme: {
        "primary": "#fef3c7",
        "secondary": "#607EAA",
        "accent": "#E8DFCA",
        "neutral": "#AEBDCA",
        "base-100": "##f43f5e",
        "info": "#3abff8",
        "success": "#36d399",
        "warning": "#fbbd23",
        "red": "#f43f5e",
        },
      },
    ],
  },
  plugins: [
    require('daisyui')
  ]
};
