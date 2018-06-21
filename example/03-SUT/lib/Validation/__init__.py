"""
Robotframework Library Module

The following removes helper functions/classes from the list of exported
keywords by removing all objects starting with a "_".  Create new keywords by
dropping in functions, raise an error to fail a keyword.
"""
import os
import logging
import matplotlib
matplotlib.use('Agg')

_SCRIPT_PATH = os.path.realpath(os.path.dirname(__file__))
_MODULE_NAME = os.path.basename(_SCRIPT_PATH)
__all__ = []
MODULES = [os.path.splitext(m)[0] for m in os.listdir(_SCRIPT_PATH) if
           (os.path.isfile(os.path.join(_SCRIPT_PATH, m))
            and m[0] not in ['_', '.']
            and os.path.splitext(m)[-1].lower() == '.py')]
for m in MODULES:
    try:
        mod = __import__('{0}.{1}'.format(
            _MODULE_NAME, m), globals(), locals(), [m])
        for keyword in getattr(mod, '__all__', [m]):
            globals()[keyword] = getattr(mod, keyword)
            __all__.append(keyword)
        del mod
        del keyword
    except Exception, e:
        logging.error('Could not load keyword %s from %s library: %s',
                      m, _MODULE_NAME, repr(e))
del m
del MODULES
del _MODULE_NAME
del _SCRIPT_PATH
del os
del logging
