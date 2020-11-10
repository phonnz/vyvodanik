module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    extend: {
      colors: {
        'vyvo': {
          50: '#F3FAFB',
          100: '#E7F6F8',
          200: '#C3E8ED',
          300: '#9FDBE3',
          400: '#57BFCD',
          500: '#0FA4B8',
          600: '#0E94A6',
          700: '#09626E',
          800: '#074A53',
          900: '#053137',
          },
      }
    }
  },
  variants: {
    zIndex: ['responsive', 'hover', 'focus', 'group-hover'],
    textColor: ['responsive', 'hover', 'focus', 'group-hover'],
    underline: ['responsive', 'hover', 'focus', 'group-hover'],
  },
  plugins: [],
}
