#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
fish


function setgov ()
{
     for i in {0..7}; 
     do 
         sudo  cpufreq-set -c $i -g $1; # run cpufreq-set with root
     done
}