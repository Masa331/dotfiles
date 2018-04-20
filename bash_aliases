alias ls='ls --color=auto'
alias la='ls -al --color=auto'

alias grep='grep --color'
alias remigrate='git reset db/structure.sql;git co db/structure.sql;rake db:drop;rake db:setup;rake db:migrate'

alias g='git'
alias webrick='rails s webrick'
alias rspec='bundle exec rspec'
