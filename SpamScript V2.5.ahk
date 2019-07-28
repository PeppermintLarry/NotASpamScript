;				****************************************************************
;				*															   *
;				*						 Spam Script By 					   *
;				*						Peppermint Larry					   *
;				*															   *
;				****************************************************************



#include tf.ahk
#NoEnv
#SingleInstance Force
#Warn
SetWorkingDir %A_ScriptDir%
Gui -MaximizeBox
firstcheck := 1
setupexit := 0
unin := 0
spamtoggle := 1
gname := "Not A Spam Script V2.5"
message := ""

CONST_GNAME := "Not A Spam Script V2.5"
CONST_BCOLOR := 555555


;	First time setup, could be better done but is the safest in my opinion.
IfNotExist, default.txt
{
	IfNotExist, racism.txt
	{
		IfNotExist, compliments.txt
		{
			IfNotExist, facts.txt
			{
				IfNotExist, copypasta.txt
				{
					IfNotExist, bitly.txt
					{
						IfNotExist, preferences.txt
						{
							IfNotExist, VoCoPaste.txt
							{
								SetTimer, ChangeInstallNames, 50
								Msgbox, 1, First Time Setup, Hello and thank you for installing Peppermint Larrys Spam Script.`n The script is ready to perform first time setup and create a parent folder for the script and its related files (Which are neccesary).`n`n Once setup is complete you will have to relaunch the script and I would suggest pressing the Help, Explanations, and Warning buttons.`n Additionally, the default keybinds are Delete to close the script, and End to spam (These can be changed in the preferences.txt that will be created and I'm working to add something in the GUI to do this).`n`n Any person who wishes to use the script may but please dont redistribute via uploading the script instead of sending the download link. Anybody may also look to & edit the source code to their wishes just as long as proper credit is given (Any modifications will almost guaranteed not be put into the public release and is more a personal thing for anybody who decides to make any). Redistribution via selling either modified or not is strictly prohibited, nobody can make a single penny off this shitty spaghetti code.`n Additionally, Larry would be immensely grateful if anybody who wants to make videos/posts about this script did and he is willing to work with anybody who wants to create anything, other than code, for this script you can reach him at http://steamcommunity.com/id/PeppermintLarry2.`n Anything to spread it would be awesome!`n`n Enjoy your script! (And don't worry your anti-virus should only go off once for each version but you can whitelist the folder if the few seconds scan is too much)
								IfMsgBox, OK
								{
									FileCreateDir, SpamScript
									Sleep, 100
									FileMove, SpamScript V2.5.exe, SpamScript, 1
									Sleep, 100
									SetWorkingDir %A_ScriptDir%
									firstcheck := 0
									setupexit := 1
									Goto, customcheck
								}
								IfMsgBox, Cancel
								{
									Exitapp
								}
							}
						}
					}
				}
			}
		}
	}
}

;	Loading/checking preferences
;	The script will refuse to even load the GUI without preferences.txt being present with the right values in the right places.
IfNotExist, preferences.txt
{
	Msgbox, 1, Error, [ERROR] Preferences.txt either does not exist or in not in the correct directory! Preferences.txt is required for the script to function properly, do you want a default one to be created now?
	IfMsgBox, OK
	{
		SS_DownloadTxt("preferences.txt", "https://pastebin.com/vSTwxndy")
		Msgbox, 0, Success, Preferences.txt has been created successfully.
	}
	IfMsgBox, Cancel
	{
		Exitapp
	}
}

;	Preference settings being loaded, the whole "plain text saved in a .txt" setup is REALLY bad form normally but because of the purposeful customization of these I can get away with making my job easier.
FileReadLine, spamkey, preferences.txt, 4
FileReadLine, killkey, preferences.txt, 6
FileReadLine, togglekey, preferences.txt, 8
FileReadLine, pBackround, preferences.txt, 10
FileReadLine, pName, preferences.txt, 12
FileReadLine, pSspeed, preferences.txt, 14
FileReadLine, pSgspeed, preferences.txt, 16
FileReadLine, pCselect, preferences.txt, 18
FileReadLine, pKillWarning, preferences.txt, 20
FileReadLine, soundtoggle, preferences.txt, 22
Hotkey, %spamkey%, spam
Hotkey, %killkey%, killkey
Hotkey, %togglekey%, togglekey

If (pCselect != "Default") && (pCselect != "Racist Jokes") && (pCselect != "Did You Know") && (pCselect != "Compliments") && (pCselect != "Copypasta") && (pCselect != "Bitly") && (pCselect != "VoCoPaste")
{
	pCselect := "Default"
}

;	-=================GUI Creation=================-

;	Backround colour and seperation lines.
Gui Color, %pBackround%
Gui Add, Text, x-16 y40 w580 h2 0x10
Gui Add, Text, x138 y41 h270 0x11
Gui Add, Text, x273 y41 h270 0x11

