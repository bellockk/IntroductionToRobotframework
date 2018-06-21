*** Settings ***
| Resource | ${RESOURCES}/Common.robot |
| Resource | ${RESOURCES}/Validation.robot |
| Test Setup | Setup Temporary Directory |
| Test Teardown | Teardown Temporary Directory |

*** Test Cases ***
| SUT-UC-01 |
|    | [Documentation] | Command line help |
|    | Given the SUT. |
|    | When a user requests help. |
|    | Then usage information will be provided. |

| SUT-UC-02 |
|    | [Documentation] | Version number |
|    | Given the SUT. |
|    | When a user requests the version number of the SUT. |
|    | Then the SUT's version number will be provided. |

| SUT-UC-03 |
|    | [Documentation] | Output |
|    | Given the SUT. |
|    | When a user executes the SUT with a specified output file. |
|    | Then the SUT will write output to the specified file. |
