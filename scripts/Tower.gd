extends Node2D

onready var sprite = $Sprite
onready var attack_label = $AttackLabel
onready var health_label = $HealthLabel

export var color = Color(1, 1, 1)

var attack
var health

func _ready():
	sprite.modulate = color

func set_details(a, h):
	attack = a
	health = h
	attack_label.text = str(attack)
	health_label.text = str(health)
