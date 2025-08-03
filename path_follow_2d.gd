extends PathFollow2D


@export var speed = .002
@export var start = 0.00
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_ratio += start


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += speed
