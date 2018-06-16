*** Settings ***
| Resource | ${RESOURCES}/Common.robot |
| Resource | ${RESOURCES}/Verification.robot |
| Documentation | The SUT shall provide command line options. |
| Test Setup | Setup Temporary Directory |
| Test Teardown | Teardown Temporary Directory |

*** Test Cases ***
| SUT-REQ-001-01 |
|    | [Documentation] | Command line help  "-h" |
|    | The command line options shall provide help when the "-h" flag is provided. |

| SUT-REQ-001-02 |
|    | [Documentation] | Command line help "--help" |
|    | The command line options shall provide help when the "--help" flag is provided. |

| SUT-REQ-001-03 |
|    | [Documentation] | Version number "-V" |
|    | The command line options shall provide the system version number when the "-V" flag is provided. |

| SUT-REQ-001-04 |
|    | [Documentation] | Version number "--version" |
|    | The command line options shall provide the system version number when the "--version" flag is provided. |
