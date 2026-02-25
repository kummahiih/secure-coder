# Secure Sandboxed AI Coding Agent

A containerized, zero-trust development environment for AI coding agents (like [Aider](https://aider.chat/)). This setup ensures that the AI can write and edit code autonomously without ever having access to your host machine, your Git history, or your actual API keys.



## 🛡️ Design Principles & Architecture

This project is built around strict security boundaries to prevent prompt injections, accidental deletions, or credential exfiltration by the AI model.

1. **Credential Isolation (Sidecar Proxy):** The AI agent container never possesses your real API keys (OpenAI, Anthropic, Gemini). Instead, it is routed through an isolated [LiteLLM](https://github.com/BerriAI/litellm) sidecar container. The proxy securely holds the keys in memory and intercepts the agent's requests.
2. **Filesystem Sandboxing:** The agent is heavily restricted using Docker bind mounts:
   * **`src/` directory:** Mounted as Read/Write (`:rw`). The agent can only modify files here.
   * **`.git/` directory:** Intentionally excluded. The agent cannot read your commit history or alter your repository state.
   * **Configuration & Prompts:** Mounted as Read-Only (`:ro`). The agent can read its instructions but cannot overwrite its own behavioral guardrails.
3. **Network Isolation:** The agent communicates exclusively over a dedicated internal Docker bridge network (`agent_net`). 
4. **Ephemeral Execution:** The environment is designed to be spun up and torn down instantly. Exiting the agent automatically kills the proxy, ensuring no secrets linger in memory.

## ⚙️ Prerequisites

* Docker Engine
* Docker Compose V2 (using the `docker-compose` command)

## 🚀 Quick Start

**1. Clone the repository and set up the working directory:**
```bash
git clone <your-repo-url> secure-coder
cd secure-coder
mkdir src

```

Note: The boilerplate configurations and wrapper scripts in this repository were generated with the assistance of Google Gemini.