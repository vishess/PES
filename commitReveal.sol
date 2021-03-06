pragma solidity ^0.4.18;

contract commitReveal {
    
    //Mappings
    mapping (address => bytes32) commits;
    
    //Commitment
    function commit (bytes32 _in) internal {
        
        commits[msg.sender] = _in;
        
    }
    
    //Reveal
    function reveal (string _secret, uint8 _seed, uint8 _guess) constant internal returns (bool correct) {
        
        correct = false;
        
        if (commits[msg.sender] == keccak256 (_secret, _seed, _guess)) {
            correct = true;
        }
        
    }
    
}
