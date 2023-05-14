
# Deploying multiple smart-contracts on Polygon testnet using Hardhat

Instead of just ```git clone```ing this repo, follow the steps listed below to build the deployer. 

## Sign-up for a free alchemy account 

If you follow the online tutorials, you will find several rpc endpoints for the polygin testnet(The polygon testnet is known as "mumbai"). Common ones include ```https://rpc-mumbai.maticvigil.com``` , ```https://matic-mumbai.chainstacklabs.com``` etc. It isn't obvious which rpc endpoint is working right now, and at the time of writing, I couldn't make either of these 2 work. So it is better to get a free custom endpoint from Alchemy. 

This endpoint from Alchemy will connect to out Metamask wallet's account on the Mumbai testnet, and we will use the account & network details while deploying. Here is a link to Alchemy.[https://www.alchemy.com] Click on signup on upper-right corner. It's free.

Once you signup, you go to Apps on top, and notice a default app has already been deployed. Select the ```+CREATE APP``` option. 

<img width="700" alt="Screenshot 2023-05-14 at 7 35 20 pm" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/e7383688-6a7f-4562-b698-c98891ed3561">

Give whatever suitable name or description you want, but choose ```Polygon POS``` and ```Polygon Mumbai``` as shown. Then click ```CREATE APP```.
Once this app is created and shows up on the dashboard, click on the ```VIEW KEY``` option of the app(on its right)

<img width="700" alt="Screenshot 2023-05-14 at 7 43 01 pm" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/af1b2a5b-bf88-4594-9169-0ec23d662a12">

Notice the HTTPS. For me it is https://polygon-mumbai.g.alchemy.com/v2/O0EMJRcLcIBcKXb37aQ0pYbHxj0mpSok . 
This will be rpc endpoint for us. We will use this while setting up a custom metamask wallet for the polygon testnet. We will also need this along with the metamask account details in our Hardhat project while building the deployer. 

This also should be kept secret while working with the mainnet and not revealed. But since this is just a testnet and with just fake coins, I can reveal it. Now, let's setup a wallet on testnet using metamask. 

## Setting up a Metamask wallet for polygon testnet 



## Setting up Hardhat and buidling the deployer. 

You need node and npm installed. Download their latest versions. 
Make a new directory for the deployer. 
```
mkdir polygon-testnet-deployer-with-hardhat
cd polygon-testnet-deployer-with-hardhat
```


Here's some code in Python:

```python
def add_numbers(a, b):
    return a + b
```

