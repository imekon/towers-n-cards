extends Sprite

onready var cost_label = $CostLabel
onready var attack_label = $AttackLabel
onready var health_label = $HealthLabel
onready var symbol = $Symbol

var attack
var health
var cost

func set_details(a, h, c):
	cost = c
	attack = a
	health = h

	cost_label.text = str(cost)
	attack_label.text = str(attack)
	health_label.text = str(health)