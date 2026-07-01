
for (var i = 0; i < global.music_length; i++)
{
	music_audio[i] = -1;
	music_paused[i] = 0;
	music_playing[i] = 0;
	music_timeplaying[i] = 0;
}

for (var i = 0; i < 99; i++)
{
	music_fadingaudio[i] = -1;
}

paused = 0;

b = 0
dongs = 0

/*
thisold = -1;
postbattle_audiopos[0] = 0;
postbattle_audiopos[1] = 0;
*/