complete -f -c j -a (cat $HOME/.imc/deployment_aliases | tail -n +2 | cut -f 1 -d ":" | grep -v '^\.' | tr '\n' ' ')
