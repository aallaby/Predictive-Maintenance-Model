// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 7005
// Hash 3612
// Hash 6616
// Hash 4585
// Hash 3677
// Hash 2163
// Hash 3767
// Hash 5829
// Hash 9013
// Hash 4978
// Hash 4888
// Hash 3999
// Hash 4302
// Hash 8695
// Hash 9856
// Hash 3997
// Hash 6543
// Hash 4664
// Hash 6068
// Hash 6820
// Hash 6327
// Hash 8961
// Hash 7307
// Hash 8060
// Hash 8274
// Hash 5948
// Hash 5293
// Hash 5755
// Hash 5396
// Hash 3051
// Hash 1401
// Hash 5570
// Hash 9424
// Hash 8233
// Hash 6413
// Hash 6835
// Hash 4052
// Hash 5651
// Hash 1070
// Hash 7766
// Hash 4670
// Hash 2446
// Hash 5785
// Hash 5076
// Hash 4265
// Hash 7636
// Hash 4994
// Hash 2178
// Hash 1819
// Hash 5646
// Hash 2460
// Hash 1145
// Hash 1389
// Hash 4928
// Hash 4215
// Hash 9597
// Hash 7942
// Hash 1854
// Hash 6415
// Hash 6239
// Hash 4980
// Hash 9236
// Hash 1540
// Hash 2184
// Hash 4027
// Hash 9892
// Hash 4392
// Hash 2791
// Hash 1995
// Hash 7530
// Hash 7917
// Hash 2347
// Hash 4930
// Hash 9307
// Hash 8913
// Hash 3861
// Hash 8658
// Hash 4213
// Hash 5822
// Hash 3929
// Hash 6348
// Hash 2691
// Hash 6811
// Hash 2232
// Hash 9975
// Hash 7458
// Hash 3909
// Hash 4327
// Hash 9336
// Hash 7395
// Hash 7373
// Hash 4245
// Hash 6965
// Hash 9685
// Hash 1433
// Hash 2768
// Hash 9995
// Hash 9086
// Hash 9313
// Hash 5288
// Hash 5118
// Hash 3346
// Hash 1264
// Hash 4906
// Hash 6811
// Hash 6396
// Hash 6757
// Hash 9964
// Hash 5273
// Hash 7556
// Hash 5753
// Hash 6811
// Hash 3720
// Hash 7445
// Hash 2471