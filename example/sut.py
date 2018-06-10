import argparse
import logging
import math

# Define Program Options
PARSER = argparse.ArgumentParser(description='a system to test', prog='sut')
PARSER.add_argument('-o', '--output-file', default='./output.csv')
PARSER.add_argument('-V', '--version', action='version',
                    version='%s(prog)s 1.0.0')
ARGS = PARSER.parse_args()

# Setup Logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(message)s')

# Write output file
with open(ARGS.output_file, 'w') as f:
    f.write('\n'.join(
        ['{0}, {1}'.format(i, math.sin(i / 10.0)) for i in range(0, 40)]))
