extends CharacterBody2D

enum {
	IDLE,
	ATTACK,
	CHACE
}

var state: int = 0:
	set(value):
		state = value
		match state:
			IDLE:
				idle_state()
			ATTACK:
				attack_state()

@onready var animPlayer = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var direction
var damage = 20

func _ready() -> void:
	Signals.connect("player_position_update", Callable(self, "_on_player_position_update"))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if state == CHACE:
		chace_state()
	move_and_slide()

func _on_player_position_update(player_pos):
	player = player_pos


func _on_attack_range_body_entered(_body: Node2D) -> void:
	state = ATTACK
	
func idle_state():
	animPlayer.play("Idle")
	await get_tree().create_timer(1).timeout
	$AttacDirection/AttackRange/CollisionShape2D.disabled = false
	state = CHACE
	
func attack_state():
	animPlayer.play("Attack")
	await animPlayer.animation_finished
	$AttacDirection/AttackRange/CollisionShape2D.disabled = true
	state = IDLE

func chace_state():
	direction = (player - self.position).normalized()
	if direction.x < 0:
		sprite.flip_h = true
		$AttacDirection.scale.x = -1
	else:
		sprite.flip_h = false
		$AttacDirection.scale.x = 1





func _on_hit_box_area_entered(_area: Area2D) -> void:
	Signals.emit_signal("enemy_atack", damage)
