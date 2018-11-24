extends Sprite

onready var attack_label = $AttackLabel
onready var health_label = $HealthLabel

var attack
var health

func set_details(a, h):
	attack = a
	health = h
	
	attack_label.text = str(attack)
	health_label.text = str(health)