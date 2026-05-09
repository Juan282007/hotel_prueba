param(
  [string]$DatabaseName = "hotel_system",
  [string]$User = "postgres",
  [string]$Password = "abcd1234",
  [string]$HostName = "localhost",
  [int]$Port = 5438
)

$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$changelog = Join-Path $root "changelog\changelog-master.sql"

if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
  throw "psql was not found in PATH. Install the PostgreSQL client or run with Docker Compose and Liquibase."
}

$previoususPassword = $env:PGPASSWORD
$env:PGPASSWORD = $Password
try {
  psql -h $HostName -p $Port -U $User -d $DatabaseName -f $changelog
}
finally {
  $env:PGPASSWORD = $previoususPassword
}
