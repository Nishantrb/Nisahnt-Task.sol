# Nisahnt-Task.sol
@ FOR RUNNIN CODE 
   NEED TO DEPLOY IN ANY TEST NET WHICH ACCOUNT HAVE TEST ETH
   SELECT ACCOUNT ADDRES WHICH HAVE TO CONVERT THERE ETH 
   NOW DEPOSIT BUTTON
   THEN WE CAN CHECK THE TOTAL SUPPLY AND BALANCE TO PERTICULAR ADDRESS
   TO REEDEM BACK PUT THE ADDRESS AND AMOUNT AND HIT REEDEM
   
   


@ DETAIL'S 

  THIS CONTRACT HAS FUNCTIONS OF DEPOSITING 
                                  REEDEM
                                  CHECK BALANCE
                                  GRT REAL TIME ETH PRICE
                                  TOTAL SUPPLY OF COIN

  getETHPrice IS THE FUNCTION WHERE WE CAN GET CURRENT PRICE OF ETH (NEED TO PUT JUST 8 DECIMAL AND WILL GET REAL TIME PRICE)
  REFRENCES OF PRICE https://data.chain.link/ethereum/mainnet/crypto-usd/eth-usd
  MAIN SOURCE "CHAINLINK" PRICE FEED FUNCTION
   msg.value * ethPrice / 2  THE PRICE IS ACCORDING TO THE PRICE OF ETH AND THEN GET HALF OF THAT
   TOTAL SUPPLY FUNCTION TRACK ALL OVER TOTAL OF THE DEPOSIT
   Using Proof of Reserve Feeds IS FROM CHAIN LINK WEBSIT "https://docs.chain.link/data-feeds/proof-of-reserve"
   
