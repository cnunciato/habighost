var path = require('path'),
  config;

module.exports = {
  production: {
    url: '{{cfg.url}}',
    mail: {{toJson cfg.mail}},
    paths: {
      contentPath: '{{pkg.svc_data_path}}'
    },
    database: {
      client: '{{cfg.database.client}}',
      connection: {
        {{#if cfg.database.connection.filename}}
          filename: '{{pkg.svc_data_path}}/data/{{cfg.database.connection.filename}}',
        {{/if}}
        {{#if cfg.database.connection.host}}
          host: '{{cfg.database.connection.host}}',
        {{/if}}
        {{#if cfg.database.connection.user}}
          user: '{{cfg.database.connection.user}}',
        {{/if}}
        {{#if cfg.database.connection.password}}
          password: '{{cfg.database.connection.password}}',
        {{/if}}
        {{#if cfg.database.connection.database}}
          database: '{{cfg.database.connection.database}}',
        {{/if}}
        {{#if cfg.database.connection.charset}}
          charset: '{{cfg.database.connection.charset}}',
        {{/if}}
      },
      debug: {{cfg.database.debug}}
    },
    server: {
      host: '{{cfg.server.host}}',
      port: '{{cfg.server.port}}'
    }
  }
};
