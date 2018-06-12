*** Settings ***
| Resource | ${RESOURCES}/Common.robot |
| Resource | ${RESOURCES}/Verification.robot |
| Documentation | The SUT shall provide command line options. |
| Test Setup | Setup Temporary Directory |
| Test Teardown | Teardown Temporary Directory |

*** Test Cases ***
| SUT-REQ-001-01 |
|    | [Documentation] | Command line help |
|    | The command line options shall provide help when requested. |

| SUT-REQ-001-02 |
|    | [Documentation] | Version number |
|    | The command line options shall provide the system version number when requested. |
