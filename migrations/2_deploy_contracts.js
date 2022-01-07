//Import Contract
const DStorage = artifacts.require("DStorage");

module.exports = function (deployer) {
	deployer.deploy(DStorage);
};