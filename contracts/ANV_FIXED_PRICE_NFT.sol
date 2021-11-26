pragma solidity ^0.8.0;

import "./access/Ownable.sol";
import "./gsn/Context.sol";
import "./address/Address.sol";
import "./token/ERC721.sol";
import "./token/ERC20.sol";



pragma solidity ^0.8.0;

interface IERC721 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
      * @dev Safely transfers `tokenId` token from `from` to `to`.
      *
      * Requirements:
      *
      * - `from` cannot be the zero address.
      * - `to` cannot be the zero address.
      * - `tokenId` token must exist and be owned by `from`.
      * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
      * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
      *
      * Emits a {Transfer} event.
      */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
}

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract NFT_MARKET is Ownable {

    IERC20 public erc20Token;
    
    uint256 public feeAmount;
    
    address  payable public feeAddress;

    struct NftItem {
      address nftContract;
      uint256 tokenId;
      address seller;
      uint256 price;
      bool isActive;
    }
    
    event TokenPlaced(uint256 indexed tokenId,  uint256 cost);
    event TokenUnplaced(uint256 indexed tokenId);
    event TokenSold(uint256 indexed tokenId, address indexed newOwner);
    event TokenPurchase()
    
    mapping (address => mapping (uint256 => NftItem)) public _nftItems;
    
    constructor (IERC20 _erc20Token,uint256 _feeAmount ,address payable _feeAddress) public {
        
        erc20Token = _erc20Token;
        feeAmount = _feeAmount;
        feeAddress = _feeAddress;
    }
    
    
    function changeFee(uint256 _feeAmount , address payable _feeAddress) onlyOwner external returns (bool) {
        feeAmount = _feeAmount;
        feeAddress = _feeAddress;
        return true;
    }
    

    /////////////
    // Placing //
    /////////////

    function place(address nftContract, uint256 tokenId,  uint256 cost) external  {
        
        // check approval
        require(IERC721(nftContract).getApproved(tokenId) == address(this), "Not approved to transfer.");
        
        // check cost 
        require(cost > 0, "Cost should be greater than zero.");
        
        // check owner
        require(IERC721(nftContract).ownerOf(tokenId) == msg.sender, "Not ownerOf");
        
        // send to contract Nft
        IERC721(nftContract).transferFrom(address(msg.sender), address(this),tokenId);

        // set NftItem
        _nftItems[nftContract][tokenId] =  NftItem(nftContract, tokenId, msg.sender ,cost, true);

        // fire event
        emit TokenPlaced(tokenId, cost);
    }



    function unplace(address nftContract, uint256 tokenId) external {
        
        // require(!(IERC721(nftContract).getApproved(tokenId) == address(this)), "Approved to transfer.");
        
        
        NftItem memory nftItem = _nftItems[nftContract][tokenId];
        
        // check owner
        require(nftItem.seller == address(msg.sender), "Not ownerOf");
        
        // check status
        require(nftItem.isActive, "Not active nft");
       
        // send to contract Nft
        IERC721(nftContract).transferFrom(address(this), address(msg.sender),tokenId);
        
        
        nftItem.isActive = false;

        emit TokenUnplaced(tokenId);
    }

    
    
    
    function buy(address nftContract, uint256 tokenId) external {
       
        // get NftItem
        NftItem memory nftItem = _nftItems[nftContract][tokenId];
        
        // check nft token is active
        require(nftItem.isActive, "Not active nft");
        
        // get owner address
        address owner = IERC721(nftContract).ownerOf(tokenId);

        // Check valid transaction
        require(IERC721(nftContract).getApproved(tokenId) == address(this), "Not approved to transfer.");
        
        // get anv token balance
        uint256 balance = erc20Token.balanceOf(msg.sender);
        
        // check fee amount
        uint256 feePortion = nftItem.price * feeAmount / 10000;
        
        // check balance 
        require ((balance + feePortion) >= nftItem.price, "Lack of balance"); 
        
        // Transfer NFT token to buyer address
        IERC721(nftContract).safeTransferFrom(address(this), msg.sender, tokenId);
        
        // Transfer erc20 token to NFT owner address
        require(
                IERC20(erc20Token).transferFrom(msg.sender , owner, nftItem.price),
                "Refund token transfer error."
            );
            
         // Transfer fee amount erc20 token to NFT owner address
        require(
                IERC20(erc20Token).transferFrom(msg.sender , feeAddress, feePortion),
                "Refund token transfer error."
            );
  
    }


    // Signature methods

    function splitSignature(bytes memory sig)
        internal
        pure
        returns (uint8, bytes32, bytes32)
    {
        require(sig.length == 65);

        bytes32 r;
        bytes32 s;
        uint8 v;

        assembly {
            // first 32 bytes, after the length prefix
            r := mload(add(sig, 32))
            // second 32 bytes
            s := mload(add(sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }

        return (v, r, s);
    }

    function recoverSigner(bytes32 message, bytes memory sig)
        internal
        pure
        returns (address)
    {
        uint8 v;
        bytes32 r;
        bytes32 s;

        (v, r, s) = splitSignature(sig);

        return ecrecover(message, v, r, s);
    }

    // Builds a prefixed hash to mimic the behavior of eth_sign.
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }

}