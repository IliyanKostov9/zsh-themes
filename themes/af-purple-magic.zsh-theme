# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/

# dashed separator size
function afmagic_dashes {
  # check either virtualenv or condaenv variables
  local python_env_dir="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"
  local python_env="${python_env_dir##*/}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = *\(${python_env}\)* ]]; then
    echo $(( COLUMNS - ${#python_env} - 3 ))
  else
    echo $COLUMNS
  fi
}

# primary prompt: dashed separator, directory and vcs info
# E.g file path
PS1="${FG[237]}\${(l.\$(afmagic_dashes)..-.)}%{$reset_color%}
${FG[151]}%~\$(git_prompt_info)\$(hg_prompt_info) ${FG[151]}%(!.#.λ)%{$reset_color%} "
# »

PS2="%{$fg[red]%}\ %{$reset_color%}"

# right prompt: return code, virtualenv and context (user@host)
RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
if (( $+functions[virtualenv_prompt_info] )); then
  RPS1+='$(virtualenv_prompt_info)'
fi
RPS1+=" ${FG[237]}%n@%m%{$reset_color%}"


# Git
# Eg (feat/test
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[091]}(${FG[213]}"

ZSH_THEME_GIT_PROMPT_CLEAN=""
# Eg * when git has uncommited changes
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[131]}*%{$reset_color%}" 

# Eg )
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[091]})%{$reset_color%}"  

# hg settings
# Mercury
ZSH_THEME_HG_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[075]}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
