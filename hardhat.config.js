require("@nomiclabs/hardhat-waffle");
const projectId = '68798d4af3a14bc3a05c33c3245d6a89'

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhart: {
      chainId: 1337,
    },
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: []
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${projectId}`,
      accounts: []
    }
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};
