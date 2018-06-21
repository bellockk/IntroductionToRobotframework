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

| Run SUT with "${ARG}" | 
|    | [Documentation] | Executes the system under test with the specified argument |
|    | ${result} = | Run Process | ${PYTHON} | ${SUT} | ${ARG} | stderr=STDOUT | stdout=${TEMPDIR}/stdout.txt |
|    | Log Many | ${result.rc} | ${result.stdout} |
|    | Set Test Variable | ${OUTPUT} | ${result.stdout} |
|    | Set Test Variable | ${RC} | ${result.rc} |
|    | Should be Equal as Integers | 0 | ${RC} |

| Setup Temporary Directory |
|    | [Documentation] | Creates a temporary workspace for test, and sets the current working directory to that path. |
|    | ${PRIOR_DIRECTORY} = | Evaluate | os.path.abspath(os.curdir) | os |
|    | ${TEMPORARY_TEST_WORKSPACE} = | Evaluate | os.path.abspath(tempfile.mkdtemp()) | os, tempfile |
|    | Set Test Variable | ${PRIOR_DIRECTORY} |
|    | Set Test Variable | ${TEMPORARY_TEST_WORKSPACE} |
|    | Evaluate | os.chdir('${TEMPORARY_TEST_WORKSPACE}') | os |

| Teardown Temporary Directory |
|    | [Documentation] | Cleans up the temporary workspace for this test. |
|    | Variable Should Exist | ${PRIOR_DIRECTORY} |
|    | Variable Should Exist | ${TEMPORARY_TEST_WORKSPACE} |
|    | ${save_path} = | Set Variable | ${OUTPUT_DIR}${/}failed${/}${TEST_NAME} |
|    | Remove Directory | ${save_path} | True |
|    | Run Keyword If Test Passed | Run Keyword and Return Status | Remove Directory | ${TEMPORARY_TEST_WORKSPACE} | True |
|    | Run Keyword If Test Failed | Move Directory | ${TEMPORARY_TEST_WORKSPACE} | ${save_path} |
|    | Evaluate | os.chdir('${PRIOR_DIRECTORY}') | os |
