#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os
from os.path import join, getsize
import getpass

def getDirSize(dir): # 定义获取目录体积的函数
    size = 0
    for root, dirs, files in os.walk(dir):
        size += sum([getsize(join(root, name)) for name in files])
    return size

def delFiles(path):
    ls = os.listdir(path)
    for i in ls:
        CachePath = os.path.join(path, i)
        if os.path.isdir(CachePath):
            del_file(CachePath)
        else:
            os.remove(CachePath)

userName = getpass.getuser() # 获取当前用户名
AdobeCacheFolderDir = 'C:\\Users\\' + userName + '\\AppData\\Roaming\\Adobe\\Common\\Media Cache Files\\' # 设定缓存目录

if __name__ == '__main__':size = getDirSize(AdobeCacheFolderDir)

if size > 1024 * 1024 * 1024: # 分析缓存体积
    print('There are %.3f' % (size / 1024 / 1024 / 1024), 'Gbytes in Adobe Cache Folder')
elif (size > 1024 * 1024) and (size <= 1024 * 1024 * 1024):
    print('There are %.3f' % (size / 1024 / 1024), 'Mbytes in Adobe Cache Folder')
elif (size > 1024) and (size <= 1024 * 1024):
    print('There are %.3f' % (size / 1024), 'Kbytes in Adobe Cache Folder')
elif (size > 1) and (size <= 1024):
    print('There are %.3f' % (size), 'bytes in Adobe Cache Folder')
else: print('nothing in Adobe Cache Folder')

print('''
   ┌----------------┐
   │                │
   │ 是否清理缓存？ │
   │     是（Y）    │
   │                │
   └----------------┘
''')

judge = input('''
请确认或直接退出：
''');

if judge != 'Y':
    exit(1)
else : delFiles(AdobeCacheFolderDir)
print('清理完毕')
os.system('pause')
