




cd "$(dirname "$0")" || exit


pip install uv

#/
#
#	install
#
deactivate

rm -rf .venv

sleep 1

uv venv
. ./.venv/bin/activate

rm dependencies.txt
uv pip compile pyproject.toml -o dependencies.txt
uv pip sync dependencies.txt
#
#\

