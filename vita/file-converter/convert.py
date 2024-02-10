import os
import os.path as path
from glob import iglob
import subprocess
import shutil

#general

def prompt_yes_no(*args, sep=' '):
    msg = sep.join(args) + ' [Y,n] '
    while True:
        response = input(msg)
        if response in ['Y', 'Yes', 'yes']:
            return True
        elif response in ['n', 'No', 'no']:
            return False

def consume_params(*args, **kargs):
    pass

log = consume_params

def copy(src, dest):
    try:
        shutil.copy(src, dest)
    except:
        return False
    return True

vcodec = 'mpeg4'

conversion_ops = [
    ('**/*.avi', lambda src, dest: subprocess.run(['ffmpeg', '-i', src, '-vcodec', vcodec, '-acodec', 'copy', dest], stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT).returncode == 0, 'Converting video'),
    ('**/*',     copy,          'Copying file')
]

def convert_vangers_data(data_src : str, data_dest : str) -> bool:
    visited = []
    for query, func, desc in conversion_ops:
        for file in filter(lambda f: not (f in visited or path.isdir(path.join(data_src, f))), iglob(query, root_dir=data_src, recursive=True)):
            log(query, '->' ,desc, file, end='... ')

            os.makedirs(path.join(data_dest, path.dirname(file)), exist_ok=True)
            if not func(path.join(data_src, file), path.join(data_dest, file)):
                log('ERROR!')
                return False
            log('done')
            visited.append(file)
    return True

if __name__ == '__main__':
    from sys import argv

    log = print

    dir_list = [path.join(path.dirname(argv[0]), 'data')]
    if os.name == 'nt':
        dir_list.append('C:\Program Files (x86)\GOG Galaxy\Games\Vangers\data')
    if len(argv) == 2:
        dir_list.append(argv[1])
    for p in reversed(dir_list):
        log('testing', p, end='... ')
        f = path.join(p, 'vangers.prm')
        if path.isfile(f):
            log('Found!')
            convert_vangers_data(p, path.join(path.dirname(argv[0]), 'vita_root', 'data', 'Vangers'))
        log('Not Found')
    log('Done.')