;	Modifier checkboxes, checkboxes are seperated by 21 pixel each
Gui Add, Text, x48 y16 w60 h23 +0x200, Modifiers
Gui Add, CheckBox, vnumbers x16 y54 w110 h23, Numbers
Gui Add, CheckBox, vletters x16 y75 w110 h23, Letters
Gui Add, CheckBox, vnumletters x16 y96 w110 h23, Letters + Numbers
Gui Add, CheckBox, vinumbers x16 y117 w110 h23, Include Numbers
Gui Add, CheckBox, vctrlv x16 y138 w110 h23, Ctrl + V Mode
Gui Add, CheckBox, vladder x16 y159 w110 h23, Ladder Builder
Gui Add, CheckBox, vvapor x16 y180 w110 h23, v a p o r w a v e
Gui Add, CheckBox, vtts x16 y201 w110 h23, Discord TTS
Gui Add, CheckBox, vcustom x16 y222 w105 h23, Custom Preset
Gui Add, CheckBox, vcsgo x16 y243 w110 h23, Game Mode
Gui Add, CheckBox, gkill vkill x16 y264 w110 h23, /kill
Gui Add, Edit, vmessage x16 y287 w120 h21, Text To Spam

;	Basic script command buttons, buttons seperated by 26 pixels each
Gui Add, Text, x175 y16 w84 h23 +0x200, Information Buttons
Gui Add, Button, gchange x147 y55 w120 h21, &Changelog
Gui Add, Button, ghelp x147 y81 w120 h21, &Help
Gui Add, Button, gexpla x147 y107 w120 h21, &Explanations
Gui Add, Button, gwarning x147 y133 w120 h21, &Warning
Gui Add, Button, gversion x147 y159 w120 h21, &Check Version
Gui Add, Button, gunin x147 y185 w120 h21, &Uninstall
Gui Add, Button, gprofile x147 y211 w120 h21, &Make This My Profile
Gui Add, Button, gproreset x147 y237 w120 h21, &Reset Profile
Gui Add, Button, gcustomcheck x147 y263 w120 h21, &Check For .txts
Gui Add, Button, gcredits x147 y289 w120 h21, &Credits And Info

;	Customization settings
Gui Add, Text, x340 y16 w88 h23 +0x200, Customization
Gui Add, Button, gbackround x387 y54 w75 h22, &Set
Gui Add, Button, gname x387 y81 w75 h22, &Set
Gui Add, Edit, vbcolor x280 y54 w100 h21, Backround Color
Gui Add, Edit, vgname x280 y81 w100 h21, GUI Name
Gui Add, Text, x281 y112 w110 h20, Game Chat Key
Gui Add, Hotkey, vgamekey x387 y109 w75 h19, None
Gui Add, Edit, vcustomt x280 y133 w100 h21, Line to Add to .txt
Gui Add, Button, gcustomadd x387 y133 w75 h22, &Add to .txt
Gui Add, Text, x280 y164 w106 h20, Preset
Gui Add, DropDownList, vcselect x342 y159 w120, 
Gui Add, Text, x280 y188 w106 h20, Spam Speed
Gui Add, Edit, vsspeed gespeed x417 y185 w45 h19, Edit
Gui Add, UpDown, vudspeed gudspeed x352 y185 w22 h19 Range1-999, %pSspeed%
Gui Add, Text, x280 y213 w106 h20, Gamekey Wait Time
Gui Add, Edit, vsgspeed gegspeed x417 y210 w45 h19, Edit
Gui Add, UpDown, vudgspeed gudgspeed x393 y210 w22 h19 Range1-999, %pSgspeed%
Gui Add, CheckBox, vsoundtoggle x280 y231 w115 h23, Toggle Sounds Off
Gui Add, CheckBox, vpKillWarning x280 y250 w135 h23, Toggle /kill Warning Off

;	Custom preset drop-down box being set correctly based on default preference
Gui Show, w480 h316, %pName%
pCselect1 := RegExReplace("Default0Racist Jokes0Did You Know0Compliments0Copypasta0Bitly0VoCoPaste", pCselect, "", , 1)
pCselect2 := RegExReplace(pCselect1, "00", "0")
pCselect3 := RegExReplace(pCselect2, "0", "|")
If (pCselect = "Default")
{
	guicontrol, , cselect, %pCselect%|%pCselect3%
}
Else
{
	guicontrol, , cselect, %pCselect%||%pCselect3%
}

;	Sound toggle being set based off preference
If (soundtoggle = 1)
{
	guicontrol, , soundtoggle, 1
}

;	Kill warning toggle being set based off preference
If (pKillWarning = 1)
{
	guicontrol, , pKillWarning, 1
}
Return

GuiEscape:
GuiClose:
    ExitApp

