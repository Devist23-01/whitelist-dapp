//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

contract Whitelist {
    // 화이트리스트 최대 허용 수
    uint8 public maxWhitelistedAddresses;

    // 허용된 화이트리스트를 확인, 모든 기본값은 default 가 false 임
    mapping(address => bool) public whitelistedAddress;

    // 허용된 화이트리스트가 몇명인지 확인한다.
    uint8 public numAddressWhitelisted;

    // 배포시 최대 화이트리스트 수를 설정한다.
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        // 화이트리스트에 추가된 계정인지 확인
        require(
            !whitelistedAddress[msg.sender],
            "Sender has already been whitelisted"
        );
        // 현재 추가된 화이트리스트가 최초로 설정한 화이트리스트 수를 넘었는지를 확인
        require(
            numAddressWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );

        // 두가지 조건을 만족하면 화이트리스트에 해당 주소를 추가한다.
        whitelistedAddress[msg.sender] = true;
        // 화이트리스트 카운트도 증가시킨다.
        numAddressWhitelisted += 1;
    }

    function numAddressesWhitelisted() public view returns (uint8) {
        return numAddressWhitelisted;
    }

    function whitelistedAddresses(address _signer) public view returns (bool) {
        return whitelistedAddress[_signer];
    }
}
