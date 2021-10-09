Conf Test Experiment
====================


Validating that versions specified in each environment `values.yaml` file match their expectation:

```
├── dev
│   ├── dev_a
│   │   └── values.yaml
│   └── dev_b
│       └── values.yaml
├── int
│   ├── int_a
│   │   └── values.yaml
│   └── int_b
│       └── values.yaml
├── prod
│   ├── prod_a
│   │   └── values.yaml
│   ├── prod_b
│   │   └── values.yaml
│   └── prod_c
│       └── values.yaml
└── staging
    ├── stage_a
    │   └── values.yaml
    └── stage_b
        └── values.yaml
```


The expected versions for each environmet are set in <data.yaml>:

````
expected:
  dev:
    chartVersion: 0.0.1946

  int:
    chartVersion: 0.0.1945
  
  staging:
    chartVersion: 0.0.1920

  prod:
    chartVersion: 0.0.1920
````

Install conftest with `brew install conftest` & run with `conftest test environments --combine --data data.yaml`:

````
$ conftest test environments --combine --data data.yaml
FAIL - Combined - main - [dev] - Version 0.0.1945 should equal: 0.0.1946 - FILE: environments/dev/dev_a/values.yaml
FAIL - Combined - main - [int] - Version 0.0.1940 should equal: 0.0.1945 - FILE: environments/int/int_b/values.yaml
````

The test has picked up all the files that are out of step with the expectation for their owning environment.

> Approach inspired by https://atorico.com/conftest-combine-flag/
