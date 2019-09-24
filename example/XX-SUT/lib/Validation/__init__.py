"""
Robotframework Library Module

The following removes helper functions/classes from the list of exported
keywords by removing all objects starting with a "_".  Create new keywords by
dropping in functions, raise an error to fail a keyword.
"""
import os
import sys
import traceback
import matplotlib
matplotlib.use('Agg')
_SCRIPT_PATH = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, _SCRIPT_PATH)
_MODULE_NAME = os.path.basename(_SCRIPT_PATH)
_MODULES = [os.path.splitext(m)[0] for m in os.listdir(_SCRIPT_PATH) if
            (os.path.isfile(os.path.join(_SCRIPT_PATH, m)) and
             m.endswith('.py') and m[0] not in ['_', '.'])]
_MODULES.extend([m for m in os.listdir(_SCRIPT_PATH) if
                 (os.path.isdir(os.path.join(_SCRIPT_PATH, m)) and m[0] not in
                  ['_', '.']) and m not in ['script']])
__all__ = []
for m in _MODULES:
    print('!!!!!!!!!! %s' % m)
    try:
        _mod = __import__(m, globals(), locals(), [m])
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print('Within %s, could not load %s library:\n%s' % (
                      _SCRIPT_PATH, m, ''.join(traceback.format_exception(
                          exc_type, exc_value, exc_traceback))))
        continue
    if hasattr(_mod, '__all__'):
        __all__.extend(_mod.__all__)
        for submod in _mod.__all__:
            if submod in dir(_mod):
                globals()[submod] = getattr(_mod, submod)
            del submod
        del _mod
del m
del _MODULE_NAME
del _SCRIPT_PATH
del os
del sys
del traceback
del matplotlib
