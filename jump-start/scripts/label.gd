extends Label

var score = 0

func add_point():
	score += 1
	self.text = "You collected " + str(score) + " coins." 
	if score == 5:
		self.text = "Congrats! You finished the game."
