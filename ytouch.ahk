
#include AutoHotkey-Midi/Midi.ahk
#include miditools.ahk

#Persistent

midi := new Midi()
ok:=true
if (midi.OpenMidiOutByName( "MPD218" )<0){
	ok:=false
}
if (midi.OpenMidiInByName( "MPD218" )<0){
	ok:=false
}

if (!ok){
	MsgBox, Cannot open MIDI Device
	midi.Destroy()
	ExitApp, 1
}

midi.MidiOut("CC", 1, 3, 65)
midi.MidiOut("CC", 1, 9, 65)

int := 12
loop 20 {
	midi.MidiOut("CC", 1, int, 65)
	int++
}

knob1 := new MidiKnob("knob1")
knob2 := new MidiKnob("knob2")
knob3 := new MidiKnob("knob3")
knob4 := new MidiKnob("knob4")
knob5 := new MidiKnob("knob5")
knob6 := new MidiKnob("knob6")

knob01 := new MidiKnob("knob01")
knob02 := new MidiKnob("knob02")
knob03 := new MidiKnob("knob03")
knob04 := new MidiKnob("knob04")
knob05 := new MidiKnob("knob05")
knob06 := new MidiKnob("knob06")

knob11 := new MidiKnob("knob11")
knob12 := new MidiKnob("knob12")
knob13 := new MidiKnob("knob13")
knob14 := new MidiKnob("knob14")
knob15 := new MidiKnob("knob15")
knob16 := new MidiKnob("knob16")

time_since_last := A_TickCount

estado := []
int := 36
loop 48 {
	midi.MidiOut("N1", 10, int, 0)
	estado[int] := 0
	int++
}

mode1:=0
mode2:=0

Return  ; end of MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; KNOB 1
MidiControlChange15:
    knob1.CalledCC(midi.MidiIn(),1)
    Return
knob1left(knob){
	SetKeyDelay 10,40
	ControlSend, , 8, ahk_class X-System
	midi.MidiOut("CC", 1, 15, 65)
	knob.resetValue()
}
knob1right(knob){
	SetKeyDelay 10,40
	ControlSend, , 0, ahk_class X-System
	midi.MidiOut("CC", 1, 15, 65)
	knob.resetValue()
}

; KNOB 2
MidiControlChange14:
    knob2.CalledCC(midi.MidiIn(),1)
    Return
knob2left(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad1}, ahk_class X-System
	midi.MidiOut("CC", 1, 14, 65)
	knob.resetValue()
}
knob2right(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad7}, ahk_class X-System
	midi.MidiOut("CC", 1, 14, 65)
	knob.resetValue()
}

; KNOB 3
MidiControlChange13:
    knob3.CalledCC(midi.MidiIn(),0.5)
    Return
knob3left(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad2}, ahk_class X-System
	midi.MidiOut("CC", 1, 13, 65)
	knob.resetValue()
}
knob3right(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad8}, ahk_class X-System
	midi.MidiOut("CC", 1, 13, 65)
	knob.resetValue()
}

; KNOB 4
MidiControlChange12:
    knob4.CalledCC(midi.MidiIn(),0.5)
    Return
knob4left(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad4}, ahk_class X-System
	midi.MidiOut("CC", 1, 12, 65)
	knob.resetValue()
}
knob4right(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad6}, ahk_class X-System
	midi.MidiOut("CC", 1, 12, 65)
	knob.resetValue()
	
}

; KNOB 5
MidiControlChange9:
    knob5.CalledCC(midi.MidiIn(),0.5)
    Return
knob5left(knob){
	SetKeyDelay 10,40
	ControlSend, , {SC04A}, ahk_class X-System
	midi.MidiOut("CC", 1, 9, 65)
	knob.resetValue()
}
knob5right(knob){
	SetKeyDelay 10,40
	ControlSend, , {SC04E}, ahk_class X-System
	midi.MidiOut("CC", 1, 9, 65)
	knob.resetValue()
}

; KNOB 6
MidiControlChange3:
    knob6.CalledCC(midi.MidiIn(),0.5)
    Return
knob6left(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad3}, ahk_class X-System
	midi.MidiOut("CC", 1, 3, 65)
	knob.resetValue()
}
knob6right(knob){
	SetKeyDelay 10,40
	ControlSend, , {Numpad9}, ahk_class X-System
	midi.MidiOut("CC", 1, 3, 65)
	knob.resetValue()
}

; BANK 2

; KNOB 1
MidiControlChange16:
    knob01.CalledCC(midi.MidiIn(),0.25)
    Return
