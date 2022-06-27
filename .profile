MYPATH="$HOME/.bin/home:$HOME/.bin/calc:$HOME/.bin/android:$HOME/.bin/flutter:$HOME/.bin/cpp:$HOME/.bin/git:$HOME/.bin/net:$HOME/.bin/util:$HOME/.bin/docker:$HOME/.bin/vbox:$HOME/.bin/qmk:$HOME/.bin/js:$HOME/.bin/rust:$HOME/.bin/file:$HOME/.bin/env:$HOME/.bin/work:$HOME/.bin/play:$MYPATH"
export PI='3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067'
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMELIB="$HOME/Library"
export PROJECTS="$HOME/Projects"
export HOMEWORK="$HOME/.work"

[[ `echo "$0" | grep 'bash'` && -r "$HOME/.bashenv" ]] && . "$HOME/.bashenv"

alias gradle='./gradlew'
alias pro='mkdir -p $PROJECTS && cd $PROJECTS'
alias loprof='mkdir -p $HOME/.local && vim $HOME/.local/profile'

[[ ! -z "$OSTYPE" && -d "$HOME/.bin/$OSTYPE" ]] && MYPATH="$HOME/.bin/$OSTYPE:$MYPATH"
if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    export JAVA_HOME="$HOMELIB/jdk"
elif [[ "$OSTYPE" == 'darwin'* ]]; then
    MYPATH="$HOME/.bin/darwin:$MYPATH"
    export JAVA_HOME=`/usr/libexec/java_home`
    [[ `uname -p` == 'arm' ]] && MYPATH="/opt/homebrew/bin:$MYPATH"  
elif [[ "$OSTYPE" == 'msys' ]]; then
    export HOMELIB='/c/lib'
    [[ -d "$HOMELIB/python" ]] && MYPATH="$HOMELIB/python:$MYPATH"
    [[ -d "$HOME/.cargo/bin" ]] && MYPATH="$HOME/.cargo/bin:$MYPATH"
    [[ -d '/c/Library/Developer/Toolchains/unknown-Asserts-development.xctoolchain/usr/bin' ]] &&\
        export SWIFT_HOME='/c/Library/Developer/Toolchains/unknown-Asserts-development.xctoolchain' &&\
        MYPATH="$SWIFT_HOME/usr/bin:$MYPATH";
    set bell-style none
fi

export ANDROID_HOME="$HOMELIB/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk"
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME"

[[ -d "$ANDROID_HOME/tools" ]] && MYPATH="$ANDROID_HOME/tools:$MYPATH"
[[ -d "$ANDROID_HOME/tools/bin" ]] && MYPATH="$ANDROID_HOME/tools/bin:$MYPATH"
[[ -d "$ANDROID_HOME/platform-tools" ]] && MYPATH="$ANDROID_HOME/platform-tools:$MYPATH"
[[ -d "$ANDROID_HOME/emulator" ]] && MYPATH="$ANDROID_HOME/emulator:$MYPATH"
[[ -d "$JAVA_HOME/bin" ]] && MYPATH="$JAVA_HOME/bin:$MYPATH"
[[ -d "$HOMELIB/swift/usr/bin/" ]] && MYPATH="$HOMELIB/swift/usr/bin/:$MYPATH"
[[ -d "$HOMELIB/node/bin" ]] && MYPATH="$HOMELIB/node/bin:$MYPATH"
[[ -d "$HOMELIB/flutter/bin" ]] && MYPATH="$HOMELIB/flutter/bin:$MYPATH"
[[ -d "$HOME/.pub-cache/bin" ]] && MYPATH="$HOME/.pub-cache/bin:$MYPATH"
[[ -d "$HOME/.local/bin" ]] && MYPATH="$HOME/.local/bin:$MYPATH"
[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

export PATH="$MYPATH:$PATH"

[[ -r "$HOME/.local/profile" ]] && . "$HOME/.local/profile"
[[ -z "`which gawk`" ]] && echo 'gawk missing!'
