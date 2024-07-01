import os 

current_dir = os.path.dirname(os.path.abspath(__file__)) + "/"

with open(current_dir+"apt_list.txt","r") as f:
    requirements = f.readlines()
    f.close()

requirements_to_install = ""
for req in requirements[1:]:
    if "[installed,automatic]" not in req:
        requirements_to_install += req.split("/")[0]
        requirements_to_install += "\n"

with open(current_dir+"apt_requirments.txt","w") as f:
    f.writelines(requirements_to_install)

f.close()