;	-=================SS_DownloadTxt Function=================-
SS_DownloadTxt(FileToDownload, URL)
{
UrlDownloadToFile, %URL%, TempPastebin.txt
SearchTerm := "><div class="
StopTerm := "ol>"
CurrentLine := ""
line := 0
PasteComplete := 0
TempPastebin := "TempPastebin.txt"

while PasteComplete = 0
{
	line := line + 1
	FileReadLine, CurrentLine, %TempPastebin%, %line%
	
	If CurrentLine contains %SearchTerm%
	{
		StringReplace, CurrentLine, CurrentLine, ", , All ; " ignore this comment, it is only here because Notepad++ will make the rest of the code red for Peppermint.
		StringReplace, CurrentLine, CurrentLine, <ol class=text><li class=li1><div class=de1>, , All
		StringReplace, CurrentLine, CurrentLine, <li class=li1><div class=de1>, , All
		StringReplace, CurrentLine, CurrentLine, <li class=li2><div class=de2>, , All
		StringReplace, CurrentLine, CurrentLine, </div></li>, , All
		StringReplace, CurrentLine, CurrentLine, %A_Tab%, , All
		StringReplace, CurrentLine, CurrentLine, &gt;, , All
		FileAppend, %CurrentLine%, %FileToDownload%
		FileAppend, `n, %FileToDownload%
	}
	Else if CurrentLine contains %StopTerm%
	{
		PasteComplete := 1
	}
}
FileDelete, %TempPastebin%
}

;	Timer to change button names for the GUI during first time setup
ChangeInstallNames: 
IfWinNotExist, First Time Setup
    return
SetTimer, ChangeInstallNames, off 
WinActivate 
ControlSetText, Button1, &Install
ControlSetText, Button2, &Later
return

;	-=================Profile Reset Function=================-
proreset:
MsgBox, 4, Profile Reset, This option will reset your custom profile back to the default settings then close the script, are you sure you want to continue?
IfMsgBox, Yes
{
	FileDelete, preferences.txt
	SS_DownloadTxt("preferences.txt", "https://pastebin.com/vSTwxndy")
	Exitapp
}
IfMsgBox, No
{
	return
}
return

;	-=================Custom TXT Check Function=================-
;	-=================CURRENTLY NOT FUNCTIONAL=================-
txtcheck:
MsgBox, 4, Custom.txt Check, This option checks the SpamScript folder for any .txt files and alows them to be added to the list of custom .txts to use in the Custom Preset option (The name of any custom .txt cannot be a lone asterisk (*) or a lone question mark (?)). Are you sure you wish to do this check (You will be asked for each .txt whether or not you want them included in the Custom Preset list)?
IfMsgBox, Yes
{
	SetWorkingDir %A_ScriptDir%
	Loop, File, %A_ScriptDir%*.txt
	{
		MsgBox, 4, Add %A_LoopFileName%?, The file %A_LoopFileName% was found, add it to the list of Custom Preset .txts?
			IfMsgBox, Yes
			{
				
			}
			IfMsgBox, No
			{
				continue
			}
	}
}
IfMsgBox, No
{
	return
}
return

;	-=================Preferences Override/Creation Function=================-
profile:
MsgBox, 4, Preference Set Warning, This option will overwrite your current preferences.txt and replace it with ALL settings currently set on the script. If you don't want to change ALL personal settings then it is advised you manually edit the prefences.txt file. Any changes made to the preferences.txt file will take effect on next launch of the script.`n`nAre you sure you would like to overwrite your current prefencesl.txt with the current settings?
IfMsgBox, Yes
{
	Gui, Submit, NoHide
	If (bcolor = "Backround Color")
	{
		bcolor := %CONST_BCOLOR%
	}
	If (gname = "GUI Name")
	{
		gname := %CONST_GNAME%
	}
	TF_ReplaceLine("!preferences.txt", 10, 10, bcolor)
	TF_ReplaceLine("!preferences.txt", 12, 12, gname)
	TF_ReplaceLine("!preferences.txt", 14, 14, sspeed)
	TF_ReplaceLine("!preferences.txt", 16, 16, sgspeed)
	TF_ReplaceLine("!preferences.txt", 18, 18, cselect)
}
IfMsgBox, No
{
	return
}

;	-=================Live Adjustment of Up-Down Arrows/Edit Boxes For Speeds=================-
espeed:
guicontrolget, sspeed
guicontrol, ,udspeed, %sspeed%
guicontrolget, udspeed
return

udspeed:
guicontrolget, udspeed
guicontrol, ,sspeed, %udspeed%
return	
	
egspeed:
guicontrolget, sgspeed
guicontrol, ,udgspeed, %sgspeed%
guicontrolget, uspeed
return

udgspeed:
guicontrolget, udgspeed
guicontrol, ,sgspeed, %udgspeed%
return	

;	-=================Main Area for Check/Creation of Custom TXTs=================-
customcheck:
	IfNotExist, default.txt
	{
		SS_DownloadTxt("default.txt", "https://pastebin.com/Hmi81bvY")
	}
	IfNotExist, racism.txt
	{
		SS_DownloadTxt("racism.txt", "https://pastebin.com/rZaa3Ctv")
	}
	IfNotExist, facts.txt
	{
		SS_DownloadTxt("facts.txt", "https://pastebin.com/ATE52xM2")
	}
	IfNotExist, compliments.txt
	{
		SS_DownloadTxt("compliments.txt", "https://pastebin.com/sxKabcF9")
	}
	IfNotExist, copypasta.txt
	{
		SS_DownloadTxt("copypasta.txt", "https://pastebin.com/FJEAwDpm")
	}
	IfNotExist, bitly.txt
	{
		SS_DownloadTxt("bitly.txt", "https://pastebin.com/c4DZK4t2")
	}
	IfNotExist, VoCoPaste.txt
	{
		SS_DownloadTxt("VoCoPaste.txt", "https://pastebin.com/0SEdUisb")
	}
	IfNotExist, preferences.txt
	{
		SS_DownloadTxt("preferences.txt", "https://pastebin.com/vSTwxndy")
	}
	
	MsgBox, 0, , All required txts either already exist or were created successfully.
return

;	-=================Function for Adding to Custom TXTs=================-
customadd:
	Gui, Submit, NoHide
	If (customt = "Edit")
	{
		return
	}
	Else if (customt = "")
	{
		return
	}
	If (cselect = "Default")
	{
		IfExist, default.txt
		{
			AmountOfLines := TF_CountLines("default.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!default.txt", randc, randc, customt)
		}
		IfNotExist, default.txt
		{
			MsgBox, 4, [ERROR], default.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("default.txt", "https://pastebin.com/Hmi81bvY")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "Racial Slurs")
	{
		IfExist, racism.txt
		{
			AmountOfLines := TF_CountLines("racism.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!racism.txt", randc, randc, customt)
		}
		IfNotExist, racism.txt
		{
			MsgBox, 4, [ERROR], racism.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("racism.txt", "https://pastebin.com/rZaa3Ctv")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "Did You Know")
	{
		IfExist, facts.txt
		{
			AmountOfLines := TF_CountLines("facts.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!facts.txt", randc, randc, customt)
		}
		IfNotExist, facts.txt
		{
			MsgBox, 4, [ERROR], facts.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("facts.txt", "https://pastebin.com/ATE52xM2")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "Compliments")
	{
		IfExist, compliments.txt
		{
			AmountOfLines := TF_CountLines("compliments.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!compliments.txt", randc, randc, customt)
		}
		IfNotExist, compliments.txt
		{
			MsgBox, 4, [ERROR], compliments.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("compliments.txt", "https://pastebin.com/sxKabcF9")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "Copypasta")
	{
		IfExist, copypasta.txt
		{
			AmountOfLines := TF_CountLines("copypasta.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!copypasta.txt", randc, randc, customt)
		}
		IfNotExist, copypasta.txt
		{
			MsgBox, 4, [ERROR], copypasta.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("copypasta.txt", "https://pastebin.com/FJEAwDpm")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "Bitly")
	{
		IfExist, bitly.txt
		{
			AmountOfLines := TF_CountLines("bitly.txt")
			Random, randc, 2, %AmountOfLines%
			TF_ReplaceLine("!bitly.txt", randc, randc, customt)
		}
		IfNotExist, bitly.txt
		{
			MsgBox, 4, [ERROR], bitly.txt was not detected by the script, would you like to make one now?
			IfMsgBox, Yes
			{
				SS_DownloadTxt("bitly.txt", "https://pastebin.com/c4DZK4t2")
			}
			IfMsgBox, No
			{
				MsgBox, 0, [ERROR], -=[WARNING]=-`n  The script will act in unexpected ways.`n  It is highly advised that you either refrain from using anything that could require the missing .txt file to function or acquire the missing .txt.
			}
		}
	}
	Else if (cselect = "VoCoPaste")
	{
		MsgBox, 0, , VoCoPaste is currently unsupported to change lines to but if you must you can change the .txt itself.
	}
return

;	-=================Check Version Function=================-
;	Fun fact: this has literally never worked under normal circumstances and only does work if you move the folder actually containing your explorer to the desktop.
;	I don't really know a way to fix that with differing install locations across computers and windows installs but if anybody has a fix hmu.
version:
	SetWorkingDir %A_Desktop%
	IfExist, chrome.exe
	{
		Run, chrome.exe https://www.dropbox.com/sh/9akucf44z9p7wd7/AAD02NlK-Lh3H0naPJ9MVUT6a?dl=0, , Max
	}
	IfNotExist, chrome.exe
	{
		IfExist, firefox.exe
		{
			Run, firefox.exe https://www.dropbox.com/sh/9akucf44z9p7wd7/AAD02NlK-Lh3H0naPJ9MVUT6a?dl=0, , Max
		}
		IfNotExist, firefox.exe
		{
			clipboard = https://www.dropbox.com/sh/9akucf44z9p7wd7/AAD02NlK-Lh3H0naPJ9MVUT6a?dl=0
			MsgBox, 0, Error, The script could not detect a search engine so the dropbox link has been copied to your clipboard. Go to your engine of choice and press Ctrl+V in the search/URL bar.
		}
	}
	SetWorkingDir %A_ScriptDir%
return

;	-=================Script Uninstall Function=================-
;	The uneeded massive nature of this is a byproduct of how this used to be done, being that the parent folder of the script was deleted, which could lead to deleting desktops.
;	I figured might as well keep the safety measures to prevent some weird glitch I haven't thought of.
unin:
	If (unin = 0)
	{
		MsgBox, 0, Uninstall, This button will delete the Spam Script and all related .txt files. `nThis cannot be undone and you must reinstall the script to get it back.`nDO NOT attempt to use the uninstall function if the script is not in its own private folder.`nClick the Uninstall button again to confirm.
		unin := 1
	}
	Else if (unin = 1) 
	{
		IfExist, default.txt
		{
			IfExist, racism.txt
			{
				IfExist, compliments.txt
				{
					IfExist, facts.txt
					{
						IfExist, copypasta.txt
						{
							IfExist, bitly.txt
							{
								IfExist, VoCoPaste.txt
								{
									IfExist, preferences.txt
									{
										MsgBox, 4, Uninstall, Are you sure you want to uninstall? This will delete the script and all associated .txt files, but will not delete the parent folder containing them due to the possibility of deleting important folders.
										IfMsgBox Yes
										{
											FileDelete, compliments.txt
											FileDelete, copypasta.txt
											FileDelete, default.txt
											FileDelete, facts.txt
											FileDelete, preferences.txt
											FileDelete, racism.txt 
											FileDelete, VoCoPaste.txt
											FileDelete, SpamScript V2.5.exe
											MsgBox, 0, , Thank you for using Peppermint Larrys Spam Script, I hope you enjoyed your time with it as much as I have enjoyed my time developing it thusfar. Have a beautiful day and rest of your life.
											Exitapp
										}
										Else
										{
											return
										}
									}
								Else
								{
									Goto, UninError
								}
							}
							Else
							{
								Goto, UninError
							}
						}
						Else
						{
							Goto, UninError
						}
					}
					Else
					{
						Goto, UninError
					}
				}
				Else
				{
					Goto, UninError
				}
			}
			Else
			{
				Goto, UninError
			}
		}
		Else
		{
			Goto, UninError
		}
	}
	}
return

UninError:
MsgBox, 0, [ERROR], Spam Script is either not in the correct parent folder or one or more of related .txt files are not present, uninstall stopped to prevent damage.`nIf this error continues to occur manually deleting the script and all related .txt files does the same thing as nothing about the script is stored anywhere else.
return

;	-=================Function to Bring Up /kill Warning Based off Preferences=================-
;	The exploit mentioned was most likely in how Steam stored messages locally and how bot programs handled those messages although this is just a guess as I haven't seen any code for bot programs.
;	In essence the exploit was just sending a fuck ton of messages as fast as possible, the most I recorded sending in testing was about 75 per second.
;	Sadly this was patched after a month or two after being implemented into the script when Steam added a spam filer.
kill:
	Gui, Submit, NoHide
	If (kill = 1)
	{
		If (pKillWarning = 1)
		{
			Msgbox, 0, Kill Info, This is an old exploit in Steams chat function designed to crash bot accounts that was quickly patched.`n This Modifier is basically just the Number Modifier but with every possible speed setting set as fast as possible.
		}
	}
