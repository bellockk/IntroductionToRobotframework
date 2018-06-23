*** Settings ***
| Library | Process |
| Library | OperatingSystem |

*** Variables ***
| ${SUT} | ${CURDIR}${/}..${/}..${/}sut.py |

*** Keywords ***
| The command line options shall provide help when the "${FLAG}" flag is provided. |
|    | When the system under test is executed with the "${FLAG}" flag |
|    | Should Contain | ${output} | usage |

| The command line options shall provide the system version number when the "${FLAG}" flag is provided. |
|    | When the system under test is executed with the "${FLAG}" flag |
|    | Should Contain | ${output} | sut v1.0.0 |

| The SUT shall write output to a specified file |
|    | Fail | Not Implemented |
