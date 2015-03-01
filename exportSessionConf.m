function exportSessionConf(sessionName)
%
% This function exports a configuration file for a session so
% that processing can be offloaded to a non-networked machine

% store these somewhere else though!
hostIP = '172.20.138.142';
user = 'dleventh';
password = 'amygdala_probe';
dbName = 'spikedb';

sqlArgs = {'hostip', hostIP, ...
            'user', user, ...
            'password', password, ...
            'dbname', dbName,
            'sqljava_version', ''
            };

[~, ratID] = sql_getSubjectFromSession(sessionName,sqlArgs{:});
disp(ratID);