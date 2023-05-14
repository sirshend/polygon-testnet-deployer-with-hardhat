
# Deploying multiple smart-contracts on Polygon testnet using Hardhat

Instead of just ```git clone```ing this repo, follow the steps listed below to build the deployer. 

## Sign-up for a free alchemy account 

If you follow the online tutorials, you will find several rpc endpoints for the polygin testnet(The polygon testnet is known as "mumbai"). Common ones include ```https://rpc-mumbai.maticvigil.com``` , ```https://matic-mumbai.chainstacklabs.com``` etc. It isn't obvious which rpc endpoint is working right now, and at the time of writing, I couldn't make either of these 2 work. So it is better to get a free custom endpoint from Alchemy. 

This endpoint from Alchemy will connect to out Metamask wallet's account on the Mumbai testnet, and we will use the account & network details while deploying. Here is a link to Alchemy.[https://www.alchemy.com] Click on signup on upper-right corner. It's free.

Once you signup, you go to Apps on top, and notice a default app has already been deployed. Select the ```+CREATE APP``` option. 

<img width="801" alt="Screenshot 2023-05-14 at 7 35 20 pm" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/e7383688-6a7f-4562-b698-c98891ed3561">

Give whatever suitable name or description you want, but choose ```Polygon POS``` and ```Polygon Mumbai``` as shown. Then click ```CREATE APP```


## Section 2

Here's some code in Python:

```python
def add_numbers(a, b):
    return a + b
```
## Section 3

Here's some text describing the second section.

![Alt text](path/to/another/image.jpg "Optional title")

## Conclusion

Here's some text wrapping up the content of the file.
