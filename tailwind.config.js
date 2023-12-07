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
        "text-focus-in": "text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530)   both",
        "heartbeat": "heartbeat 1.5s ease  infinite both"
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

        },
        "heartbeat": {
          "0%": {
            transform: "scale(1)",
            "transform-origin": "center center",
            "animation-timing-function": "ease-out"
          },
          "10%": {
            transform: "scale(.91)",
            "animation-timing-function": "ease-in"
          },
          "17%": {
            transform: "scale(.98)",
            "animation-timing-function": "ease-out"
          },
          "33%": {
            transform: "scale(.87)",
            "animation-timing-function": "ease-in"
          },
          "45%": {
            transform: "scale(1)",
            "animation-timing-function": "ease-out"
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
