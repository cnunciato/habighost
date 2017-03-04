var path = require('path'),
  config;

module.exports = {
  production: {
    url: '{{cfg.url}}',
    mail: {{toJson cfg.mail}},
    database: {
      client: 'sqlite3',
      connection: {
        filename: '{{pkg.svc_data_path}}/ghost.db'
      },
      debug: false
    },

    server: {
      host: '{{cfg.server.ip}}',
      port: '{{cfg.server.port}}'
    }
  }
};
