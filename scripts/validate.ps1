[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [string]$DeftPath
)

$ErrorActionPreference = 'Stop'
$ExpectedDigest = 'sha256:495075181043c6cb95ad4080ea894faa6c1b798b3eb2db97571d0b53ff0cbdaf'
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
  $Output = (& pnpm module:check $ModuleRoot 2>&1 | Out-String).Trim()
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

Write-Output "Contacts 1.8.0 matches $ExpectedDigest"
