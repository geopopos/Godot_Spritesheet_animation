extends Area2D

export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	var animation_name = ""
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animation_name = "walk_right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animation_name = "walk_left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		animation_name = "walk_down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		animation_name = "walk_up"
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimationPlayer.play(animation_name)
	else:
		$AnimationPlayer.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
