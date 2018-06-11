*** Settings ***
| Library | Process |
| Library | OperatingSystem |

*** Test Cases ***
| Program Options Help |
|  | ${python} | Evaluate | sys.executable | modules=sys |
|  | ${result} = | Run Process | ${python} | ${CURDIR}${/}..${/}..${/}sut.py | -h | stderr=STDOUT | stdout=${TEMPDIR}/stdout.txt |
|  | Log Many | ${result.rc} | ${result.stdout} |
|  | Should be Equal as Integers | 0 | ${result.rc} |
|  | Should Contain | ${result.stdout} | usage |

| Program Version |
|  | ${python} | Evaluate | sys.executable | modules=sys |
|  | ${result} = | Run Process | ${python} | ${CURDIR}${/}..${/}..${/}sut.py | -V | stderr=STDOUT | stdout=${TEMPDIR}/stdout.txt |
|  | Log Many | ${result.rc} | ${result.stdout} |
|  | Should be Equal as Integers | 0 | ${result.rc} |
|  | Should Contain | ${result.stdout} | sut v1.0.0 |

| Run SUT |
|  | ${python} | Evaluate | sys.executable | modules=sys |
|  | ${result} = | Run Process | ${python} | ${CURDIR}${/}..${/}..${/}sut.py | -o ${TEMPDIR}${/}output.csv | stderr=STDOUT | stdout=${TEMPDIR}/stdout.txt |
|  | Log Many | ${result.rc} | ${result.stdout} |
|  | Should be Equal as Integers | 0 | ${result.rc} |
|  | File Should Exist | ${TEMPDIR}${/}output.csv |
|  | ${file_contents} = | Get File | ${TEMPDIR}${/}output.csv |
|  | Log | ${file_contents} |
