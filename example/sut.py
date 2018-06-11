import argparse
import logging
import math

__version__ = '1.0.0'

# Define Program Options
PARSER = argparse.ArgumentParser(description='a system to test', prog='sut')
PARSER.add_argument('-o', '--output-file', default='./output.csv')
PARSER.add_argument('-V', '--version', action='version',
                    version='sut v{0}'.format(__version__))
ARGS = PARSER.parse_args()

# Setup Logging
logging.basicConfig(level=logging.DEBUG, format='%(message)s')

# Log Header
logging.info('System Under Test (SUT) v%s', __version__)
logging.info('  Output: %s' % ARGS.output_file)

# Write output file
with open(ARGS.output_file.strip(), 'w') as f:
    f.write('\n'.join(
        ['{0}, {1}'.format(i, math.sin(i / 10.0)) for i in range(0, 40)]))

# Log Footer
logging.info('SUT completed successfully')
