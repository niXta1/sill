# Timed background sessions on iPhone and iPad

The device can ask a capable Mac to hold its connection for 1, 3, 5 or 10 minutes, with 3 minutes selected initially. Off leaves the existing connection behavior in place. The Mac stops sending media and enforces the deadline while iOS is suspended. Returning or starting live Picture in Picture resumes the connection, refreshes the catalog and requests a keyframe. Force quitting or losing the transport ends that connection.

The compatibility checks cover malformed controls, duplicate holds, all four durations and returning on either side of expiry. A loopback check with two clients resumed the first on its original socket, received the catalog and a keyframe, and kept the second streaming. A separate one-minute hold sent the expiry notice and closed after 60.2 seconds, including a duplicate ten-minute request during the wait.
