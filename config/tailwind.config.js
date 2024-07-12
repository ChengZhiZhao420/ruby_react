const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        darkorange: {
          DEFAULT: '#FF8C00', // Dark orange color
          light: '#FFA500',   // Lighter variant if needed
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    function ({ addUtilities }) {
      addUtilities(
        {
          '.disable-pointer-events': {
            'pointer-events': 'none',
          },
        },
        ['responsive', 'hover'] // Optionally add variants
      );
    },
  ]
}
