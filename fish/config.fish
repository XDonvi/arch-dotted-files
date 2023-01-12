
#My fish config.
set fish_greeting		#Suppresses fish's intro message\

### FUNCTIONS ###
# Spark functions
function letters
    cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | lolcat
    printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | lolcat
end

function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end



if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases

	alias killorphans='sudo pacman -Qtdq | sudo pacman -Rns -'
        alias paccheck='checkupdates | wc -l'
        alias pacchecklist='checkupdates'
        alias pacupdate='sudo pacman -Syyy'
        alias pacupgrade='sudo pacman -Syu'
        alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
	
	alias pacsyu='sudo pacman -Syyyu'
	alias unlock='sudo rm /var/lib/pacman/db.lck'

        alias cls='clear'
        alias ll='exa -lagh --color=always --group-directories-first --git'
        alias lh='exa -lgh --color=always --group-directories-first --git'
        alias lt='exa -aT --color=always --group-directories-first'
	alias l='exa -lh --color=always --group-directories-first --git'
	alias l.='exa -a | egrep "^\."'
	
	# navigation
	alias ..='cd ..'
	alias ...='cd ../..'
	alias .3='cd ../../..'
	alias .4='cd ../../../..'	
	alias .5='cd ../../../../..'
	
	# nmcli alias 
        alias wifioff='nmcli r wifi off'
        alias wifion='nmcli r wifi on'
        alias wifirestart='nmcli r wifi off && nmcli r wifi on'
        alias restartwifi='nmcli r wifi off && nmcli r wifi on'
        alias wifilist='nmcli d wifi list'
        alias wificonnect='nmcli d wifi connect'

	alias rg='ranger'
	alias git-graph='git log --all --decorate --oneline --graph'

	alias onthisday='calendar -l 0'
	
	alias journalerrors='sudo journalctl -p 3 -xb'
	alias systemctlfailed='systemctl --failed'

	# get fastest mirrors
	alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
	alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
	alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
	alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
	
	# Colorize grep output (good for log files)
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
	
	# confirm before overwriting something
	alias cp="cp -i"
	alias mv='mv -i'
	alias rm='rm -i'
	
	# adding flags
	alias df='df -h'                          # human-readable sizes
	alias free='free -m'                      # show sizes in MB
	
	# ps
	alias psa="ps auxf"
	alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
	alias psmem='ps auxf | sort -nr -k 4'
	alias psmem10='ps aufx | sort -nr -k 4 | head -10'
	
	alias pscpu='ps auxf | sort -nr -k 3'
	alias pscpu='ps auxf | sort -nr -k 3 | head -10'	

	# Merge Xresources
	alias merge='xrdb -merge ~/.Xresources'
	
	# git
	alias addup='git add -u'
	alias addall='git add .'
	alias branch='git branch'
	alias checkout='git checkout'
	alias clone='git clone'
	alias commit='git commit -m'
	alias fetch='git fetch'
	alias pull='git pull origin'
	alias push='git push origin'
	alias stat='git status'  # 'status' is protected name so using 'stat' instead
	alias tag='git tag'
	alias newtag='git tag -a'
	
	# get error messages from journalctl
	alias jctl="journalctl -p 3 -xb"

	# systemctl
	alias sysdstat='sudo systemctl status'
	alias sysdsockets='sudo systemctl list-sockets'
	alias sysdjobs='sudo systemctl list-jobs'
	alias sysdunit='sudo systemctl list-units'
	alias sysdunitfiles='sudo systemctl list-unit-files'
	alias sysdtarget='sudo systemctl get - default'
	
	# shutdown and reboot
	alias ssn="sudo shutdown now"
	alias sr="sudo reboot"

	
# Start pfetch
pfetch
