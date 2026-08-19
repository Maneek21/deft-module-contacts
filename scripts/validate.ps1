[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [string]$DeftPath
)

$ErrorActionPreference = 'Stop'
$ExpectedDigest = 'sha256:431d879dd511261346c2d38b1c6341f61eb7878ea4690ca836425b3a0c2c266d'
$ModuleRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if ([string]::IsNullOrWhiteSpace($DeftPath)) {
  $WorkspaceRoot = Split-Path -Parent $ModuleRoot
  $DeftPath = Join-Path $WorkspaceRoot 'Deft'
}

if (-not (Test-Path -LiteralPath (Join-Path $DeftPath 'scripts/modules-cli.ts') -PathType Leaf)) {
  throw "No compatible Deft checkout found at '$DeftPath'. Pass its path as the first argument."
}

$ResolvedDeftPath = (Resolve-Path -LiteralPath $DeftPath).Path
Push-Location -LiteralPath $ResolvedDeftPath
try {
  $Output = (& corepack pnpm module:check $ModuleRoot 2>&1 | Out-String).Trim()
  if ($LASTEXITCODE -ne 0) {
    throw "Deft module validation failed:`n$Output"
  }
} finally {
  Pop-Location
}

Write-Output $Output
if ($Output -notmatch [regex]::Escape($ExpectedDigest)) {
  throw "Manifest is valid but its digest changed. Expected $ExpectedDigest. Update the version, changelog, README, and validation helpers intentionally."
}

Write-Output "Contacts 1.1.0 matches $ExpectedDigest"
