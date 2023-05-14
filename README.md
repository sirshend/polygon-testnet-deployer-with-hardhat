
# Deploying multiple smart-contracts on Polygon testnet using Hardhat
----------------------------------------------------------------------

Instead of just ```git clone```-ing this repo, follow the steps listed below to build the deployer. 

## Sign-up for a free alchemy account: 


If you follow the tutorials available online, you will find several rpc endpoints for the polygon testnet(The polygon testnet is known as "mumbai"). Common ones include https://rpc-mumbai.maticvigil.com , https://matic-mumbai.chainstacklabs.com etc. It isn't obvious which rpc endpoint is working right now, and at the time of writing, I couldn't make either of these 2 work. So it is better to get a free custom endpoint from Alchemy. 

This endpoint from Alchemy will connect to out Metamask wallet's account on the Mumbai testnet, and we will use the account & network details while deploying. Here is a link to Alchemy.[https://www.alchemy.com] Click on signup on upper-right corner. It's free.

Once you signup, you go to Apps on top, and notice a default app has already been deployed. Select the ```+CREATE APP``` option. 

<p align="center">
<img width="800" height="400" alt="Screenshot 2023-05-14 at 7 35 20 pm" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/e7383688-6a7f-4562-b698-c98891ed3561">
</p>

Give whatever suitable name or description you want, but choose ```Polygon POS``` and ```Polygon Mumbai``` as shown. Then click ```CREATE APP```.
Once this app is created and shows up on the dashboard, click on the ```VIEW KEY``` option of the app(on its right)

<p align="center">
<img width="800" height="400" alt="Screenshot 2023-05-14 at 7 43 01 pm" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/af1b2a5b-bf88-4594-9169-0ec23d662a12">
</p>

Notice the HTTPS. For me it is https://polygon-mumbai.g.alchemy.com/v2/O0EMJRcLcIBcKXb37aQ0pYbHxj0mpSok . 
This will be rpc endpoint for us. We will use this while setting up a custom metamask wallet for the polygon testnet. We will also need this along with the metamask account details in our Hardhat project while building the deployer. 

This also should be kept secret while working with the mainnet and not revealed. But since this is just a testnet and with just fake coins, I can reveal it. Now, let's setup a wallet on testnet using metamask. 


## Setting up a Metamask wallet for polygon testnet: 


