# -*- coding:utf-8 -*-
import os
import shutil
import time

print("Louie-桌面文件整理工具 tidyTisu v2.1d")
print("唯一更新地址：https://github.com/MrTangLuyao/Greynet")
print("本版本解决了数个bug")

versionInfo = "tidyTisu-2.1d"
firstOpen=0
#userName = "DS"



#timeVariable 时间变量
year=str(time.localtime().tm_year)

if time.localtime().tm_mon < 10:
    mon="0" + str(time.localtime().tm_mon)
else:
    mon=str(time.localtime().tm_mon)

if time.localtime().tm_mday < 10:
    mday="0" + str(time.localtime().tm_mday)
else:
    mday=str(time.localtime().tm_mday)

timeStr = year + mon + mday

#normal variable 常规变量
isNeed = False
targetNames = []
#targetPath="C:/Users/"+ userName +"/Desktop/归档"

targetFormat = [".docx",".doc",".pptx",".ppt",".xls",".xlsx",".pdf",".mp3",".mp4",".txt"]



#是否是第一次运行检查 introduction checking
if not((os.path.exists("D:\归档"))and(os.path.exists("D:/归档/tidyTisu.cfg"))):
    firstOpen=1
    if not os.path.exists("D:\归档"):
        os.mkdir("D:\归档")
    print("\ntidyTisu第一次启动向导\n欢迎使用tidyTisu\n由于高中时电脑上文件太多，整理起来比较麻烦所以编写了此软件的前生AutoSort\n由于bug较多后大幅修改软件并创建了tidyTisu")
    print("你使用的版本是",versionInfo,"\n目前由几点注意事项\n")
    print("1-在使用用tidyTisu使用请不要包含旧的AutoSort归档文件夹 如果你不知道AutoSort请忽略第一条")
    print("2-tidyTisu会整理桌面的文件到 D盘 的 归档 文件夹中")
    print("3-归档文件会按时间排成文件夹")
    print("4-请不要删除文件夹，否则会重新看到第一次启动向导")
    print("\n5-现在请滑出键盘输入当前用户名 弘桥高中如果没有改用户名的话请填写 DS\n")
    userName=input()
    while not os.path.exists(r"C:\Users\\" + userName):
        print("对不起，在您的电脑上找不到您输入的用户名，请检查 拼写 和 大小写 并重新输入\n")
        userName = input()
    file = open(r"D:/归档/tidyTisu.cfg","w+")
    file.write(userName)
    file.write("\n")
    file.write(versionInfo)
    file.close()
    print("谢谢，所有准备工作做完了，欢迎您使用tidyTisu")
    time.sleep(3)

file = open(r"D:/归档/tidyTisu.cfg","r")
userName=file.readline()
userName=userName.rstrip("\n")

#检查版本是否被更新
if (file.readline() != versionInfo) or (firstOpen==1):
    print("检测到你更新或首次运行了了tidyTisu ",versionInfo)
    print("本次版本更新内容如下：")
    print("1- 修正了对于首次输入错误用户名引起永久崩溃的bug")
    print("2- 修正了文件同一天，同名文件归档引起程序崩溃的bug")
    print("3- 增加版本检测机制")
    print("4- 改正部分错别字")
    print("5- 解决了只要打开程序，即使没有目标文件也会新建时间文件夹的bug")
    print("\n5s后自动继续运行，下次运行不会弹出")
    time.sleep(5)



file.close()
path = "C:/Users/"+ userName +"/Desktop"



def formatJd(a):
    judge = False
    for fmt in targetFormat:
        if a == fmt:
            judge = True
    return judge

#dev: print(formatJd(".ppt"))
# old code:targetNames = [0 for i in range(100)]
#old: targetIndex = 0

dataNames = os.listdir(path)
for i in dataNames:
    if formatJd(os.path.splitext(i)[1]):
        #targetNames[targetIndex]=i
        targetNames.append(i)
        #targetIndex += 1

#print(targetNames)
#print(len(targetNames))

        
for i in range(len(targetNames)):
    #to insure timeStr dir is exist
    if not os.path.exists("D:\归档\\"+ timeStr):
        os.mkdir("D:\归档\\"+ timeStr)
    targetPath = "D:/归档/" + timeStr
    isNeed = True
    if os.path.exists(targetPath+targetNames[i]):
        os.rename(path + "/" + targetNames[i],path + "/" + "[重名]" + targetNames[i])
        targetNames[i]=path + "/" + "[重名]" + targetNames[i]
    else:
        targetNames[i] = path + "/" + targetNames[i]
    print("即将归档右边文件 ---> "+targetNames[i])
#print(targetNames)

if isNeed:
    print("检查完成 1s 后移动文件")
    time.sleep(1)
    for i in targetNames:
        shutil.move(i, targetPath)
else:
        print("看起来本次你不需要归档,程序即将退出")
        time.sleep(1)



