import sys
import argparse
import logging
import math

__version__ = '1.0.0'


def parse_arguments(args):
    """
    Define Program Options
    """
    PARSER = argparse.ArgumentParser(
        description='a system to test', prog='sut')
    PARSER.add_argument('-V', '--version', action='version',
                        version='sut v{0}'.format(__version__))
    GROUP = PARSER.add_mutually_exclusive_group()
    GROUP.add_argument('-v', '--verbose', dest='log_level',
                        action='store_const',
                        const='DEBUG',
                        help='increase output verbosity')
    GROUP.add_argument('-q', '--quiet', dest='log_level',
                        action='store_const',
                        const='CRITICAL',
                        help='silence all but critical messages')
    GROUP.add_argument('-l', '--log-level', dest='log_level',
                        default='INFO',
                        choices=['DEBUG', 'INFO', 'WARNING', 'ERROR',
                                 'CRITICAL'],
                        help='set logging level')
    PARSER.add_argument('-o', '--output-file', default='./output.csv')
    return PARSER.parse_args()


def write_output(filename):
    """
    Write output file
    """
    with open(ARGS.output_file.strip(), 'w') as f:
        f.write('\n'.join(
            ['{0}, {1}'.format(i, math.sin(i / 10.0)) for i in range(0, 40)]))


if __name__ == "__main__":

    # Parse Arguments
    ARGS = parse_arguments(sys.argv[1:])

    # Setup Logging
    logging.basicConfig(level=logging.DEBUG, format='%(message)s')

    # Log Header
    logging.info('System Under Test (SUT) v%s', __version__)
    logging.info('  Output: %s' % ARGS.output_file)

    # Write Output
    write_output(ARGS.output_file)

    # Log Footer
    logging.info('SUT completed successfully')
