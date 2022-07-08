import os.path
for path in [ 'test.txt', 'filename', '/user/system/test.txt', '/', '' ]:
    print(path, os.path.splitext(path))