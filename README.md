# Pagerduty Orb [![CircleCI Build Status](https://circleci.com/gh/amanjain97/Pagerduty-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/amanjain97/Pagerduty-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/amanjain97/pagerduty)](https://circleci.com/orbs/registry/orb/amanjain97/pagerduty) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/amanjain97/Pagerduty-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Easily integrate custom [Pagerduty](https://pagerduty.com/ "Pagerduty") notifications into your [CircleCI](https://circleci.com/ "CircleCI") projects. Create custom alert incidents for any job failure or success.

Learn more about [Orbs](https://circleci.com/docs/2.0/using-orbs/ "Using Orbs").

## Usage
Example config:

```yaml
version: 2.1

orbs:
  pagerduty: amanjain97/pagerduty@x.y.z/*

jobs:
  build:
    docker:
      - image: <docker image>
    steps:
      - pagerduty/<command>
```

`pagerduty@1.0.0` from the `amanjain97` namespace is imported into the config.yml as `pagerduty` and can then be referenced as such as any job.

## Commands

### notify-on-failure
Create an incident when a CircleCI job is failed

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `from_account` | `string` | '' | he email address of a valid user associated with the account making the request. |
| `incident_title` | `string` | '$CIRCLE_JOB job has caused an incident' | Enter custom title. |
| `incident_description` | `string` | '' | Enter the string describing the incident. |
| `priority` | `string` | '' | The priority of this incident. |
| `urgency` | `enum` | 'low' | The urgency of the incident and it can be high or low. |
| `incident_key` | `string` | '' | A string which identifies the incident. Sending subsequent requests referencing the same service and with the same incident_key will result in those requests being rejected if an open incident matches that incident_key. |
| `escalation_policy` | `string` | '' | Delegate this incident to the specified escalation policy. Cannot be specified if an assignee is given. |
| `service` | `string` | '' | The incident will be created on this service. |
| `apitoken` | `string` | '${PAGERDUTY_APITOKEN}' | Enter either your Pagertduty API token or use the CircleCI UI to add your token under the 'PAGERDUTY_APITOKEN' env var |

Example:

```yaml
version: 2.1

orbs:
  pagerduty: amanjain97/pagerduty@x.y.z/*

jobs:
    docker:
      - image: <docker image>
    steps:
      - pagerduty/notify-on-failure:
          service: "PB73G4C"
          from_account: "admin@org.com"
          urgency: "high"
          apitoken: "hbh94380F3902_y" # or set in environment variables using Circle CI 
```

## Help

### How to get your Pagerduty API Token 
Full instructions can be found at Pagerduty documentation: https://support.pagerduty.com/docs/generating-api-keys

### How to setup the service ID 
Check Pagerduty [docs](https://support.pagerduty.com/docs)

## Contributing
We welcome [issues](https://github.com/amanjain97/Pagerduty-orb/issues) to and [pull requests](https://github.com/amanjain97/Pagerduty-orb/pulls) against this repository! For further questions/comments about this or other orbs, visit [CircleCI's Orbs discussion forum](https://discuss.circleci.com/c/ecosystem/orbs).

## License
This project is licensed under the MIT License - read [LICENSE](LICENSE) file for details.
