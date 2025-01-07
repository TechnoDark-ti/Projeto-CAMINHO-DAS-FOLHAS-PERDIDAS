"""
##### SESSÃO DE COMENTÁRIOS
"""

extends  Control

@onready var progressBar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer

var canContinue: bool = false
var shouldFree: bool = false

func updateProgressBar(newVal: float):
	progressBar.set_value_no_signal(newVal * 100)
	
func loadDone():
	if canContinue:
		call_deferred("queue_free")
	else:
		shouldFree = true
		
func _on_timer_timeout():
	if shouldFree:
		call_deferred("queue_free")
	canContinue = true		
		
