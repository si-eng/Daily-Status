
import pkg_resources
installed_packages = pkg_resources.working_set

for i in installed_packages:
    print(i)