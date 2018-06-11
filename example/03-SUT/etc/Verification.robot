*** Settings ***
| Library | Process |
| Library | OperatingSystem |

*** Variables ***
| ${SUT} | ${CURDIR}${/}..${/}..${/}sut.py |

*** Keywords ***
| The SUT shall provide command line usage information when help is requested. |
|    | Fail | Not Implemented |

| The SUT shall provide its version number when requested. |
|    | Fail | Not Implemented |

| The SUT shall write output to a specified file. |
|    | Fail | Not Implemented |
