import sys
import os
import subprocess 

# for yt music

PLAYER_NAME = "chromium"


def getPlayerName() -> str:
    res = subprocess.run(['playerctl','--list-all'], stdout=subprocess.PIPE ,stderr=subprocess.PIPE)
    f = res.stdout
    for i in f.decode("utf-8").split("\n"):
     if i.startswith(PLAYER_NAME):
      return i
      
    return "0"

def next(): 
    player = getPlayerName()
    os.system("playerctl -p " + player + " next")

def playPause():
    player = getPlayerName()
    os.system("playerctl -p " + player + " play-pause")

def previous():
    player = getPlayerName()
    os.system("playerctl -p " + player + " previous")

def get():
    player = getPlayerName()
    status = subprocess.run(['playerctl','--player='+ player,'status'], stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.decode("utf-8")
    if status != "Playing\n" and status != "Paused\n" :
        print("")
        return
    title = subprocess.run(['playerctl','--player='+ player,'metadata', 'title' ], stdout=subprocess.PIPE).stdout.decode("utf-8")
    artist = subprocess.run(['playerctl','--player='+ player,'metadata', 'artist' ], stdout=subprocess.PIPE).stdout.decode("utf-8")
    # os.system("echo " + artist + " - " + title)
    
    print(artist[:len(artist)-1] +" - " + title)


if __name__=="__main__":
    if sys.argv[1] == "get":
        get()
    if sys.argv[1] == "next":
        next()
    if sys.argv[1] == "play_pause":
        playPause()
    if sys.argv[1] == "previous":
        previous()

