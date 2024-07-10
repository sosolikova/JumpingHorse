extends "res://addons/gut/test.gd"

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1800

func create_mock_horse():
	var horse_scene = preload("res://scenes/horse.tscn")
	var horse = horse_scene.instantiate()
	return horse

func test_gravity():
	var horse = create_mock_horse()
	horse.velocity.y = 0
	horse._physics_process(1)
	assert_eq(horse.velocity.y, GRAVITY, "Gravity should be applied to velocity")
	
	
func run():
	test_gravity()
