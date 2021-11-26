pragma solidity ^0.8.0;

import "/IERC165";
import "./address/Address.sol";
import "./strings/Strings";


abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}