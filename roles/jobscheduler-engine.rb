name "js"
description "java"
# env_run_lists "name" => ["recipe[name]"], "environment_name" => ["recipe[name::attribute]"]
# override_attributes(
# default_attributes(
override_attributes(
  "jobscheduler" => {
    "version" => {
      "major" => "1.7",
      "minor" => "4177"
    }
  },
  "postgresql" => {
    "version" => "9.3",
    "enable_pgdg_yum" => true,
    "initdb_locale" => "--encoding=UTF8 --no-locale",
    "password" => {
      "postgres" => "postgres"
    },
    "config" => {
      "standard_conforming_strings" => false
    },
    "pg_hba" => [
      {:type => "local", :db => "all", :user => "all", :addr => nil, :method => "trust"},
      {:type => "host", :db => "all", :user => "all", :addr => '127.0.0.1/32', :method => "trust"}
    ]
  },
  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => 7,
    "oracle" => {
      "accept_oracle_download_terms" => true
    }
  }
)
run_list([
  "recipe[postgresql::server]",
  "recipe[database::postgresql]",
  "recipe[java]",
  "recipe[jobscheduler::engine_install]"
])
