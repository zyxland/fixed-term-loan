// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.7;

import { ILoan }             from "../../interfaces/ILoan.sol";
import { IMapleLoanFactory } from "../../interfaces/IMapleLoanFactory.sol";

import { LoanUser } from "./LoanUser.sol";

contract Borrower is LoanUser {

    /************************/
    /*** Direct Functions ***/
    /************************/

    function loan_drawdownFunds(address loan_, uint256 amount_, address destination_) external {
        ILoan(loan_).drawdownFunds(amount_, destination_);
    }

    function loan_removeCollateral(address loan_, uint256 amount_, address destination_) external {
        ILoan(loan_).removeCollateral(amount_, destination_);
    }

    function mapleLoanFactory_createLoan(address mapleLoanFactory_, bytes calldata arguments_) external {
        IMapleLoanFactory(mapleLoanFactory_).createLoan(arguments_);
    }

    /*********************/
    /*** Try Functions ***/
    /*********************/

    function try_loan_drawdownFunds(address loan_, uint256 amount_, address destination_) external returns (bool ok_) {
        ( ok_, ) = loan_.call(abi.encodeWithSelector(ILoan.drawdownFunds.selector, amount_, destination_));
    }

    function try_loan_removeCollateral(address loan_, uint256 amount_, address destination_) external returns (bool ok_) {
        ( ok_, ) = loan_.call(abi.encodeWithSelector(ILoan.removeCollateral.selector, amount_, destination_));
    }

    function try_mapleLoanFactory_createLoan(address mapleLoanFactory_, bytes calldata arguments_) external returns (bool ok_) {
        ( ok_, ) = mapleLoanFactory_.call(abi.encodeWithSelector(IMapleLoanFactory.createLoan.selector, arguments_));
    }

}
