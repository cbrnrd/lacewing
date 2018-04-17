require 'lacewing'

module Lacewing
  class Cli
    def self.start(opts = {})
      $prompt = TTY::Prompt.new
      Lacewing::Cli.show_hello(opts)
      Lacewing::Scans.subdomains
      Lacewing::Cli.narrow?
      Lacewing::Scans.nmap
      loop do
        Lacewing::Cli.exploit_menu
      end
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

    def self.exploit_menu
      opts = ['LFI', 'RCE', 'XSS', 'Code Injection', 'Reverse Shell', 'SQL Injection']
      opt = $prompt.select(Lacewing::PROMPT + 'What vulnerability would you like to use?', opts)

      case opt
      when 'LFI'
        Lacewing::Exploits.lfi
      when 'RCE'
        Lacewing::Exploits.rce
      when 'XSS'
        Lacewing::Exploits.xss
      when 'Code Injection'
        Lacewing::Exploits.code_injection
      when 'Reverse Shell'
        Lacewing::Exploits.reverse_shell
      when 'SQL Injection'
        Lacewing::Exploits.sqli
      end
    end
  end
end
