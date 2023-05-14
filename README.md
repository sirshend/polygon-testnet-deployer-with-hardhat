
# Deploying multiple smart-contracts on Polygon testnet using Hardhat

Instead of just ```git clone```ing this repo, follow the steps listed below to build the deployer. 

## Sign-up for a free alchemy account 

If you follow the online tutorials, you will find several rpc endpoints for the polygon testnet(The polygon testnet is known as "mumbai"). Common ones include https://rpc-mumbai.maticvigil.com , https://matic-mumbai.chainstacklabs.com etc. It isn't obvious which rpc endpoint is working right now, and at the time of writing, I couldn't make either of these 2 work. So it is better to get a free custom endpoint from Alchemy. 

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
Inside this, create a minimal npm project. 
```
npm init --yes
```
Now we need to download the hardhat package and some other necessaary dependendies. 
Ensure that we are in the project root directory (i.e. ```polygon-testnet-deployer-with-hardhat``` ) during all this. 
```
npm install --save-dev hardhat
```
Once hardhat is installed, we have to start a hardhat project with the following command. 
```
npx hardhat
```
You will see something like this come up
```
What do you want to do? · Create a JavaScript project
```
There will be some other options, but choose the first one by pressing ```y``` . 
If you somehow mistakenly choose something else or fumble, you can press `y` on `quit` and it will return you back to the intial menu from where you can select the ```Create a JavaScript project``` again. 
Anyway, on clicking ```Create a JavaScript project```, you will find:

```
Hardhat project root: · /Users/sirshendu/codes/hardhat-1
Do you want to add a .gitignore? (Y/n) · y
Do you want to install this sample project's dependencies with npm (@nomicfoundation/hardhat-toolbox)? (Y/n) · y
```
Follow the prompt and choose the project root as selected by default and press ```y``` for the other two as well. 
This will also automatically download some extra hardhat related tools.
If you haven't pressed ```y``` in the last option, you can download them later with 
```
npm install --save-dev @nomicfoundation/hardhat-toolbox@^2.0.0
```
We need to download one further package, and then we are set. 
```
npm install dotenv --save
```
```dotenv``` will help us make a .env file which will contain the rpc endpoint we got from alchemy, as well as the private key of our metamask wallet. 
This ```.env``` file should be in the project root directory, along with ```.gitignore``` and other files and folders.
The ```.env``` file will be included in ```.gitignore``` along with hardhat caches and other hardhat artefacts. 
So while you are in project root directory, create a new env file with 
```bash
touch .env
```



Here's some code in Python:

```python
def add_numbers(a, b):
    return a + b
```

