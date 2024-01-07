complete -c my_function -f -n '__fish_my_function_completion'

function __fish_my_function_completion --description 'My function completion'
    set -l arguments
    set -l current_argument (commandline -ct)

    switch (count $arguments)
        case 1
            set arguments --option1 --option2 --option3
            for argument in $arguments
                echo $argument
            end
        case 2
            # Suggestions based on the first argument
            switch $arguments[1]
                case --option1
                    echo value1 value2
                case --option2
                    echo value3 value4
                case --option3
                    echo value5 value6
            end
    end
end

