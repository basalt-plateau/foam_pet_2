











#\
#
#	APT: curl, haproxy
#	
#
apt update
# apt upgrade -y

# DEBIAN_FRONTEND=noninteractive apt install python3-pip -y

apt install python3-pip -y
apt install curl haproxy git -y
#
#/

git config --global user.email friends
git config --global user.name friends

mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.old

pip install uv poetry


#\
#
#	NVM + Node.js
#	
#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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