return

;	-=================Live Backround Color Set Function=================-
backround:
	Gui, Submit, NoHide
	If (bcolor = "Backround Color")
	{
		return
	}
	Else
	{
		Gui Color, %bcolor%
	}
return

;	-=================Live Script Name Function=================-
name:
	Gui, Submit, NoHide
	If (gname = "GUI Name")
	{
		return
	}
	Else
	{
		Gui Show, w480 h316, %gname%
	}
return

;	-=================Main Spamming Runtime=================-
;	Seriously though this is very disgusting spaghetti but it actually only impacts the speed of the /kill function, everything else has a minimum sleep speed slower than the time to process all the if else statements.
;	If AHK had a switch statement I'd be more than happy to use that instead but here we are.

spam:

If (spamtoggle = 0)
{
	return
}

If (message = "Edit")
{
	message = "I'm too lazy to think of a line to spam before starting my script"
}

;	Just setting the alphabet variable in-case down the line it gets changed for any reason.
alph := "abcdefghijklmnopqrstuvwxyCABCDEFGHIJKLMNOPQRSTUVWXYZ"

;	It is important to set this delay now so it is guaranteed to happen.
SetKeyDelay, 0.1, 1

;	Gui, Submit, NoHide is basically just "Get all information from the GUI without hiding it".
Gui, Submit, NoHide

