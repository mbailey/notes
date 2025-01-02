# How to record audio with OBS on macOS

To record audio in OBS on macOS:

1. Install BlackHole (virtual audio device):
```bash
brew install blackhole-2ch
```

2. Configure macOS Audio:
   - Open System Preferences > Sound
   - Set BlackHole 2ch as output device for the audio you want to capture

3. Configure OBS:
   - Add Audio Input Capture source
   - Select BlackHole 2ch as the Device
   - Add Desktop Audio source if you want system sounds

4. Test recording:
   - Play some audio
   - Check OBS audio meters are showing activity
   - Make a test recording

Note: You may want to use Audio MIDI Setup to create a Multi-Output Device if you want to hear the audio while recording.
