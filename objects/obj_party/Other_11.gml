/// @descr falando

talking = 0;
thatwriter = obj_writer_controller;
if (exists(thatwriter) == 1 && thatwriter.msg_talker[thatwriter.page] == id)
	talking = 1;