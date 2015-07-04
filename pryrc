Pry.commands.alias_command 'lai', 'ls -mpi'
Pry.commands.alias_command 'lac', 'ls -Mmpic'

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