knob01left(knob){
	SetKeyDelay 10,40
	ControlSend, , y, ahk_class X-System
	midi.MidiOut("CC", 1, 16, 65)
	knob.resetValue()
}
knob01right(knob){
	SetKeyDelay 10,40
	ControlSend, , u, ahk_class X-System
	midi.MidiOut("CC", 1, 16, 65)
	knob.resetValue()
}

; KNOB 2
MidiControlChange17:
    knob02.CalledCC(midi.MidiIn(),0.25)
    Return
knob02left(knob){
	SetKeyDelay 10,40
	ControlSend, , i, ahk_class X-System
	midi.MidiOut("CC", 1, 17, 65)
	knob.resetValue()
}
knob02right(knob){
	SetKeyDelay 10,40
	ControlSend, , o, ahk_class X-System
	midi.MidiOut("CC", 1, 17, 65)
	knob.resetValue()
}

; KNOB 3
MidiControlChange18:
    knob03.CalledCC(midi.MidiIn(),0.25)
    Return
knob03left(knob){
	SetKeyDelay 10,40
	ControlSend, , h, ahk_class X-System
	midi.MidiOut("CC", 1, 18, 65)
	knob.resetValue()
}
knob03right(knob){
	SetKeyDelay 10,40
	ControlSend, , j, ahk_class X-System
	midi.MidiOut("CC", 1, 18, 65)
	knob.resetValue()
}

; KNOB 4
MidiControlChange19:
    knob04.CalledCC(midi.MidiIn(),0.25)
    Return
knob04left(knob){
	SetKeyDelay 10,40
	ControlSend, , k, ahk_class X-System
	midi.MidiOut("CC", 1, 19, 65)
	knob.resetValue()
}
knob04right(knob){
	SetKeyDelay 10,40
	ControlSend, , l, ahk_class X-System
	midi.MidiOut("CC", 1, 19, 65)
	knob.resetValue()
	
}

; KNOB 5
MidiControlChange20:
    knob05.CalledCC(midi.MidiIn(),0.25)
    Return
knob05left(knob){
	SetKeyDelay 10,40
	ControlSend, , n, ahk_class X-System
	midi.MidiOut("CC", 1, 20, 65)
	knob.resetValue()
}
knob05right(knob){
	SetKeyDelay 10,40
	ControlSend, , m, ahk_class X-System
	midi.MidiOut("CC", 1, 20, 65)
	knob.resetValue()
}

; KNOB 6
MidiControlChange21:
    knob06.CalledCC(midi.MidiIn(),0.25)
    Return
knob06left(knob){
	SetKeyDelay 10,40
	ControlSend, , {SC033}, ahk_class X-System
	midi.MidiOut("CC", 1, 21, 65)
	knob.resetValue()
}
knob06right(knob){
	SetKeyDelay 10,40
	ControlSend, , {SC034}, ahk_class X-System
	midi.MidiOut("CC", 1, 21, 65)
	knob.resetValue()
}

; BANK 3

; KNOB 1
MidiControlChange22:
    knob11.CalledCC(midi.MidiIn(),0.25)
    Return
knob11left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^y, ahk_class X-System
	midi.MidiOut("CC", 1, 22, 65)
	knob.resetValue()
}
knob11right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^u, ahk_class X-System
	midi.MidiOut("CC", 1, 22, 65)
	knob.resetValue()
}

; KNOB 2
MidiControlChange23:
    knob12.CalledCC(midi.MidiIn(),0.25)
    Return
knob12left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^i, ahk_class X-System
	midi.MidiOut("CC", 1, 23, 65)
	knob.resetValue()
}
knob12right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^o, ahk_class X-System
	midi.MidiOut("CC", 1, 23, 65)
	knob.resetValue()
}

; KNOB 3
MidiControlChange24:
    knob13.CalledCC(midi.MidiIn(),0.25)
    Return
knob13left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^h, ahk_class X-System
	midi.MidiOut("CC", 1, 24, 65)
	knob.resetValue()
}
knob13right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^j, ahk_class X-System
	midi.MidiOut("CC", 1, 24, 65)
	knob.resetValue()
}

; KNOB 4
MidiControlChange25:
    knob14.CalledCC(midi.MidiIn(),0.25)
    Return
knob14left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^k, ahk_class X-System
	midi.MidiOut("CC", 1, 25, 65)
	knob.resetValue()
}
knob14right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^l, ahk_class X-System
	midi.MidiOut("CC", 1, 25, 65)
	knob.resetValue()
	
}

; KNOB 5
MidiControlChange26:
    knob15.CalledCC(midi.MidiIn(),0.25)
    Return
knob15left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^n, ahk_class X-System
	midi.MidiOut("CC", 1, 26, 65)
	knob.resetValue()
}
knob15right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^m, ahk_class X-System
	midi.MidiOut("CC", 1, 26, 65)
	knob.resetValue()
}

