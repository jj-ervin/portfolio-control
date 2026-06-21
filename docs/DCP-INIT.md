# DCP Init

Status: active
Updated: 2026-06-06

`dcp init` is the scaffold path for installing DevX Control Plane into a portfolio root.

PowerShell usage:

```powershell
.\dcp.ps1 init
.\dcp.ps1 init -TargetPath C:\work
.\dcp.ps1 init -TargetPath C:\work -Force
.\dcp.ps1 init -NoHook
```

## What Init Does

- copies DCP Core files into the target root
- copies Governance Kit docs and templates
- copies Agent Kit and Team Kit docs
- copies distribution and consulting docs
- wires `protect-sources.ps1` as a pre-commit hook when the target is inside a git repo
- leaves existing files untouched unless `-Force` is passed

## Commands

```powershell
.\dcp.ps1 status
.\dcp.ps1 validate
.\dcp.ps1 validate-debt
.\dcp.ps1 help
```

`status` runs `dev-status.ps1`.

`validate` runs `validate-pointers.ps1`, `validate-review-grammar.ps1`, and `validate-debt.ps1`.

`validate-debt` scans tracked files for generated artifacts and obvious shim/compatibility debt markers.

`help` prints command usage.

## Safety Rules

- `init` never deletes files.
- `init` does not overwrite files unless `-Force` is passed.
- `init` does not create live runtime state.
- `init` uses the local repository as the template source.

## Release Criteria

DCP.31 is complete when a new user has one command that can scaffold the DCP files, wire the optional hook, and point them to validation and dashboard commands.
