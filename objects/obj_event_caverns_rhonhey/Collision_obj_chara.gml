chara_change(-1, 0, 0, 0, 0, 0, 1);
chara_stop();
surprise(obj_chara);
audio_play(snd_surprise, 0, VOLUME_SOUND);
alarm[2] = 45;
con = 1;