; KNOB 6
MidiControlChange27:
    knob16.CalledCC(midi.MidiIn(),0.25)
    Return
knob16left(knob){
	SetKeyDelay 10,40
	ControlSend, , ^{SC033}, ahk_class X-System
	midi.MidiOut("CC", 1, 27, 65)
	knob.resetValue()
}
knob16right(knob){
	SetKeyDelay 10,40
	ControlSend, , ^{SC034}, ahk_class X-System
	midi.MidiOut("CC", 1, 27, 65)
	knob.resetValue()
}

Cooldown(keys){
	setKeyDelay 10,40
	Global time_since_last
	if(A_TickCount - time_since_last > 200){
		ControlSend, , %keys%, ahk_class X-System
		time_since_last := A_TickCount
	}
}

MidiNoteOn40:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("t")
	}
return

MidiNoteOn41:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("9")
	}
return

MidiNoteOn44:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("{Numpad5}")
	}
return

MidiNoteOn45:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^{Numpad5}")
	}
return

; FMS

MidiNoteOn56:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("c")
	}
return

MidiNoteOn57:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("v")
	}
return

MidiNoteOn52:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("z")
	}
return

MidiNoteOn53:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("x")
	}
return

MidiNoteOn72:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^c")
	}
return

MidiNoteOn73:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^v")
	}
return

MidiNoteOn68:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^z")
	}
return

MidiNoteOn69:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^x")
	}
return

; RADIO

MidiNoteOn64:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("q")
	}
return

MidiNoteOn65:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("w")
	}
return

MidiNoteOn60:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("a")
	}
return

MidiNoteOn61:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("s")
	}
return

MidiNoteOn80:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^q")
	}
return

MidiNoteOn81:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^w")
	}
return

MidiNoteOn76:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^a")
	}
return

MidiNoteOn77:
	if (midi.MidiIn().velocity > 0) {
		Cooldown("^s")
	}
return

; MORE


MidiNoteOn48:
	if (midi.MidiIn().velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{NumpadMult}")
	}
return

MidiNoteOn49:
	if (midi.MidiIn().velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{NumpadDiv}")
	}
return

MidiNoteOn78:
	Button46(midi.MidiIn())
return
MidiNoteOn62:
	Button46(midi.MidiIn())
return
MidiNoteOn46:
	Button46(midi.MidiIn())
return
Button46(mido){
Global mode1, mode2
	if (mido.velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{PgDn}")
	}
}

MidiNoteOn79:
Button47(midi.MidiIn())
return
MidiNoteOn63:
Button47(midi.MidiIn())
return
MidiNoteOn47:
Button47(midi.MidiIn())
return
Button47(mido){
Global mode1, mode2
	if (mido.velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{PgUp}")
	}
}

MidiNoteOn82:
Button50(midi.MidiIn())
return
MidiNoteOn66:
Button50(midi.MidiIn())
return
MidiNoteOn50:
Button50(midi.MidiIn())
return
Button50(mido){
global mode1, mode2
	if (mido.velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{Numpad0}")
	}
}

MidiNoteOn83:
Button51(midi.MidiIn())
return
MidiNoteOn67:
Button51(midi.MidiIn())
return
MidiNoteOn51:
Button51(midi.MidiIn())
return
Button51(mido){
global mode1, mode2
	if (mido.velocity > 0
	and mode1 == 0 and mode2 == 0) {
		Cooldown("{NumpadEnter}")
	}
}

Coolswitch1(note,note1,note2,note3){
	Global estado
	setKeyDelay 10,40
	Global time_since_last
	Global mode1, mode2
	if (note1 == 0){
		note1 := note
	}
	
	if (mode1 > 0 or mode2 > 0) {
	if(A_TickCount - time_since_last > 200){
		if (estado[note] == 0) {
			estado[note] := 65
			midi.MidiOut("N1", 10, note1, 65)
			if (note2 > 0){
				midi.MidiOut("N1", 10, note2, 65)
				if (note3 > 0){
					midi.MidiOut("N1", 10, note3, 65)
				}
			}
			if (mode1 > 0) {
				labelName:="NoteBoth" note
				If IsFunc( labelName )
					%labelName%()
				labelName:="NoteOn" note
				If IsFunc( labelName )
					%labelName%()
			}
		} else {
			estado[note] := 0
			if (note2 > 0){
				midi.MidiOut("N1", 10, note2, 0)
				if (note3 > 0){
					midi.MidiOut("N1", 10, note3, 0)
				}
			}
			if (mode1 > 0) {
				labelName:="NoteBoth" note
				If IsFunc( labelName )
					%labelName%()
				labelName:="NoteOff" note
				If IsFunc( labelName )
					%labelName%()
			}
		}
		time_since_last := A_TickCount
	} else {
		midi.MidiOut("N1", 10, note1, estado[note])
	}	} else {
		midi.MidiOut("N1", 10, note1, estado[note])
	}
}

