@echo off
COLOR 17

echo Created by Cracko298 (Phinehas Beresford).
echo.
echo Icon Used: https://www.graphicsfuel.com/2010/11/wooden-speakers-psd-icons/
echo.
echo Make sure your music file(s) is in the same directory as the Music Player.
echo Then press any key.
echo.
@pause
cls

echo.
echo A = Playlist Options.
echo.
echo L = Load Last Manually Typed In Song.
echo.
echo T = Type In The Song Name Manually.
echo.


:choice
set /P c=What Module Would You Like To Load? [A/L/T]:
if /I "%c%" EQU "l" goto :yes
if /I "%c%" EQU "L" goto :yes
if /I "%c%" EQU "T" goto :no
if /I "%c%" EQU "t" goto :no
if /I "%c%" EQU "A" goto :add
if /I "%c%" EQU "a" goto :add
goto :choice

:add
cls
echo.
echo A = Adding Songs To Playlist.
echo.
echo L = Load Playlist.
echo.
:choice

set /P c=Are you loading a song or adding songs to a playlist? [A/L]:
if /I "%c%" EQU "A" goto :y
if /I "%c%" EQU "a" goto :y
if /I "%c%" EQU "l" goto :n
if /I "%c%" EQU "L" goto :n
goto :choice

:y
echo.
echo Paste the song File names you want to add to the Playlist. (Add up to 3 songs, Do NOT include the extension).
set /P songname0=
set /P songname1=
set /P songname2=
cls

(
  echo %songname0%
  echo %songname1%
  echo %songname2%
) > playlist.dat
goto :teleport

:n
:teleport
cls
< playlist.dat (
  set /p songname0=
  set /p songname1=
  set /p songname2=
)
goto :mp3play

:no
cls
echo Type In The Song's File Name Below. Do NOT include the extension.
set /P songname=

(
  echo %songname%
) > latestsong.dat

:yes

< latestsong.dat (
  set /p songname=
)

echo Loading %songname%
echo Successfully Loaded %songname%
echo.
echo Click any button to play "%songname%"

@pause
cls

echo Now Playing %songname%...
echo.
echo Enjoy Your Tunes.
echo.
echo Cool Fact: You Can Close The App And Play Music In the Background.
echo.
set "file=%songname%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music_data.vbs
start /min music_data.vbs

@pause

COLOR 07

exit

:mp3play
cls
echo Now Playing %songname0%...
echo.
echo Enjoy Your Tunes.
echo.
echo Cool Fact: This was actually made as a side project in school.
echo.
set "file=%songname0%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music_data0.vbs
start /min music_data0.vbs

SLEEP 261

cls
echo Now Playing %songname1%...
echo.
echo Enjoy Your Tunes.
echo.
echo Cool Fact: The .mp3 formatt was actually made in Germany to have several bitrates in one audio file.
echo.
set "file=%songname1%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music_data1.vbs
start /min music_data1.vbs

SLEEP 261

cls
echo Now Playing %songname2%...
echo.
echo Enjoy Your Tunes.
echo.
echo Cool Fact: An average human can only hear up to 320kbps. And a very rare majority can hear around 380kbps.
echo.
set "file=%songname2%.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >music_data2.vbs
start /min music_data2.vbs

SLEEP 261

COLOR 07

exit