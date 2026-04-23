# RareSkills Solidity Exercises: my solutions

This repository contains my personal solutions and progress through the **RareSkills Ultimate Solidity Course**.

### **Attribution & License**

* **Curriculum & Exercises:** All original content and educational materials are owned by RareSkills LLC.
* **License:** This project is a derivative work provided under the **Business Source License 1.1**. Per the license terms, it is scheduled to convert to **GNU GPL v3.0 or later** on **2027-01-01**.
* **My Role:** I use this repository to document my solutions to the official [RareSkills/Solidity-Exercises](https://github.com/RareSkills/Solidity-Exercises) codebase. 

 --- 
This is a set of exercises accompanies the RareSkills [learn solidity](https://rareskills.io/learn-solidity) tutorial so you can learn Solidity by doing bite-sized exercises. It's intended for experienced programmers who want to get the the point quickly and immediately practice what they learn.

## Installation

Install foundry

```
curl -L https://foundry.paradigm.xyz | bash
```

Clone this repository

```
git clone https://github.com/rareSkills/solidity-exercises.git
```

Complete the exercises in order and test with

```
cd <Problem Name>
forge test -vvv
```

for example, in the Add/ directory, open `src/Add.sol` and change the code so it compiles. The solution is

```solidity
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
```

Save your changes, then, in the same directory, test it with

```
forge test -vvv
```

## Test all
```bash
bash test.sh
```
