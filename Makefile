SHELL_SCRIPTS := $(shell find . -not -path '*/.*' -type f -exec sh -c "file '{}' | grep -q 'shell script'" \; -print)

.PHONY: test
test: run_tests
	./run_tests

.PHONY: test-local
test-local: run_tests
	./tests/run_tests_in_isolation

run_tests: lib/tmux-test/.git
	./lib/tmux-test/setup

lib/tmux-test/.git:
	git submodule update --init

lint:
	shellcheck ${SHELL_SCRIPTS}


clean:
	if [[ -f ./lib/tmux-test/setup ]]; then\
		./lib/tmux-test/setup undo;\
	fi
	# TODO: consider changing how this works
	git checkout -- .gitignore

.PHONY: test lint clean
