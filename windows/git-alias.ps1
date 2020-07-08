# Original alias are from https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
# Bundle replace regex: function (.+) {(.+) $args}    -->       function $1 {$2 $args}
# Comment some not working alias

# # The name of the current branch
# # Back-compatibility wrapper for when this function was defined here in
# # the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# # to fix the core -> git plugin dependency.
# function current_branch() {
#     git_current_branch
# }

# # Pretty log messages
# function _git_log_prettily() {
#     if ! [ -z $1 ]; then
#     git log --pretty=$1
#     fi
# }
# compdef _git _git_log_prettily=git-log

# Warn if the current branch is a WIP
# function work_in_progress() {
#     if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
#     echo "WIP!!"
#     fi
# }

# Check if main exists and use instead of master
# function git_main_branch() {
#     if [[ -n "$(git branch --list main)" ]]; then
#     echo main
#     else
#     echo master
#     fi
# }

#
# Aliases
# (sorted alphabetically)
#

function g {git $args}

function ga {git add $args}
function gaa {git add --all $args}
function gapa {git add --patch $args}
function gau {git add --update $args}
function gav {git add --verbose $args}
function gap {git apply $args}
function gapt {git apply --3way $args}

function gb {git branch $args}
function gba {git branch -a $args}
function gbd {git branch -d $args}
# function gbda {git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d $args}
function gbD {git branch -D $args}
function gbl {git blame -b -w $args}
function gbnm {git branch --no-merged $args}
function gbr {git branch --remote $args}
function gbs {git bisect $args}
function gbsb {git bisect bad $args}
function gbsg {git bisect good $args}
function gbsr {git bisect reset $args}
function gbss {git bisect start $args}

function gc {git commit -v $args}
function gc! {git commit -v --amend $args}
function gcn! {git commit -v --no-edit --amend $args}
function gca {git commit -v -a $args}
function gca! {git commit -v -a --amend $args}
function gcan! {git commit -v -a --no-edit --amend $args}
function gcans! {git commit -v -a -s --no-edit --amend $args}
function gcam {git commit -a -m $args}
function gcsm {git commit -s -m $args}
function gcb {git checkout -b $args}
function gcf {git config --list $args}
function gcl {git clone --recurse-submodules $args}
function gclean {git clean -id $args}
# function gpristine {git reset --hard && git clean -dffx $args}
# function gcm {git checkout $(git_main_branch) $args}
function gcd {git checkout develop $args}
function gcmsg {git commit -m $args}
function gco {git checkout $args}
function gcount {git shortlog -sn $args}
function gcp {git cherry-pick $args}
function gcpa {git cherry-pick --abort $args}
function gcpc {git cherry-pick --continue $args}
function gcs {git commit -S $args}

function gd {git diff $args}
function gdca {git diff --cached $args}
function gdcw {git diff --cached --word-diff $args}
# function gdct {git describe --tags $(git rev-list --tags --max-count=1) $args}
function gds {git diff --staged $args}
function gdt {git diff-tree --no-commit-id --name-only -r $args}
function gdw {git diff --word-diff $args}

# function gdnolock() {
#     git diff "$@" ":(exclude)package-lock.json" ":(exclude)*.lock"
# }
# compdef _git gdnolock=git-diff

# function gdv() { git diff -w "$@" | view - }
# compdef _git gdv=git-diff

function gf {git fetch $args}
function gfa {git fetch --all --prune $args}
function gfo {git fetch origin $args}

function gfg {git ls-files | grep $args}

function gg {git gui citool $args}
function gga {git gui citool --amend $args}

# function ggf() {
#     [[ "$#" != 1 ]] && local b="$(git_current_branch)"
#     git push --force origin "${b:=$1}"
# }
# compdef _git ggf=git-checkout
# function ggfl() {
#     [[ "$#" != 1 ]] && local b="$(git_current_branch)"
#     git push --force-with-lease origin "${b:=$1}"
# }
# compdef _git ggfl=git-checkout

# function ggl() {
#     if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
#     git pull origin "${*}"
#     else
#     [[ "$#" == 0 ]] && local b="$(git_current_branch)"
#     git pull origin "${b:=$1}"
#     fi
# }
# compdef _git ggl=git-checkout

# function ggp() {
#     if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
#     git push origin "${*}"
#     else
#     [[ "$#" == 0 ]] && local b="$(git_current_branch)"
#     git push origin "${b:=$1}"
#     fi
# }
# compdef _git ggp=git-checkout

# function ggpnp() {
#     if [[ "$#" == 0 ]]; then
#     ggl && ggp
#     else
#     ggl "${*}" && ggp "${*}"
#     fi
# }
# compdef _git ggpnp=git-checkout

# function ggu() {
#     [[ "$#" != 1 ]] && local b="$(git_current_branch)"
#     git pull --rebase origin "${b:=$1}"
# }
# compdef _git ggu=git-checkout

