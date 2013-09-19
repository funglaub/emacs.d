all: install_cask install_packages update_packages compile

compile:
	@echo Byte compiling all .el files
	emacs --batch --eval '(byte-recompile-directory (expand-file-name "~/.emacs.d/site-start.d") 0)'
	emacs --batch --eval '(byte-recompile-directory (expand-file-name "~/.emacs.d/site-lisp") 0)'

install_cask:
	if [ ! -d ~/.cask ]; then \
		curl -fsSkL https://raw.github.com/rejeep/cask/master/go | sh; \
	fi

install_packages:
	@echo Installing Cask packages
	${HOME}/.cask/bin/cask

update_packages:
	@echo Updating Cask packages
	${HOME}/.cask/bin/cask update
