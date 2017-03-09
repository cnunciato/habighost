var path = require('path'),
  config;

module.exports = {
  production: {
    url: '{{cfg.url}}',
    mail: {{toJson cfg.mail}},
    database: {{toJson cfg.database}},
    paths: {
      contentPath: '{{pkg.svc_data_path}}'
    },
    database: {
      client: 'sqlite3',
      connection: {
        {{#if cfg.database.connection.filename}}
          filename: '{{cfg.database.connection.filename}}'
        {{/if}}
        {{#if cfg.database.connection.host}}
          host: '{{cfg.database.connection.host}}'
        {{/if}}
        {{#if cfg.database.connection.user}}
          user: '{{cfg.database.connection.user}}'
        {{/if}}
        {{#if cfg.database.connection.password}}
          password: '{{cfg.database.connection.password}}'
        {{/if}}
        {{#if cfg.database.connection.charset}}
          charset: '{{cfg.database.connection.charset}}'
        {{/if}}
      },
      debug: {{cfg.database.debug}}
    },
    server: {
      host: '{{cfg.server.ip}}',
      port: '{{cfg.server.port}}'
    }
  }
};
