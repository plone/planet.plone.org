======
Docker
======

- write how we do docker dev

- add our tools [dockerlint]

You can install dockerlint via npm

.. code-block:: bash

    npm install dockerlint

clone it from github

.. todo:: add example

or use this docker container

.. todo:: add example

.. code-block:: bash

    #!/bin/bash
    #

    # Colors
    red=`tput setaf 1`
    green=`tput setaf 2`
    reset=`tput sgr0`


    # Common
    REPO=$(pwd)
    EXIT_CODE=$((${EXIT_CODE} + $?))


    # Dockerlint
    for FILE in `git diff --cached --name-only | egrep Dockerfile`; do
        if test -f ${REPO}/${FILE}; then
            echo "${green}Running tests on Dockerfile${reset}"
            dockerlint ${REPO}/${FILE}
        if [[ ${EXIT_CODE} -ne 0 ]]; then
            echo ""
            echo "${red}Problems were found${reset}"
            echo "${red}Commit aborted.${reset}"
            exit ${EXIT_CODE}
        fi

        else
            continue
        fi
done

..todo:: clean and format example above