Login to your metamask account on your preffered browser(Metamask works on either edge/chrome/brave/firefox. I am using Edge here. Metamask doesn't work on Safari).

<!-- To force these two rows of 3 images to be in same line, try enclosing these image src files with <div style="display:flex; justify-content:center;"> </div> -->
<img width="300" height="300" alt="Screenshot 2023-05-15 at 12 17 55 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/fdef50df-adb7-4e66-996b-7123af8cb789">
<img width="400" height="300" alt="Screenshot 2023-05-15 at 12 18 17 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/33901081-0245-4c8e-868f-cc9e09b197be">
<img width="300" height="300" alt="Screenshot 2023-05-15 at 12 19 50 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/a773b6a5-eb30-42cc-8b37-1ece7f846885">


First click on the drop-down list in the upper middle portion of your metamask wallet. By default it should be "Ethereum" main-net. In the list, choose ```Add network``` 

In the next screen that opens, choose ```Add a network manually``` (at the bottom of the screen)

Next, add whatever name you want to give to your network.

In ```New RPC URL```, you need to copy the HTTPS you got in ```view key``` for the new app you created on alchemy. For me it was https://polygon-mumbai.g.alchemy.com/v2/O0EMJRcLcIBcKXb37aQ0pYbHxj0mpSok . So I will paste that here. 

Chain ID for Polygon Mumbai testnet is 80001, so put enter 80001 there.(Don't put 80001 within double quotes)
Currency Symbol: Just type MATIC (again don't put MATIC within doublq quotes)
For Block explorer URL: Enter https://mumbai.polygonscan.com


## Getting the private key of our metamask wallet:


We need the private key to store it a ```.env``` file in our hardhat project later. 

<img width="300" height="300" alt="Screenshot 2023-05-15 at 12 20 18 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/de353005-fe78-495d-8f55-f79b8f973953">
<img width="300" height="300" alt="Screenshot 2023-05-15 at 12 21 04 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/dc0534c0-eae9-4cdb-b233-bdf99446511c"> 
<img width="400" height="300" alt="Screenshot 2023-05-15 at 12 20 41 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/1b62ec9b-9130-4750-b8ec-eedbd44c0ab6">




## Getting free MATIC tokens from faucet:


Also you need some MATIC tokens to deploy the smart contracts. Don't worry!!
Since we are going to use the Polygon testnet, we will be using fake money(tokens), and won't be required to pay any money.
The token for Polygon testnet is named ```MATIC```.

Go to https://mumbaifaucet.com .
Signup/login with the same gmail-ID or way you did while signing up to alchemy.
Paste your metamask wallet id and get MATIC tokens for free. 

This will give you for free about 1 ether worth in MATIC tokens(the values are all fake and so don't matter).
This should be enough for the deploying your smart contracts.
This faucet can give you free MATIC tokens only once in 24 hours. 

Try other online faucets which give free tokens for testnet development purposes. 


## Setting up Hardhat: 


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
Use the ```--yes``` option. This will make it easier for you and start with a boilerplate version ready for development. You don't have to make tonnes of choices for customisation of the node project right at the beginning.

Now we need to download the hardhat package and some other necessaary dependendies. 
```
npm install --save-dev hardhat
```
Ensure that we are in the project root directory (i.e. ```polygon-testnet-deployer-with-hardhat``` ) during all this. 
```
~$pwd
~/Users/sirshendu/codes/polygon-testnet-deployer-with-hardhat
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
Hardhat project root: · /Users/sirshendu/codes/polygon-testnet-deployer-with-hardhat
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
Now, we are done with HardHat setup. You will find some files and folders have automatically got created by hardhat during the installation process. Let's change some of these files to build the deployer. 


## Buidling the deployer:


You will see that there's a smart-contract by default already under ```contracts``` folder. For me, it is ```Lock.sol```. 
Add whatever solidity smart-contracts you wish to deploy to this ```contracts``` folder, just as I have added ```SimpleContract.sol``` there. 

Now, there are 3 files we need to change to finish the deployer, viz. 

```
1) .env in project root 
2) deploy.js in scripts folder 
3) hardhat.config.js in project root 
```
Let's change the ```.env``` file first. Paste these 2 lines. 
```
API_URL=https://polygon-mumbai.g.alchemy.com/v2/O0EMJRcLcIBcKXb37aQ0pYbHxj0mpSok
PRIVATE_KEY=04a3b016a520eef9cad99798cd047181e254db2eccc75bc7c68297865a91a253
```
Notice that the API_URL is the same as the HTTPS we copied from alchemy. 
And the PRIVATE_KEY is the one we copied from metamask during setting up of the wallet. 

**IMPORTANT: Do NOT use double quotes**. 

These are not normal strings. 

Also since ```.env``` is in ```.gitignore```, these details won't be pushed to your github. 

Now, let's change ```hardhat.config.js```. This will hold our network configurations and other details.
Delete whatever there is in ```hardhat.config.js``` with ```Ctrl+A``` and Delete. 
Then paste this

```javascript
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const { API_URL, PRIVATE_KEY } = process.env;
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    mumbai: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    }

  }
};
```

Here ```require("dotenv").config();``` helps us to export/use the values of ```API_URL``` & ```PRIVATE_KEY``` which we later use in 
```const { API_URL, PRIVATE_KEY } = process.env;```

Also look at the snippet below:
```javascript
networks: {
    mumbai: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    }

  }
```
Here we are naming the network we will be using, and use this to make the connection to testnet using our wallet account during deployment. 

Finally look at ```deploy.js```

Since we have 2 contracts, ```Lock.sol``` & ```SimpleContract.sol```, we have used ```.deploy()``` twice in this script. 
Let's look at Lock's portion of the deployment code first inside ```async function main()```

```javascript
const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;
  const lockedAmount = hre.ethers.utils.parseEther("0.001");
  const Lock = await hre.ethers.getContractFactory("Lock");
  const lock = await Lock.deploy(unlockTime, { value: lockedAmount });
  await lock.deployed();
  console.log(
    `Lock with ${ethers.utils.formatEther(
      lockedAmount
    )}ETH and unlock timestamp ${unlockTime} deployed to ${lock.address}`
  );
