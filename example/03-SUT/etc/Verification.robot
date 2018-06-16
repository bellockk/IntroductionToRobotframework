*** Settings ***
| Library | Process |
| Library | OperatingSystem |

*** Variables ***
| ${SUT} | ${CURDIR}${/}..${/}..${/}sut.py |

*** Keywords ***
| The system under test is executed with the "${FLAG}" flag |
|    | ${result} = | Run Process | ${PYTHON} | ${SUT} | ${FLAG} | stderr=STDOUT | stdout=${TEMPDIR}/stdout.txt |
|    | Log Many | ${result.rc} | ${result.stdout} |
|    | Should be Equal as Integers | 0 | ${result.rc} |
|    | Set Test Variable | ${output} | ${result.stdout}

| The command line options shall provide help when the "${FLAG}" flag is provided. |
|    | When the system under test is executed with the "${FLAG}" flag |
|    | Should Contain | ${output} | usage |

| The command line options shall provide the system version number when the "${FLAG}" flag is provided. |
|    | When the system under test is executed with the "${FLAG}" flag |
|    | Should Contain | ${output} | sut v1.0.0 |

| The SUT shall write output to a specified file |
|    | Fail | Not Implemented |
