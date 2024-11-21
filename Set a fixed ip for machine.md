See the connection name:
Machine is connected with wifi. I will copy the uuid and modify the connection with the fixed ip.

```bash
nmcli con show
```

### Sample Output:

NAME                 UUID                                  TYPE      DEVICE
Connected, secured   321a11f2-958e-473a-b3b1-2e1ddbc33e0e  wifi      wlan0
lo                   aadd44d7-0d24-495a-af54-622ae765c81b  loopback  lo
TP-Link_Guest_0DF2   774af907-cd8c-4d64-9882-8f7f9bf20549  wifi      --
Wired connection 1   dff6338c-826a-31cc-83e4-1bd431b388c6  ethernet  --


Modify the Connection Using UUID

Run the following command, replacing the UUID with your connection's UUID if it's different.
```bash
sudo nmcli connection modify 321a11f2-958e-473a-b3b1-2e1ddbc33e0e \
ipv4.method manual \
ipv4.addresses "192.168.0.189/24" \
ipv4.dns "8.8.8.8 1.1.1.1" \
ipv4.never-default no
```
Advantages:

    Uniqueness: UUIDs are unique identifiers, eliminating ambiguity.
    Reliability: Less prone to errors due to naming discrepancies.

    Restart NetworkManager

Apply the changes by restarting the NetworkManager service.

```bash
sudo systemctl restart NetworkManager
```