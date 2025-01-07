"""
##### SESSÃO DE COMENTÁRIOS
"""

extends Node

var LoadScreenPath: String = "res://tela_carregamento.tscn"
var loadSreen = load(LoadScreenPath)
var loadResource: PackedScene
var scenePath: String
var localProcess: Array = []
var useSubThreads: bool = true
var timerTimeOut: bool = false
var didLoadeRes: bool = false

signal processChanged(progress)
signal loadDone

func loadScene(scene_path: String):
	scenePath = scene_path
	var newLoadingScreen = loadSreen.instatiate()
	get_tree().get_root().add_child(newLoadingScreen)
	
	processChanged.connect(newLoadingScreen.updateProgressbar)
	loadDone.connect(newLoadingScreen.loadDone)
	
	get_tree().create_timer(1.8)
	startLoad()

func startLoad():
	var state = ResourceLoader.load_threaded_request(scenePath, "", useSubThreads)
	if state == OK:
		set_process(true)
		
func _process(_delta):
	var load_status = ResourceLoader.load_threaded_get_status(scenePath, localProcess)
	match load_status:
		0, 2:
			set_process(false)
			return		
		
		1:
			emit_signal("processChanged", localProcess[0])
		
		2:
			loadResource = ResourceLoader.load_threaded_get(scenePath)
			emit_signal("processChanged", 1.0)
			emit_signal("loadDone")
			get_tree().change_scene_to_packed(loadResource)
