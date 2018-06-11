*** Settings ***
| Resource | ${RESOURCES}/Common.robot |
| Resource | ${RESOURCES}/Verification.robot |
| Test Setup | Setup Temporary Directory |
| Test Teardown | Teardown Temporary Directory |

*** Test Cases ***
| SUT-REQ-01 |
|    | [Documentation] | Command line help |
|    | The SUT shall provide command line usage information when help is requested. |

| SUT-REQ-02 |
|    | [Documentation] | Version number |
|    | The SUT shall provide its version number when requested. |

| SUT-REQ-03 |
|    | [Documentation] | Output |
|    | The SUT shall write output to a specified file. |
