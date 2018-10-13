warn('Work in Progress...') if github.pr_title.include? "WIP"

github.dismiss_out_of_range_messages

# PR rules
warn('Put some description for your work') if github.pr_body.length == 0 && git.lines_of_code > 10

# File protection
git.modified_files.grep(/^[A-Z]{1}.*file$/) { |file|
  message("#{file} has been changed.")
}
protected_files = ['.gitignore', '.swiftlint.yml']
protected_files.each do |file|
  next if git.modified_files.grep(/#{file}/).empty?
  message("#{file} has been changed.")
end

# Swiftlint
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true
