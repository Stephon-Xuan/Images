#!/bin/bash
# ��ӡ����
function printStep(){
  echo "### ִ�в�����$1��###"
}

#�ж� �ַ�������1�Ƿ�����ַ�������2
function countainStr(){
  result=$(echo $1 | grep "${2}")
  if [[ "$result" != "" ]]
  then
    return 1
  else
    return 0
  fi
}
#ADD
echo -e "\n"
printStep "git add"
echo `git add .`

printStep "git status"
echo -e "\n"
statusResult=`git status`
echo $statusResult

# ���û���ļ��޸�
countainStr $statusResult "nothing to commit"
if [ $? == 1 ]
then
  echo "��ǰ�ļ���û�б����½������޸ġ�"
  exit
fi

# �ύ����Ϊ��
message="stephon"
if [ "$message" = "" ]
then
  echo "�������ύ����"
  read $message
fi

printStep "git commit -m ${message}"
echo `git commit -m ${message}`

printStep "git push"
pushResult=`git push`

# �������Զ�̱���
countainStr $pushResult "fatal: "
if [ $? == 1 ]
then
  echo "����Զ��С�������ˣ�����ϵ����С��翴�����������"
else
  echo "�ύ���"
fi
