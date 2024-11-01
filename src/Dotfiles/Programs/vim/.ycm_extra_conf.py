import os.path as p
import subprocess

DIR_OF_THIS_SCRIPT = p.abspath( p.dirname( __file__ ) )
DIR_OF_THIRD_PARTY = p.join( DIR_OF_THIS_SCRIPT, 'third_party' )


def GetStandardLibraryIndexInSysPath( sys_path ):
  for index, path in enumerate( sys_path ):
    if p.isfile( p.join( path, 'os.py' ) ):
      return index
  raise RuntimeError( 'Could not find standard library path in Python path.' )


def PythonSysPath( **kwargs ):
  sys_path = kwargs[ 'sys_path' ]

  dependencies = [ p.join( DIR_OF_THIS_SCRIPT, 'python' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests-futures' ),
                   p.join( DIR_OF_THIRD_PARTY, 'ycmd' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'idna' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'chardet' ),
                   p.join( DIR_OF_THIRD_PARTY,
                           'requests_deps',
                           'urllib3',
                           'src' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'certifi' ),
                   p.join( DIR_OF_THIRD_PARTY, 'requests_deps', 'requests' ) ]

  # The concurrent.futures module is part of the standard library on Python 3.
  interpreter_path = kwargs[ 'interpreter_path' ]
  major_version = int( subprocess.check_output( [
    interpreter_path, '-c', 'import sys; print( sys.version_info[ 0 ] )' ]
  ).rstrip().decode( 'utf8' ) )
  if major_version == 2:
    dependencies.append( p.join( DIR_OF_THIRD_PARTY, 'pythonfutures' ) )

  sys_path[ 0:0 ] = dependencies
  sys_path.insert( GetStandardLibraryIndexInSysPath( sys_path ) + 1,
                   p.join( DIR_OF_THIRD_PARTY, 'python-future', 'src' ) )
  return sys_path


def GetFlagsForLanguage(language):
    if language == 'C':
        return [
            '-std=c11',
        ]
    elif language == 'C++':
        return [
            '-std=c++17',
        ]
    elif language == 'Python':
        return [
            '--include-path=/usr/lib/python3.x/site-packages',  # Python kütüphaneleri
        ]
    elif language == 'HTML':
        return []
    elif language == 'CSS':
        return []
    elif language == 'JavaScript':
        return []
    elif language == 'Rust':
        return [
            '--edition=2021',
        ]
    return []

def GetCompilationInfoForFile(filename):
    file_extension = os.path.splitext(filename)[1]
    if file_extension in ['.c', '.h']:
        return GetFlagsForLanguage('C')
    elif file_extension in ['.cpp', '.hpp']:
        return GetFlagsForLanguage('C++')
    elif file_extension in ['.py']:
        return GetFlagsForLanguage('Python')
    elif file_extension in ['.html']:
        return GetFlagsForLanguage('HTML')
    elif file_extension in ['.css']:
        return GetFlagsForLanguage('CSS')
    elif file_extension in ['.js']:
        return GetFlagsForLanguage('JavaScript')
    elif file_extension in ['.rs']:
        return GetFlagsForLanguage('Rust')
    return []

def FlagsForFile(filename, **kwargs):
    return GetCompilationInfoForFile(filename)





