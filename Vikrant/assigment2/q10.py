import platform as pl

os_profile = [
        'architecture',
        'linux_distribution',
        'mac_ver',
        'machine',
        'node',
        'platform',
        'processor',
        'python_build',
        'python_compiler',
        'python_version',
        'release',
        'system',
        'uname',
        'version',
    ]
for key in os_profile:
    if hasattr(pl, key):                ##### The hasattr() function returns True if the specified object has the specified attribute, otherwise False 
        print(key +  ": " + str(getattr(pl, key)()))            ####The getattr() method returns the value of the named attribute of an object. If not found, it returns the default value provided to the function.
