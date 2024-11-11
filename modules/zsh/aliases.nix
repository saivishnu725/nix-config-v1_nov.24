{ pkgs, ... }:

{
  # Define shell aliases
  programs.zsh.shellAliases = {
    ## General Aliases
    cls = "clear";
    copy = "xclip -selection clipboard";
    pa = "xclip -o -selection clipboard";
    e = "exit";
    vim = "nvim";

    ## Git Aliases
    gits = "git status";
    gitas = "git add . && git status";
    gita = "git add";
    gitc = "git commit -m";
    gitac = "git add . && git commit -m";
    gitsac = "git add . && git status && git commit -m";
    gitp = "git push";

    ## Music and Media
    music = "cd $HOME/Music && mpv . --shuffle --no-audio-display";
    song = "mpv $HOME/Music/playlist/<playlist>.m3u";
    song-shuffle = "mpv $HOME/Music/playlist/<playlist>.m3u --shuffle";

    ## SSH
    s = "ssh theunconcernedape@theunconcernedape.me -i $HOME/.ssh/vps";

    ## Miscellaneous
    pg = "ping google.com";
  };

  # Define custom functions
   programs.zsh.envExtra = ''
        # Helper: Extract filename without extension
        onlyname() {
          filename=$1
          name=$\{filename%.*}
          echo $name
        }

        # Java: Edit, compile, and run
        j() {
          filename=$1
          class=$(onlyname $filename)
          nvim $filename && javac $filename && java $class
        }

        # Python: Edit and run
        py() {
          filename=$1
          nvim $filename && python3 $filename
        }
        pyr() {
          filename=$1
          python3 $filename
        }

        # C: Edit, compile, and run
        c() {
          filename=$1
          name=$(onlyname $filename)
          vim $filename
          gcc -o $name $filename
          ./$name
        }
        cr() {
          filename=$1
          name=$(onlyname $filename)
          gcc -o $name $filename
          ./$name
        }

        # C with APUE library
        c-apue() {
          filename=$1
          name=$(onlyname $filename)
          gcc -o $name $filename -I ~/Programs/c/apue.3e/include/ -L ~/Programs/c/apue.3e/lib/ -lapue
        }

        # Port forwarding via SSH
        port-forw() {
          local_port=$1
          remote_port=$\{2:-$1}  # Default remote port same as local if not provided
          ssh -N -L ''${local_port}:localhost:''${remote_port} theunconcernedape@theunconcernedape.me -i $HOME/.ssh/vps -v
        }

        # File sender via rsync
        send-files() {
          destination="/home/theunconcernedape/rsync-files/"  # Default destination
          if [ -n "$1" ]; then
            destination="$1"
            shift
          fi
          rsync -aPvh -e "ssh -i $HOME/.ssh/vps" "$@" "theunconcernedape@theunconcernedape.me:$destination"
        }
      '';
}

