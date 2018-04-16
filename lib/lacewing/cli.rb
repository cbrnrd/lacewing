require 'lacewing'

module Lacewing
  class Cli
    def self.start(opts = {})
      $prompt = TTY::Prompt.new
      Lacewing::Cli.show_hello(opts)
      Lacewing::Scans.subdomains
      Lacewing::Cli.narrow?
      Lacewing::Scans.nmap
      Lacewing::Cli.exploit_menu
    end

    def self.show_hello(opts)
      puts Lacewing::PROMPT + "Hi there #{ENV['USERNAME']}!"
      $target = opts[:target] || $prompt.ask('What website would you like to research? ')
      puts "Using #{$target.green} as a target."
    end

    def self.narrow?
      narrow = $prompt.yes?('Would you like to change your target to a subdomain?')
      $target = $prompt.ask("What's your new target? (*.#{$target})") if narrow
    end

    def self.exploit_menu; end

  end
end
