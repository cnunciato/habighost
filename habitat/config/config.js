var path = require('path'),
    config;

config = {
    production: {
        url: '{{cfg.url}}',
        mail: {},
        database: {
            client: 'sqlite3',
            connection: {
                filename: './content/data/ghost.db'
            },
            debug: false
        },

        server: {
            host: '{{cfg.ip}}',
            port: '{{cfg.port}}'
        }
    }
};

module.exports = config;
