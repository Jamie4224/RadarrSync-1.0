# UNSUPPORTED USE AT YOUR OWN RISK !!!
Should probably try the original https://github.com/Sperryfreak01/RadarrSync

# Credits
Thanks to https://github.com/Sperryfreak01/RadarrSync for the initial inspiration that lead to https://github.com/hjone72/RadarrSync MultiServer branch.

# RadarrSync
Syncs two Radarr servers through web API.  

### Why
Many Plex servers choke if you try to transcode 4K files. To address this a common approach is to keep a 4k and a 1080/720 version in separate libraries.

Radarr does not support saving files to different folder roots for different quality profiles.  To save 4K files to a separate library in plex you must run two Radarr servers.  This script looks for movies with a specific quality setting on one server and creates the movies on a second server.  


### Configuration
 1. Edit the Config.txt file and enter your servers URLs and API keys for each server.  

    Example Config.txt:
    ```ini
    [General]
    # Time to wait between adding new movies to a server. This will help reduce the load of the Sync server. 0 to disable. (seconds)
    wait_between_add = 5

    # Full path to log file
    log_path = ./Output.txt

    # DEBUG, INFO, VERBOSE | Logging level.
    log_level = DEBUG

    [RadarrMaster]
    url = http://127.0.0.1:7878
    key = XXXX-XXXX-XXXX-XXXX-XXXX

    [SyncServers]
    # Ensure the servers start with 'Radarr_'
    [Radarr_4k]
    url = http://127.0.0.1:7879
    key = XXXX-XXXX-XXXX-XXXX-XXXX

    # Only sync movies that are in these root folders. ';' (semicolon) separated list. Remove line to disable.
    rootFolders = /Movies

    # If this path exists
    current_path = /Movies/
    # Replace with this path
    new_path = /Movies4k/

    # This is the profile ID the movie will be added to.
    profileId = 5

    # This is the profile ID the movie must have on the Master server.
    profileIdMatch = 4
    ```
 2. Find the profileIdMatch on the Master server. Usually just count starting from Any: #1 SD: #2 etc.... IE: if you use the default HD-1080p proflie that would be #4.
 3. Change profileId configuration to what you want the profile to be on the SyncServer. In most cases you will want to use #5.


#### How to Run
Recomended to run using cron every 15 minutes or an interval of your preference.
```bash
python3 RadarrSync.py
```
To test without running use:
```bash
python3 RadarrSync.py --debug --whatif
```
#### Requirements
 -- Python 3.4 or greater
 -- 2 or more Radarr servers
