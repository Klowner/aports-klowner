readonly ALPINE_USER='alpine'
readonly CLONE_DIR="${CI_PROJECT_DIR:-$(pwd)}"
readonly GIT_REFID="${CI_BUILD_REF:-HEAD}"
readonly MIRROR_URI='http://dl-cdn.alpinelinux.org/alpine/edge'
readonly PACKAGER_PRIVATE_KEY_NAME="mark@klowner.com-57a9ef6f.rsa"
readonly PACAKGER_PUBLIC_KEY_NAME="$PACKAGER_PRIVATE_KEY_NAME.pub"

export PACKAGE_DIR=${CI_PROJECT_DIR:-$PWD}/packages

die() {
	print -s1 -c1 "$@\n" 1>&2
	exit 1
}

print() {
	local style=0
	local fcolor=9

	local opt; while getopts 's:c:' opt; do
		case "$opt" in
			s) style="$OPTARG";;
			c) fcolor="$OPTARG";;
		esac
	done

	shift $(( OPTIND - 1 ))
	local text="$@"

	printf "\033[${style};3${fcolor}m$text\033[0m"
}
