const ingToken = artifacts.require("ingToken");

module.exports = function (deployer) {
  deployer.deploy(ingToken, "ingtoken", "itk", 3000);
};
