*** Settings ***
| Library | Process |
| Library | OperatingSystem |
| Library | Validation |

*** Variables ***
| ${SUT} | ${CURDIR}${/}..${/}..${/}sut.py |

*** Keywords ***
| Given the SUT. |
|    | File should exist | ${SUT} |

| A user requests help. |
|    | When the system under test is executed with the "-h" flag |

| Usage information will be provided. |
|    | Should Contain | ${output} | usage |

| A user requests the version number of the SUT. |
|    | When the system under test is executed with the "-V" flag |

| The SUT's version number will be provided. |
|    | Should Contain | ${output} | sut v1.0.0 |

| A user executes the SUT with a specified output file. |
|    | Run SUT with "-o test.csv" |

| The SUT will write output to the specified file. |
|    | File should exist | test.csv |
|    | Plot CSV file "test.csv" to "${OUTPUT DIR}${/}media${/}output_plot.png" |
