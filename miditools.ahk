

; MidiKnob interface
; for endless knob which returns values 0..127
; and if on left or right 0 or 127 gets repeated
; we call <name>left or <name>right if rotated
Class MidiKnob
{
  ; Instance creation
  __New(name)
  {
    this.prevalue:=65
    this.lastvalue:=65
    this.name:=name

  }

  ; Instance destruction
  __Delete()
  {

  }

	calledCc(midi,multiply){
		ccValue := midi.value
		if (ccValue>this.lastvalue){
			labelNameSuffix:="right"
		} else if (ccValue<this.lastvalue){
			labelNameSuffix:="left"
		}
		if (Abs(ccValue-this.lastValue)>=1/multiply){
			Suspend On
			this.prevalue:=this.lastvalue
			this.lastvalue:=ccValue
			loop % Abs(Floor(multiply*this.lastvalue-multiply*this.prevalue)){
				labelName:=this.name labelNameSuffix
				If IsFunc( labelName )
					%labelName%(this)
			} Suspend Off
		}
	}

  resetValue(){
    this.lastvalue:=65
    this.prevalue:=65
  }

}
