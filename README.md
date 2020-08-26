# Zabbix template for monitoring PHP-FPM status



## User Guide

### Enable PHP-FPM status page.

Change php-fpm configration file and apply the changes.

```bash
$ sudo vim /path/to/php-fpm.conf
pm.status_path = /phpfpm_status
# restart php-fpm 
```

Include [nginx.conf](https://github.com/luohu1/zabbix-template-phpfpm/blob/master/nginx.conf#L1-L17)  to your nginx configuration file and reload nginx server.

Ensure it works.

```bash
$ curl -s http://127.0.0.1/phpfpm_status
pool:                 www
process manager:      dynamic
start time:           17/May/2019:14:54:02 +0530
start since:          886617
accepted conn:        1619617
listen queue:         0
max listen queue:     0
listen queue len:     0
idle processes:       28
active processes:     1
total processes:      30
max active processes: 31
max children reached: 0
slow requests:        0
```

### Setup zabbix_agentd 

Copy `userparameter_phpfpm.conf` to zabbix_agentd sub configuration directory such as `/etc/zabbix_agentd.conf.d` and restart zabbix_agentd.  
Copy `phpfpm_status.sh` to `${basedir}/scripts/` and add execution permissions to the file.  


Request Zabbix UI to configuration the template and link it to hosts.

- Import `Template_App_phpfpm_3.0.xml`.  [zabbix doc](https://www.zabbix.com/documentation/current/manual/xml_export_import/templates)
- Link template to hosts.  [zabbix doc](https://www.zabbix.com/documentation/current/manual/config/templates/linking)

### Done



