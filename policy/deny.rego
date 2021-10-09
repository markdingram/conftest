package main

import data.expected

# should be run with the `--combine` flag
deny_version_incorrect[msg] {
    values_yaml = input[idx].contents
    file = input[idx].path
    env := split(file, "/")[1]
    version := values_yaml.chartVersion
    expected_version := expected[env].chartVersion
    
    version != expected_version
    msg := sprintf("[%s] - Version %s should equal: %s - FILE: %s", [ env, version, expected_version, file])
}
