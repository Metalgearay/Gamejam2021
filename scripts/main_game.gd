extends Node2D
var Mob = load("res://enemy.tscn")
var rng = RandomNumberGenerator.new()

var just_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if just_started:
		_on_MobTimer_timeout()
		just_started = false
		$Ship.position = $StartPosition.position

func _on_MobTimer_timeout():
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	mob.position =  Vector2(rng.randfn(300,50),-100)
	mob.set_direction(Vector2(0,100))
	get_parent().call_deferred("add_child",mob)
	var mob2 = Mob.instance()
	mob2.position =  Vector2(rng.randfn(460,50),-100)
	mob2.set_direction(Vector2(0,100))
	get_parent().call_deferred("add_child",mob2)
