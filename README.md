There are currently no Oracle Instant Client built for Apple Silicon

On a Apple Silicon Mac, one workaround is to force a Terminal to run in Rosetta and installing node.

Confirm that node is running in x64 by running `node -p process.arch`

---

Connecting via the provided thin client results in `Error: NJS-500: connection to the Oracle Database was broken`

1. Download the Instant Client (Basic Light) and extract it in the directory of your choice (./lib/instantclient)
https://www.oracle.com/cis/database/technologies/instant-client/downloads.html

2. Configure orabledb to run in Thick mode by pointing to the Instant Client location
```
    oracledb.initOracleClient({
        libDir: process.env.PWD + '/lib/instantclient',
    })
```
