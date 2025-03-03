import os
import sys

def FlagsForFile(filename):
    # Define the flags for C files
    c_flags = [
        '-Wall',
        '-std=c11',  # or the standard version you're using, like c99, c++14, etc.
        '-I/usr/include',  # Add any relevant include directories
        '-I.',  # Current directory for local includes
    ]
    
    # Define the flags for Python files
    python_flags = [
        '--python-version=3.13.3',  # Specify Python version you're working with
        '-I/usr/lib/python3.13.3',  # Add any relevant Python include directories
    ]
    
    # Add flags based on file extension
    if filename.endswith('.c'):
        return {
            'flags': c_flags,
            'do_cache': True
        }
    elif filename.endswith('.cpp'):
        return {
            'flags': c_flags + ['-std=c++11'],  # C++ flags
            'do_cache': True
        }
    elif filename.endswith('.py'):
        return {
            'flags': python_flags,
            'do_cache': True
        }
    else:
        return {
            'flags': [],
            'do_cache': False
        }
