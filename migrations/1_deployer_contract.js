const Faucet = artifacts.require("Faucet")

module.exports = async function(deployer){
    // Replace  0x8B573DFd9120A434f13A65dADaeca00885e33108 with your personal address
    await deployer.deploy(Faucet, "0x8B573DFd9120A434f13A65dADaeca00885e33108")
}