```
We need the first 3 lines, i.e. setting values for  ```currentTimestampInSeconds```, ```unlockTime```, and  ```lockedAmount``` because these values are needed for initialising the variables of the constructor in ```Lock.sol```. If your contract's constructor doesn't have such inputs, then you can leave them empty. 

After that, ```const Lock = await hre.ethers.getContractFactory("Lock");```. ```getContractFactory("Lock")``` selects the solidity file named ```Lock``` from the contracts folder. Instead of ```"Lock"``` in ```getContractFactory("Lock")```, place whatever the name of the contract that you have added to ```contracts``` folder and that you wish to deploy. Also choose meaningful names for the ```const lock``` and ```const Lock``` local variables. 

In ```const lock = await Lock.deploy(unlockTime, { value: lockedAmount });```, ```.deploy()``` function actually deploys it to the testnet, along with the parameters for initializing the contract's constructor and other values. If your contract doesn't have arguments, then you don't have to pass anything to deploy. 


Similarly, if you look at ```SimpleContract```'s section of the deployment:

```javascript  
  let message = "hello world";
  const SimpleContract = await ethers.getContractFactory("SimpleContract");
  const simpleContract = await SimpleContract.deploy(message);
  await simpleContract.deployed();
  console.log(`SimpleContract with default message: ${message} deployed to: ${simpleContract.address}`);
}
```

Notice in ```contracts/SimpleContract.sol```, its constructor has to take a string input, which is used to set the value ```string public message;```. 
```solidity
//file contracts/SimpleContract.sol

pragma solidity ^0.8.9;
import "hardhat/console.sol";
contract SimpleContract {
    string public message;
    constructor(string memory initialMessage) {
        message = initialMessage;
    }
    
    function setMessage(string memory newMessage) public {
        console.log("This smart contract's constructor was initialised with messafe %o . You can set your new message here with this function", message);
        message = newMessage;
    }
}
```
So once again we initialise this string in ```let message = "hello world"```.
Then, we pick this contract by its name using ```.getContractFactory("SimpleContract")```
After that we deploy it using ```.deploy()``` and pass the constructor arguments to deploy in ```.deploy(message)```.


So, basically if you want to add any number of contracts and wish to deploy them:
1. Add them to the ```contracts``` folder. 
2. Change this ```scripts/deploy.js``` file by adding these few lines at the end of the main() function.
3. First initialize the variables that need to be passed to the contract's constructor.
4. Then pick the contract by its name using ```.getContractFactory("type your contract's name here")```
5. Then deploy it using ```.deploy()``` and pass the constructor parameters to the deploy function. 

Once each of the contract's in your folder are deployed, i.e. ```await simpleContract.deployed();``` is over for each of the contracts individually; then 
```javascript
  console.log(`SimpleContract with default message: ${message} deployed to: ${simpleContract.address}`);
```
This line will print the address where this contract is deployed. 


## Compiling these contracts and deploying:


Compile all the contracts in your folder with 
```
npx hardhat compile
```

Then finally deploy these contracts with 
```
npx hardhat run scripts/deploy.js --network mumbai
```

Here it uses the ```scripts/deploy.js``` to deploy each of the contracts described in ```deploy.js```. 
Also ```--network mumbai``` uses the network details of testnet mentioned in ```hardhat.config.js```

If deployment is successful, you will see messages like this:

```
Lock with 0.001ETH and unlock timestamp 1684080050 deployed to 0x348e5b189B7bAce083984c5F14220e8F456cBb28
SimpleContract with default message: hello world deployed to: 0x9605086405BbAC07A1FE7F9D8C838ec94fFB51E8
```

Exact message on the terminal depends on how you setup the ```console.log()```s in ```deploy.js```


**You have SUCCESSFULLY deployed all you smartcontracts**.

You can now go to [mumbai.polygonscan.com](https://mumbai.polygonscan.com) or your metamask wallet or your alchemy dashboard and can see the deployed smartcontract.
You can enter the address to which a particular contract has been deployed(which you saw in output during running ```npx hardhat run scripts/deploy.js --network mumbai```) in https://mumbai.polygonscan.com . 

<p align="center">
<img width="800" height="400" alt="Screenshot 2023-05-15 at 1 11 48 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/d0feaf3c-fce7-4619-89d6-f39b9dcaabd4">
</p>

You can also enter your metamask account address here to check transcations, account balance etc. 

<p align="center">
<img width="800" height="400" alt="Screenshot 2023-05-15 at 1 12 05 am" src="https://github.com/sirshend/polygon-testnet-deployer-with-hardhat/assets/28855132/52219330-a01d-49fc-aab1-ca064e85f9c5">
</p>


### To do:

Make this whole thing work with just https://rpc-mumbai.maticvigil.com or https://matic-mumbai.chainstacklabs.com; without using alchemy.
Find a way to track the latest rpc endpoint active. 
Does adding ```wss://``` instead of ```https://``` to https://rpc-mumbai.maticvigil.com etc solve it? Need to try this out.

