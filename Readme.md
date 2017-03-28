# INSTRUCTIONS

choose auto or manual configuration no both.

## Auto-configuration

sh -c "$(curl -fsSL https://raw.githubusercontent.com/albertoCaroM/dotzsh/master/configure.sh)"

## Manual-configuration
~~~
git clone https://github.com/albertoCaroM/dotzsh.git  ~/.dotzsh 
cd ~/.dotzsh 
git submodule update --init --recursive 
~~~

### enable fzf   CTRl-T CTRL-R ALT-C whith steroids
~~~
  ln -s ~/.dotzsh/fzf ~/.fzf  
  ~/.fzf/install
~~~
if  you have linked before ~/.dotzsh/zshrc and ~/.zshrc, you must run:  sed '$d' ~/.dotzsh/zshrc # delete the las line of ~/.dotzsh/zshrc


### machine customization
~~~
  cp ~/.dotzsh/machinerc ~/.machinerc
~~~
Now edit and customize ~/.machinerc


### link ~/.dotzsh/zshrc
~~~
mv ~/.zshrc ~/.zshrc.old 
ln -s ~/.dotzsh/zshrc ~/.zshrc 
~~~