While GetKeyState(spamkey, "P")
{
	;	-====Numbers Modifier====-
	If (numbers = 1)
	{
		If (tts = 1)
		{
			Random, rand, 11111, 99999
			clipboard = %rand%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			Random, rand, 11111, 99999
			clipboard = %rand%
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			Random, rand, 11111, 99999
			clipboard = %rand%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Letters Modifier====-
	Else if (letters = 1)
	{
		If (tts = 1)
		{
			Random, rand, 1, 54
			Random, rand1, 1, 54
			Random, rand2, 1, 54
			Random, rand3, 1, 54
			Random, rand4, 1, 54
			let := SubStr(alph, rand, 1)
			let1 := SubStr(alph, rand1, 1)
			let2 := SubStr(alph, rand2, 1)
			let3 := SubStr(alph, rand3, 1)
			let4 := SubStr(alph, rand4, 1)
			clipboard = %let%%let1%%let2%%let3%%let4%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			Random, rand, 1, 54
			Random, rand1, 1, 54
			Random, rand2, 1, 54
			Random, rand3, 1, 54
			Random, rand4, 1, 54
			let := SubStr(alph, rand, 1)
			let1 := SubStr(alph, rand1, 1)
			let2 := SubStr(alph, rand2, 1)
			let3 := SubStr(alph, rand3, 1)
			let4 := SubStr(alph, rand4, 1)
			clipboard = %let%%let1%%let2%%let3%%let4%
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			Random, rand, 1, 54
			Random, rand1, 1, 54
			Random, rand2, 1, 54
			Random, rand3, 1, 54
			Random, rand4, 1, 54
			let := SubStr(alph, rand, 1)
			let1 := SubStr(alph, rand1, 1)
			let2 := SubStr(alph, rand2, 1)
			let3 := SubStr(alph, rand3, 1)
			let4 := SubStr(alph, rand4, 1)
			clipboard = %let%%let1%%let2%%let3%%let4%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Numbers + Letters Modifier====-
	Else if (numletters = 1)
	{
		If (tts = 1)
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 26
			Random, rand3, 1, 26
			Random, rand4, 1, 999
			let := SubStr(alph, rand2, 1)
			let1 := SubStr(alph, rand3, 1)
			clipboard = %rand%%let%%rand1%%let1%%rand4%
			Send, %gamekey%
			Sleep, %udspeed%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 26
			Random, rand3, 1, 26
			Random, rand4, 1, 999
			let := SubStr(alph, rand2, 1)
			let1 := SubStr(alph, rand3, 1)
			clipboard = %rand%%let%%rand1%%let1%%rand4%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 26
			Random, rand3, 1, 26
			Random, rand4, 1, 999
			let := SubStr(alph, rand2, 1)
			let1 := SubStr(alph, rand3, 1)
			clipboard = %rand%%let%%rand1%%let1%%rand4%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Include Numbers Modifier====-
	Else if (inumbers = 1)
	{
		If (tts = 1)
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 99
			message2 := message
			IfInString, message, %A_Space%
			{
				StringReplace, message2, message, %A_Space%, %rand2%, 1
			}
			clipboard = %message2%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 99
			message2 := message
			IfInString, message, %A_Space%
			{
				StringReplace, message2, message, %A_Space%, %rand2%, 1
			}
			clipboard = %message2%
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			Random, rand, 1, 999
			Random, rand1, 1, 999
			Random, rand2, 1, 99
			message2 := message
			IfInString, message, %A_Space%
			{
				StringReplace, message2, message, %A_Space%, %rand2%, 1
			}
			clipboard = %message2%
			Send, %rand%^v%rand2%{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Ctrl+V Modifier====-
	Else if (ctrlv = 1)
	{
		If (tts = 1)
		{
			Send, /tts{Space}^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Ladder Builder Modifier====-
	Else if (ladder = 1)
	{
		If (tts = 1)
		{
			clipboard = ╠═══╣Lets build a ladder╠═══╣
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			clipboard = ╠═══╣Lets build a ladder╠═══╣
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			clipboard = ╠═══╣Lets build a ladder╠═══╣
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Vaporwave Modifier====-
	Else if (vapor = 1)
	{
		If (tts = 1)
		{
			vaporwave := RegExReplace(message, "q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m|", "$0 ")
			clipboard = %vaporwave%
			Send, /tts^v{Enter}
			Sleep, %udspeed%
		}
		Else if (csgo = 1)
		{
			vaporwave := RegExReplace(message, "q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m|", "$0 ")
			clipboard = %vaporwave%
			Send, %gamekey%
			Sleep, %udgspeed%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		Else
		{
			vaporwave := RegExReplace(message, "q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m|", "$0 ")
			clipboard = %vaporwave%
			Send, ^v{Enter}
			Sleep, %udspeed%
		}
		continue
	}
	;	-====Custom TXT Modifier====-
	Else if (custom = 1)
	{
		If (tts = 1)
		{
			If (cselect = "Default")
			{
				AmountOfLines := TF_CountLines("default.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, default.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Racist Jokes")
			{
				AmountOfLines := TF_CountLines("racism.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, racism.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Did You Know")
			{
				AmountOfLines := TF_CountLines("facts.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, facts.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Compliments")
			{
				AmountOfLines := TF_CountLines("compliments.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, compliments.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Copypasta")
			{
				AmountOfLines := TF_CountLines("copypasta.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, copypasta.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Bitly")
			{
				AmountOfLines := TF_CountLines("bitly.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, bitly.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "VoCoPaste")
			{
				AmountOfLines := TF_CountLines("VoCoPaste.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, VoCoPaste.txt, %rand%
				clipboard = %customspam%
				Send, /tts^v{Enter}
				Sleep, %udspeed%
			}
		}
		Else if (csgo = 1)
		{
			If (cselect = "Default")
			{
				AmountOfLines := TF_CountLines("default.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, default.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Racist Jokes")
			{
				AmountOfLines := TF_CountLines("racism.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, racism.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Did You Know")
			{
				AmountOfLines := TF_CountLines("facts.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, facts.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Compliments")
			{
				AmountOfLines := TF_CountLines("compliments.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, compliments.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Copypasta")
			{
				AmountOfLines := TF_CountLines("copypasta.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, copypasta.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Bitly")
			{
				AmountOfLines := TF_CountLines("bitly.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, bitly.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "VoCoPaste")
			{
				AmountOfLines := TF_CountLines("VoCoPaste.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, VoCoPaste.txt, %rand%
				clipboard = %customspam%
				Send, %gamekey%
				Sleep, %udgspeed%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
		}
		Else
		{
			If (cselect = "Default")
			{
				AmountOfLines := TF_CountLines("default.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, default.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Racist Jokes")
			{
				AmountOfLines := TF_CountLines("racism.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, racism.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Did You Know")
			{
				AmountOfLines := TF_CountLines("facts.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, facts.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Compliments")
			{
				AmountOfLines := TF_CountLines("compliments.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, compliments.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Copypasta")
			{
				AmountOfLines := TF_CountLines("copypasta.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, copypasta.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "Bitly")
			{
				AmountOfLines := TF_CountLines("bitly.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, bitly.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
			Else if (cselect = "VoCoPaste")
			{
				AmountOfLines := TF_CountLines("VoCoPaste.txt")
				Random, rand, 2, %AmountOfLines%
				FileReadLine, customspam, VoCoPaste.txt, %rand%
				clipboard = %customspam%
				Send, ^v{Enter}
				Sleep, %udspeed%
			}
		}
		continue
	}
	;	-====Discord TTS Modifier====-
	Else if (tts = 1)
	{
		SendRaw, /tts
		Send, {Space}
		Send, %message%{Enter}
		Sleep, %udspeed%
	}
	;	-====Game Mode Modifier====-
	Else if (csgo = 1)
	{
		Send, %gamekey%
		Sleep, 250
		Send, %message%{Enter}
		Sleep, %udspeed%
	}
	;	-====/kill Modifier====-
	Else if (kill = 1)
	{
		SetKeyDelay, 0.1, 0.9
		Random, rand5, 11111, 99999
		Send, %rand5%{Enter}
		Sleep, %udspeed%
	}
	Else
	{
		clipboard = %message%
		Send, ^v{Enter}
		Sleep, %udspeed%
	}
	continue
}
return

;	-=================Script Sound Toggle Function=================-
togglekey:
Gui, Submit, NoHide
If (spamtoggle = 1)
{
	If (soundtoggle = 0)
	{
		SoundBeep, 105, 350
		Sleep, 75
		SoundBeep, 90, 200
	}
	spamtoggle := 0
}
Else
{
	If (soundtoggle = 0)
	{
		SoundBeep, 105, 350
		Sleep, 75
		SoundBeep, 125, 200
	}
	spamtoggle := 1
}
return

;	-=================Changelog Button Menu=================-
;	I would love to make this into a website based deal but I don't have the resources to really do that, so this'll have to do for now.
;	Also, if anybody would like to see something added to the changelog in the same way there's source code information I'd love to hear it.
change:
Msgbox, 0, Change log, V2.5:-=ADDED=-`n +Implemented hi5's TF library to speed up and consolidate all txt file functions.`n +Added functionality for custom txts to now have an infinite line limit.`n +Added Auto-Check feature in preferences to check for if all txts are present when the script starts.`n +All modifiers that send letters can now send capital letters.`n +Added a bunch of comments in the source code to make it prettier.	`n`n-=REMOVED=-`n -Removed Slow Mode and increased Spam Speeds limit to 999 ms to compensate.	`n`n-=CHANGED=-`n +Custom .txts are no longer locally stored within the script and are instead downloaded from a public pastebin.`n +Text To Spam edit box now under "Modifiers" tab.`n +Button to check for presence of txt files moved.`n`n`n Current Source Code Length: 46,018 Lines: 1,292 Size: 45KB
return

;	-=================Script Kill Function=================-
killkey:
Exitapp

;	-=================Help Button Menu=================-
help:
SetTimer, ChangeButtonNames, 50
Msgbox, 2, Help, The default keybinds are End to spam, Delete to kill the script, and, F1 to toggle it, you can change these settings by opening the "preferences.txt" file.`nSelect the checkbox of a modifier (with Explanations of all the scripts functions found by clicking the Explanations button) or just type a message into the middle "Edit" box and enjoy your spamming.`n`nThe source code for this script is public, just open the exe in notepad and scroll to the bottom (it's only an exe so you don't have to download AutoHotKey but if you want to use AHK or are lazy press the pastebin button to copy the link to your clipboard). The script does not require an internet connection and has no functions that communicate with anything online other than the Check Version button.`n`nPeppermint Larry will never publish a version of this script anybody but him edited to ensure your safety (this of course cannot be promised if you download it from a 3rd party).`n`nMost functions overwrite your clipboard so be sure to not have anything too important there.`nModifiers Priority:`n  1. Numbers.`n  2. Letters.`n  3. Letters + Numbers.`n  4. Include Numbers.`n  5. Ctrl+V Mode.`n  6.  Ladder Builder.`n  7.  v a p o r w a v e.`n  8. Discord TTS.`n  9. Custom Preset.`n  10. Game Mode.`n  11. /kill.`n`n To set backround color enter hex values in the text box labled "Backround Color" and hit the "Set" button.
IfMsgBox, Abort
{
	SetTimer, ChangeReportNames, 50
	MsgBox, 1, Report a Bug, If you have found a bug in the script or the scripts code please contact Peppermint Larry on`n Discord: Peppermint Larry#6677`n Steam: http://steamcommunity.com/id/PeppermintLarry2/`n Or Gmail: PepermintLary@gmail.com
	IfMsgBox, OK
	{
		clipboard := "PepermintLary@gmail.com"
		Msgbox, 0, Report a Bug, My gmail has been copied to your clipboard.
		Goto, help
	}
	IfMsgBox, Cancel
	{
		Goto, help
	}
}
IfMsgBox, Retry
{
	clipboard := "https://pastebin.com/RbDBxKMW"
	Msgbox, 0, Pastebin, The pastebin link has been copied to your clipboard.
	Goto, help
}
IfMsgBox, Ignore
{
	return
}
return

;	-=================Explanations Button Menu=================-
expla: 
Msgbox, 0, Explanations, What Does The Stuff Do:`n Modifiers:`n  Numbers spams 5 random digits.`n  Letters spams 5 random letters.`n  Letters + Numbers spams 3 random numbers and 2 random letters.`n  Include Numbers spams a user defined message with random numbers replacing any spaces and wrapping the message.`n  Ctrl + V Mode sends a user defined message but using the Control + V windows function to spam faster.`n  Ladder Builder quite literally builds a ladder by spamming "╠═══╣".`n  v a p o r w a v e adds a space in between all characters in a user-defined message and spams it.`n  Discord TTS sends a discord text-to-speech command before a message and can be used with any other function/modifier.`n  Custom Preset spams a random message from a user-customizable .txt file.`n  Game Mode sends a user-defined keystroke before a message to open a game text chat and can be used with any other function/modifier.`n  /kill sends 5 random digits and removes all wait times to spam as fast as possible.`n`n Text To Spam & Buttons:`n  The first "Edit" box in this tab is where single, user-defined messages are entered to be spammed go.`n  Changelog opens a message box informing users on changes made in the most previous version of Spam Script with some source code info.`n  Help opens a message box containing basic information regarding the script like defaults and how to contact Peppermint.`n  Explanations opens a message box that informs users on every function of the script.`n  Warning opens a message box that contains warning about and legal information regarding the script and its use.`n  Check Version opens a Chrome, Firefox, or Explorer window leading to the dropbox of the script.`n  Uninstall uninstalls the script and all associated .txt files and folders.`n  Make This My Profile will write your current Spam Script configuration to be your default for launch.`n  Reset Profile resets the preferences.txt and Spam Script to default settings.`n`n Customization:`n  Backround Color sets the color of the window to a user-defined hex color value with the "Set" button to the right making the change.`n  GUI Name sets the name of the scripts GUI with the "Set" button to the right making the change.`n  Game Chat Key sets the key to open the chat box when Game Mode is active using the edit box to the right.`n  Check for .txts checks if any of the .txt files used by the script are missing and if so replaces them.`n  Line to Add to .txt replaces a random line in the currently selected Custom Preset using the drop-down list with a user-defined message with the "Add to .txt" button to the right making the change.`n  Preset is the currently selected Custom Preset .txt using the drop-down menu to the right.`n  Spam Speed sets the time in ms the script will wait before executing the next message (Range is 1-500 ms).`n  Gamekey Wait Time sets the time in ms the script will wait after sending the user-defined Game Chat Key to send the actual spam message (Range is 5-999 ms).`n  Toggle Sounds Off turns sounds off when the script is turned on/off.`n  Toggle /kill Warning Off turns off the warning message that accompanies toggling /kill on.
return

;	-=================Credits & Info Button Menu=================-
credits:
MsgBox, 0, Credits, Textfile & String Library for AutoHotkey [lib] - v3.7 by hi5.`n  TF Github: https://github.com/hi5/TF `n  hi5 Github: https://github.com/hi5 `n`n`nSpam Script V2.5 created and maintained by Peppermint Larry for anybody to use freely.`n Script Github: https://github.com/PeppermintLarry/NotASpamScript `n Peppermint Github: https://github.com/PeppermintLarry `n`n`nSpecial Thanks:`n  Pastebin for the free hosting of not only the source code but the text files used.`n  Github for the free hosting of not only the script but the text files used.`n  All of my friends who "volunteered" to deal with being spammed for testing purposes.`n`nThank you for reading and using my Spam Script!
return

;	This is probably the cringiest thing I could possibly add to this script and it is also near the top of the to-do list to redo this entire area.
warning:
Msgbox, 0, Warning, The original creator of this script is not responsible for any of the following:`n 1. Any malicious software from downloading this script from a 3rd party.`n 2. Loss of friends due to annoying them.`n 3. Literally anything else that comes from a person using this program.`n 4. ANYTHING.`n`n Do not hit spam key while the script is your focused window.`n Do not attempt to use the uninstall function if the script is not in its own folder.`n 3 of the bitly links are porn and 1 is a Hitler speech.`n Do not use special characters like commas hashtags or curly brackets in the edit box.`n Once the spam key is clicked the program will send that spam, do not try to interrupt it.`n Additionally, do not delete the custom .txt files as the script will fail its install check and bug out. This check is run on startup or when you try to uninstall the script (to avoid users deleting their desktop dolfer) meaning neither process will working properly.`n Advanced user can change the scripts hotkeys by editing the .exe but do not set it to a character button (like the "L" or "4" or "," keys) the script will bug out if you do.`n`n This script will never be VAC, EAC, BattleEye, etc. detected however game server staff will likely not greet it with open arms.`n This script is immensely annoying without a very good anti-spam or the patience of a saint so don't be surprised if extended use creates problems.
return

ChangeButtonNames:
IfWinNotExist, Help
    return
SetTimer, ChangeButtonNames, off 
WinActivate 
ControlSetText, Button1, &Report Bug
ControlSetText, Button2, &Pastebin
ControlSetText, Button3, &OK
return

ChangeReportNames:
IfWinNotExist, Report a Bug
    return
SetTimer, ChangeReportNames, off 
WinActivate 
ControlSetText, Button1, &Contact
return