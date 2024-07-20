extends CanvasLayer

var board_scene: PackedScene = preload("res://screens/board/board.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().size = Vector2i(1920, 1080)
	get_window().position += Vector2i(70, 70)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(board_scene)
