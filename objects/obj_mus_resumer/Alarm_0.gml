
active = 1;
targetvol = (global.volume[VOLUME_MUSIC] * global.volume[VOLUME_MASTER]);
audio_resume_sound(mymusic);
audio_sound_gain(mymusic, 0, 0);
audio_sound_gain(mymusic, targetvol, (mygain * 1000));