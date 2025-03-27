# Pulse Action

![GitHub release (latest by date)](https://img.shields.io/github/v/release/TrueSelph/pulse_action)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/TrueSelph/pulse_action/test-pulse_action.yaml)
![GitHub issues](https://img.shields.io/github/issues/TrueSelph/pulse_action)
![GitHub pull requests](https://img.shields.io/github/issues-pr/TrueSelph/pulse_action)
![GitHub](https://img.shields.io/github/license/TrueSelph/pulse_action)

Core pulse action for triggering scheduled pulse abilities on subscribing actions.

## Package Information

- **Name:** `jivas/pulse_action`
- **Author:** [V75 Inc.](https://v75inc.com/)
- **Architype:** `PulseAction`

## Meta Information

- **Title:** Pulse Action
- **Group:** core
- **Type:** action

## Configuration

- **Singleton:** true

## Dependencies

- **Jivas:** `^2.0.0`

This package, developed by V75 Inc., provides a core mechanism for triggering scheduled pulse activities in subscribing actions. As a pulse action, it ensures periodic and timely execution of tasks within the subscribing actions framework. The package is a singleton and requires the Jivas library version 2.0.0.

---

## How to Use

Below is detailed guidance on how to configure and use the Pulse Action.

### Overview

The Pulse Action provides a mechanism for scheduling and triggering periodic tasks. It supports configurations for various use cases, including:

- **Custom schedules** for specific tasks.
- **Integration** with subscribing actions for seamless task execution.
- **Scalability** for handling multiple pulse triggers.

---

### Configuration Structure

The configuration consists of the following components:

### `pulse_settings`

Defines the settings for the pulse action, such as intervals and task parameters.

```python
pulse_settings = {
    "interval": "5m",           # Example: "5m" for 5 minutes, "1h" for 1 hour
    "task": "task_identifier",  # Identifier for the task to be triggered
    "parameters": {             # Task-specific parameters
        "priority": "high",
        "retry": 3
    }
}
```

---

### Example Configurations

### Basic Configuration for a 5-Minute Interval

```python
pulse_settings = {
    "interval": "5m",
    "task": "send_email_notifications",
    "parameters": {
        "priority": "high",
        "retry": 3
    }
}
```

### Best Practices
- Validate your task identifiers and parameters before deployment.
- Test pulse schedules in a staging environment before production use.

---

## 🔰 Contributing

- **🐛 [Report Issues](https://github.com/TrueSelph/pulse_action/issues)**: Submit bugs found or log feature requests for the `pulse_action` project.
- **💡 [Submit Pull Requests](https://github.com/TrueSelph/pulse_action/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/TrueSelph/pulse_action
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details open>
<summary>Contributor Graph</summary>
<br>
<p align="left">
    <a href="https://github.com/TrueSelph/pulse_action/graphs/contributors">
        <img src="https://contrib.rocks/image?repo=TrueSelph/pulse_action" />
   </a>
</p>
</details>

## 🎗 License

This project is protected under the Apache License 2.0. See [LICENSE](./LICENSE) for more information.