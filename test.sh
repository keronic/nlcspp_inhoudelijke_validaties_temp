# Path to the summary file that GitHub reads to display in the run summary
SUMMARY_FILE="$GITHUB_STEP_SUMMARY"

# Array of repo-relative file paths you want to link
files_to_link=(
  "templates/v11/R.5/failing/revisie_failing.xml"
  "templates/v11/R.5/failing/verwijderd_failing.xml"
)

# Start Markdown table in the summary
{
  echo "## Validation Failures"
  echo ""
  echo "| File | Link |"
  echo "|------|------|"

  for f in "${files_to_link[@]}"; do
    # Create a blob link for the current branch/commit
    # Example inside your summary-writing block:
    echo "| $f | [View file](https://github.com/${GITHUB_REPOSITORY}/blob/${GITHUB_REF_NAME}/$f) |"
  done
} >> "$SUMMARY_FILE"
