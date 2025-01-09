# Generating shell completion scripts

from claude-3-5-sonnet 2025-01-09 12:28:53 +11:00 Thu

tidy up the formatting please # ai!

ask> Isn't there a tool that already inspects argparse and generates completion scripts for ba
sh and zsh?                                                                                   

Yes! You're probably thinking of shtab - it's specifically designed to generate static shell  
completion scripts from Python's argparse. It's much more suitable for what you want to do.   

You can use it like this:                                                                     

                                                                                              
 ```shell                                                                     
 # In your Python code   
 import shtab                                                                                 
                                                                                              
 # Add this to where you set up your parser                                                   
 shtab.add_argument_to(parser)  # Adds --print-completion option                              
                                                                                              
 # Or generate directly:                                                                      
 shtab.complete(parser, shell="bash")  # or "zsh"                                             
 ```
                                                                                              

Or from the command line:                                                                    

 ```shell                                                                     
 shtab your_script.py > completion.sh                                                         
```

The big advantages of shtab over argcomplete are:                                             

 1 It generates true static completion scripts                                                
 2 Much faster completion since there's no Python process spawning                            
 3 No runtime dependencies needed for the completions to work                                 

This would be a much better choice for adding completions to the aider project.            