# How can I stop OBS from silencing the output when I play back recording in VLC?

This happens because OBS is still monitoring the audio device. To prevent OBS from silencing VLC playback:

1. Exit OBS completely before playing back recordings in VLC
2. Alternatively, in OBS:
   - Go to Settings -> Audio
   - Set the monitoring device to "Disabled" or select a different output device
   - This will allow VLC to access the audio device without interference

Remember to re-enable your monitoring device in OBS when you want to record again.
