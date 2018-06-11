*** Settings ***
| Library | Process |
| Library | OperatingSystem |

*** Variables ***
| ${SUT} | ${CURDIR}${/}..${/}..${/}sut.py |

*** Keywords ***
| Given the SUT. |
|    | Fail | Not Implemented |

| When a user requests help. |
|    | Fail | Not Implemented |

| Then usage information will be provided. |
|    | Fail | Not Implemented |

| When a user requests the version number of the SUT. |
|    | Fail | Not Implemented |

| Then the SUT's version number will be provided. |
|    | Fail | Not Implemented |

| When a user executes the SUT with a specified output file. |
|    | Fail | Not Implemented |

| Then SUT will write output to the specified file. |
|    | Fail | Not Implemented |
