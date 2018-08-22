When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} help`)
end

When /^I get shit myself for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I shit `#{app_name} help`)
end

# Add more step definitions here
