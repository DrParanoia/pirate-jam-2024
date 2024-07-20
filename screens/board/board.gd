extends Node2D

var dragged_card: Node2D = null
var drag_offset: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.dragged_card != null:
		self.dragged_card.position = get_viewport().get_mouse_position() - drag_offset


func _on_node_2d_drag_start(card: Node2D) -> void:
	drag_offset = get_viewport().get_mouse_position() - card.position
	self.dragged_card = card


func _on_node_2d_drag_end(card: Node2D) -> void:
	self.dragged_card = null
