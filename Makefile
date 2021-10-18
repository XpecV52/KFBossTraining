system = ../System

all: clean
	$(system)/UCC.exe make

clean:
	rm -f $(system)/KFBossTraining.*
	rm -f $(system)/steam_appid.txt
