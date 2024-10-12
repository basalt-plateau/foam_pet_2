




mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old

pip install uv poetry

apt install curl haproxy -y

#\
#
#	NVM + Node.js
#	
#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 20
#
#/

#\
#
#	Bun
#	
#
# apt install unzip; curl -fsSL https://bun.sh/install | bash; . /root/.bashrc
#
#/

#\
#
#	PNPM
#	
#
export SHELL=/bin/bash 
curl -fsSL https://get.pnpm.io/install.sh | sh -
. /root/.bashrc
#
#/

#\
#
#	Aptos Cli
#
#
curl -fsSL "https://aptos.dev/scripts/install_cli.py" | python3
export PATH="/root/.local/bin:$PATH"
#
#/


#
#	source /Metro/_plays/source_1.sh
#
git config --global --add safe.directory /Metro


#\
#
#	virtual environment
#
deactivate

cd /Metro && rm -rf .venv
cd /Metro && rm requirements.txt
cd /Metro && uv pip compile pyproject.toml -o requirements.txt

sleep 1

cd /Metro && uv venv
cd /Metro && . /Metro/.venv/bin/activate
cd /Metro && uv pip sync requirements.txt
#
#/


# deactivate

. /Metro/_plays/board/build_2.sh





