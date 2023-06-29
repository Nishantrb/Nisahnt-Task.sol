// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// chainlink interface is been feached to take same interface like chainlink
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract nUSD {
    string  name;
    uint256 public totalSupply;

    mapping(address => uint256)  balanceOf;
    mapping(address => uint256)  nUSDToRedeem;
    mapping(address => uint256) public balances;

    AggregatorV3Interface   ethOracle;

    event Deposit(address indexed depositor, uint256 amountETH, uint256 amountnUSD);
    event Redeem(address indexed redeemer, uint256 amountnUSD, uint256 amountETH);

    constructor() {
        name = "nUSD Stablecoin";
        ethOracle = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function deposit()  external payable {
        require(msg.value > 0, "Amount must be greater than 0");

        uint256 ethPrice = getETHPrice();
        uint256 amountnUSD = msg.value * ethPrice / 2;

        balanceOf[msg.sender] += amountnUSD;
        totalSupply += amountnUSD;


        emit Deposit(msg.sender, msg.value, amountnUSD);
    }

    function redeem(uint amountnUSD) external  {
        require(balanceOf[msg.sender] >= amountnUSD, "Insufficient nUSD balance");

        uint256 ethPrice = getETHPrice();
        uint256 amountETH = amountnUSD * 2 / ethPrice;

        require(address(this).balance >= amountETH, "Insufficient ETH balance");

        balanceOf[msg.sender] -= amountnUSD;
        totalSupply -= amountnUSD;
        nUSDToRedeem[msg.sender] += amountnUSD;

        emit Redeem(msg.sender, amountnUSD, amountETH);
    }

    function claimETH() external   {
        require(nUSDToRedeem[msg.sender] > 0, "No nUSD to redeem");

        uint256 amountETH = nUSDToRedeem[msg.sender] * 2 / getETHPrice();

        delete nUSDToRedeem[msg.sender];
        payable(msg.sender).transfer(amountETH);
    }

    function getETHPrice() public  view returns (uint) {
        (, int ethPrice, , ,) = ethOracle.latestRoundData();
        return uint(ethPrice);
    }
}
