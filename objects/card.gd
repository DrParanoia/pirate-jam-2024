extends Node2D

signal drag_start(card: Node2D)
signal drag_end(card: Node2D)

var is_cursor_inside: bool = false
var is_dragged: bool = true

@onready var pick_up_audio: AudioStreamPlayer2D = $PickUpAudio
@onready var put_down_audio: AudioStreamPlayer2D = $PutDownAudio

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func on_drag_start() -> void:
	self.is_dragged = true
	self.drag_start.emit(self)

	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)

	pick_up_audio.play()

func on_drag_end() -> void:
	self.is_dragged = false
	self.drag_end.emit(self)

	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUART)

	put_down_audio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_cursor_inside and Input.is_action_just_pressed("left_click"):
		self.on_drag_start()
	elif is_dragged and Input.is_action_just_released("left_click"):
		self.on_drag_end()

func _on_area_2d_mouse_entered() -> void:
	self.is_cursor_inside = true


func _on_area_2d_mouse_exited() -> void:
	self.is_cursor_inside = false
