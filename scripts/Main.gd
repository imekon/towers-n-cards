extends Node2D

onready var RedSquare = load("res://scenes/RedSquareCard.tscn")
onready var GreenSquare = load("res://scenes/GreenSquareCard.tscn")
onready var BlueSquare = load("res://scenes/BlueSquareCard.tscn")

onready var RedUnit = load("res://scenes/RedSquareUnit.tscn")
onready var GreenUnit = load("res://scenes/GreenSquareUnit.tscn")
onready var BlueUnit = load("res://scenes/BlueSquareUnit.tscn")

onready var PlayerTower = load("res://scenes/PlayerTower.tscn")
onready var EnemyTower = load("res://scenes/EnemyTower.tscn")

const player_hand_y = 770

var pack1 = []
var pack2 = []
var hand1 = []
var hand2 = []

var player_tower
var enemy_tower

var offscreen = Vector2(-300, 300)

func _ready():
	randomize()
	
	pack1 = create_pack()
	pack2 = create_pack()
	
	deal_cards(pack1, hand1, 5)
	deal_cards(pack2, hand2, 5)
	
	player_tower = PlayerTower.instance()
	add_child(player_tower)
	player_tower.position = get_unit_position(1, 3)
	
	enemy_tower = EnemyTower.instance()
	add_child(enemy_tower)
	enemy_tower.position = get_unit_position(9, 3)
	
	show_cards(hand1)
	show_units()
	
func create_pack():
	var pack = []
	
	for i in range(4):
		var card = RedSquare.instance()
		add_child(card)
		card.set_details(1, 1, 1)
		card.position = offscreen
		pack.append(card)
		
	for i in range(4):
		var card = GreenSquare.instance()
		add_child(card)
		card.set_details(2, 1, 2)
		card.position = offscreen
		pack.append(card)
		
	for i in range(4):
		var card = BlueSquare.instance()
		add_child(card)
		card.set_details(2, 2, 2)
		card.position = offscreen
		pack.append(card)
		
	pack.shuffle()
		
	return pack
	
func deal_card(pack, hand):
	var card = pack.pop_front()
	hand.append(card)
	
func deal_cards(pack, hand, count):
	for i in range(count):
		deal_card(pack, hand)
	
func show_cards(hand):
	var x = 200
	var i = 0
	for card in hand:
		card.position = Vector2(x + 225 * i, player_hand_y)
		i += 1
		
func get_unit_position(x, y):
	var vec = Vector2(x * 72 + 296, y * 72 + 120)
	return vec
		
func show_units():
	var unit = RedUnit.instance()
	add_child(unit)
	unit.position = get_unit_position(1, 1)
	
