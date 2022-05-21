import os

jar_list = []

for files in os.listdir("/word-checker/fuzz/deps/"):
    if files.endswith(".jar"):
        jar_list.append(files)

print("Class-Path: " + " ".join(jar_list))
print("\n")