function ggpur {ggu $args}
# function ggpull {git pull origin "$(git_current_branch)" $args}
# function ggpush {git push origin "$(git_current_branch)" $args}

# function ggsup {git branch --set-upstream-to=origin/$(git_current_branch) $args}
# function gpsup {git push --set-upstream origin $(git_current_branch) $args}

function ghh {git help $args}

function gignore {git update-index --assume-unchanged $args}
# function gignored {git ls-files -v | grep "^[[:lower:]]" $args}
# function git-svn-dcommit-push {git svn dcommit && git push github $(git_main_branch):svntrunk $args}

function gk {\gitk --all --branches $args}
# function gke {\gitk --all $(git log -g --pretty=%h) $args}

function gl {git pull $args}
function glg {git log --stat $args}
function glgp {git log --stat -p $args}
function glgg {git log --graph $args}
function glgga {git log --graph --decorate --all $args}
function glgm {git log --graph --max-count=10 $args}
function glo {git log --oneline --decorate $args}
# function glol="git log --graph --pretty {%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset $args}"
# function glols="git log --graph --pretty {%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset $args} --stat"
# function glod="git log --graph --pretty {%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset $args}"
# function glods="git log --graph --pretty {%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset $args} --date=short"
# function glola="git log --graph --pretty {%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset $args} --all"
function glog {git log --oneline --decorate --graph $args}
function gloga {git log --oneline --decorate --graph --all $args}
# alias glp="_git_log_prettily"

function gm {git merge $args}
# function gmom {git merge origin/$(git_main_branch) $args}
function gmt {git mergetool --no-prompt $args}
function gmtvim {git mergetool --no-prompt --tool=vimdiff $args}
# function gmum {git merge upstream/$(git_main_branch) $args}
function gma {git merge --abort $args}

function gp {git push $args}
function gpd {git push --dry-run $args}
function gpf {git push --force-with-lease $args}
function gpf! {git push --force $args}
# function gpoat {git push origin --all && git push origin --tags $args}
function gpu {git push upstream $args}
function gpv {git push -v $args}

function gr {git remote $args}
function gra {git remote add $args}
function grb {git rebase $args}
function grba {git rebase --abort $args}
function grbc {git rebase --continue $args}
function grbd {git rebase develop $args}
function grbi {git rebase -i $args}
# function grbm {git rebase $(git_main_branch) $args}
function grbs {git rebase --skip $args}
function grev {git revert $args}
function grh {git reset $args}
function grhh {git reset --hard $args}
# function groh {git reset origin/$(git_current_branch) --hard $args}
function grm {git rm $args}
function grmc {git rm --cached $args}
function grmv {git remote rename $args}
function grrm {git remote remove $args}
function grs {git restore $args}
function grset {git remote set-url $args}
function grss {git restore --source $args}
# function grt {cd "$(git rev-parse --show-toplevel || echo .)" $args}
function gru {git reset -- $args}
function grup {git remote update $args}
function grv {git remote -v $args}

function gsb {git status -sb $args}
function gsd {git svn dcommit $args}
function gsh {git show $args}
function gsi {git submodule init $args}
function gsps {git show --pretty=short --show-signature $args}
function gsr {git svn rebase $args}
function gss {git status -s $args}
function gst {git status $args}

# use the default stash push on git 2.13 and newer
# autoload -Uz is-at-least
# is-at-least 2.13 "$(git --version 2>/dev/null | awk '{print $3}')" \
# && function gsta {git stash push $args} \
# || function gsta {git stash save $args}
function gsta { git stash push $args }
function gstaa {git stash apply $args}
function gstc {git stash clear $args}
function gstd {git stash drop $args}
function gstl {git stash list $args}
function gstp {git stash pop $args}
function gsts {git stash show --text $args}
function gstu {git stash --include-untracked $args}
function gstall {git stash --all $args}
function gsu {git submodule update $args}
function gsw {git switch $args}
function gswc {git switch -c $args}

function gts {git tag -s $args}
# function gtv {git tag | sort -V $args}
# function gtl {gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl $args}

function gunignore {git update-index --no-assume-unchanged $args}
# function gunwip {git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1 $args}
function gup {git pull --rebase $args}
function gupv {git pull --rebase -v $args}
function gupa {git pull --rebase --autostash $args}
function gupav {git pull --rebase --autostash -v $args}
# function glum {git pull upstream $(git_main_branch) $args}

function gwch {git whatchanged -p --abbrev-commit --pretty=medium $args}
# function gwip {git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]" $args}

function gam {git am $args}
function gamc {git am --continue $args}
function gams {git am --skip $args}
function gama {git am --abort $args}
function gamscp {git am --show-current-patch $args}

# function grename() {
#     if [[ -z "$1" || -z "$2" ]]; then
#     echo "Usage: $0 old_branch new_branch"
#     return 1
#     fi

#     # Rename branch locally
#     git branch -m "$1" "$2"
#     # Rename branch in origin remote
#     if git push origin :"$1"; then
#     git push --set-upstream origin "$2"
#     fi
# }
