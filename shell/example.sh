#!/bin/bash


# -------------------- 输入输出 -----------------------


echo "hello shell"

echo " \" 转义这么玩 \""

echo "hello word\n" # 输出不换行
echo -e "hello word\n" # 输出换行, -e 表示换行

# read name  意思就是： name=用户输入的一行字符



# -------------------- 字符串 -----------------------
# 变量1: 变量名和=号不能有空格，跟python规范要有空格不一样
name="way"

# 变量2: 使用$
echo $name
echo "my name is ${name}, what is you name?"

# 变量3: readonly
testname="just for read"
readonly testname

# 字符串：单双引号跟其他语言一样

# 字符串长度
echo "name length is ${#name}"

# 提取子串
str="today is sunday"
echo ${str:0:5}  #输出today


# =	等于则为真
# !=	不相等则为真
# -z 字符串	字符串的长度为0,则为真  zero
# -n 字符串	字符串的长度不为0,则为真 not zero



# -------------------- 数组 -----------------------
# 数组
array=(1 2 3 4 5)

array2=(
	a
	b
	c
	d
	)


echo array[0]  #output 1
echo ${array[@]}  #output 1,2,3,4,5 (所有)


# 数据的长度
array_length=${#array[*]}
echo ${#array[@]}


# -------------------- 传递参数 -----------------------

echo "执行文件名是：$0"    # './one.sh' 注意这个是有个./的
echo "第一个参数是：$1"

# $#	传递到脚本的参数个数
# $*	以一个单字符串显示所有向脚本传递的参数。
# 如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
# $$	脚本运行的当前进程ID号
# $!	后台运行的最后一个进程的ID号
# $@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
# 如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
# $-	显示Shell使用的当前选项，与set命令功能相同。
# $?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。



# -------------------- 运算符 -----------------------

echo `expr 2 + 2`

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"



# -------------------- 关系运算符 -----------------------
# 运算符	说明	举例
# -eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
# -ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
# -gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
# -lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
# -ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
# -le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。


# 注意这个地方[ 两边要留有空格 ]
if [ $a -eq $b ]
then
	echo "a = b"
else
	echo "a != b"
fi


# 逻辑运算符用法，注意两个[[ 符合之间不要有空格
if [[ $a -gt $b  || $a -eq 100 ]]
then
	echo "yes"
else
	echo "no"
fi


# -------------------- 文件测试运算符 -----------------------

# 操作符	说明	举例

# -d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
# -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
# -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
# -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。

# -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
# -b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
# -c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
# -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
# -p file	检测文件是否是有名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
# -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
# -r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
# -w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
# -x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。


# -------------------- 逻辑循环 -----------------------

if [ -e one.sh ]
then
	echo 1111
elif [ -e two.sh ]
then
	echo 222
else
	echo 333
fi

for file in `ls`
do
	echo -e "$file\n"
done

## 数组循环获取, 要写成这个样子${array[@]}
array=(a b c d e)
for char in ${array[@]}
do
	echo -e $char
done


# -------------------- 函数 -----------------------

#函数返回值智能是0-255之间

global_name=""

function way(){

	echo "my name is way, call in function"
	global_name='waywayway'

}

# 函数调用不需要加括号
way
echo "$global_name"


# -------------------- 重定向 -----------------------

# 下面三种效果一样
echo xxx > /dev/null 2>&1
echo xxx >& /dev/null
echo xxx &> /dev/null

















