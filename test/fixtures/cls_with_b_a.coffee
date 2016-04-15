ext = require('../../lib/ext')

module.exports = class T extends ext(require('./super')).with(require('./mixin_b'), require('./mixin_a'))