extends Label

func _ready():
	var tween = create_tween()
	tween.tween_interval(3.0)                          # show for 3 s
	tween.tween_property(self, "modulate:a", 0.0, 1.0) # fade out over 1 s
	tween.tween_callback(queue_free)                   # remove afterwards