Coolswitch2(note,note1,note2,note3){
	Global estado
	setKeyDelay 10,40
	Global time_since_last
	if (note1 == 0){
		note1 := note
	}
	
	if(A_TickCount - time_since_last > 200){
		if (estado[note] == 0) {
			estado[note] := 65
			midi.MidiOut("N1", 10, note1, 65)
			if (note2 > 0){
				midi.MidiOut("N1", 10, note2, 65)
				if (note3 > 0){
					midi.MidiOut("N1", 10, note3, 65)
				}
			}
			labelName:="NoteBoth" note
			If IsFunc( labelName )
				%labelName%()
			labelName:="NoteOn" note
			If IsFunc( labelName )
				%labelName%()
		} else {
			estado[note] := 0
			if (note2 > 0){
				midi.MidiOut("N1", 10, note2, 0)
				if (note3 > 0){
					midi.MidiOut("N1", 10, note3, 0)
				}
			}
			labelName:="NoteBoth" note
			If IsFunc( labelName )
				%labelName%()
			labelName:="NoteOff" note
			If IsFunc( labelName )
				%labelName%()
		}
		time_since_last := A_TickCount
	} else {
		midi.MidiOut("N1", 10, note1, estado[note])
	}
}

MidiNoteOff48:
	Coolswitch1(48,0,0,0)
return
NoteBoth48(){
	ControlSend, , {NumpadMult}, ahk_class X-System
}

MidiNoteOff49:
	Coolswitch1(49,0,0,0)
return
NoteBoth49(){
	ControlSend, , {NumpadDiv}, ahk_class X-System
}

MidiNoteOff82:
	Coolswitch1(50,82,66,50)
return
MidiNoteOff66:
	Coolswitch1(50,66,50,82)
return
MidiNoteOff50:
	Coolswitch1(50,50,66,82)
return
NoteBoth50(){
	ControlSend, , {Numpad0}, ahk_class X-System
}

MidiNoteOff83:
	Coolswitch1(51,83,67,51)
return
MidiNoteOff67:
	Coolswitch1(51,67,51,83)
return
MidiNoteOff51:
	Coolswitch1(51,51,67,83)
return
NoteBoth51(){
	ControlSend, , {NumpadEnter}, ahk_class X-System
}

MidiNoteOff78:
	Coolswitch1(46,78,62,46)
return
MidiNoteOff62:
	Coolswitch1(46,62,46,78)
return
MidiNoteOff46:
	Coolswitch1(46,46,62,78)
return
NoteBoth46(){
	ControlSend, , {PgDn}, ahk_class X-System
}

MidiNoteOff79:
	Coolswitch1(47,79,63,47)
return
MidiNoteOff63:
	Coolswitch1(47,63,47,79)
return
MidiNoteOff47:
	Coolswitch1(47,47,63,79)
return
NoteBoth47(){
	ControlSend, , {PgUp}, ahk_class X-System
}


MidiNoteOff74:
	Coolswitch2(42,74,58,42)
return
MidiNoteOff58:
	Coolswitch2(42,58,42,74)
return
MidiNoteOff42:
	Coolswitch2(42,42,58,74)
return
NoteOff42(){
	global mode1 := 0
}
NoteOn42(){
	global mode1 := 1
}

MidiNoteOff75:
	Coolswitch2(43,75,59,43)
return
MidiNoteOff59:
	Coolswitch2(43,59,43,75)
return
MidiNoteOff43:
	Coolswitch2(43,43,59,75)
return
NoteOff43(){
	global mode2 := 0
}
NoteOn43(){
	global mode2 := 1
}

; EXTRA

MidiNoteOn36:
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("e")
		} else {
			Cooldown("z")
		}
	}
return

MidiNoteOn37:
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("r")
		} else {
			Cooldown("x")
		}
	}
return

MidiNoteOn38:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("c")
		} else {
			Cooldown("d")
		}
	}
return

MidiNoteOn39:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("v")
		} else {
			Cooldown("^d")
		}
	}
return

MidiNoteOn54:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("e")
		} else {
			Cooldown("d")
		}
	}
return

MidiNoteOn55:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("r")
		} else {
			Cooldown("^d")
		}
	}
return

MidiNoteOn70:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("^e")
		} else {
			Cooldown("d")
		}
	}
return

MidiNoteOn71:
Global mode1, mode2
	if (midi.MidiIn().velocity > 0) {
		if (mode2 > 0) {
			Cooldown("^r")
		} else {
			Cooldown("^d")
		}
	}
return
