module Lacewing
  class Scans
    def self.subdomains
      return unless $prompt.yes?(Lacewing::PROMPT + 'Do you want to find subdomains?')
      puts Lacewing::PROMPT + "Here are a few places you can get #{'subdomains'.bold}:"
      places = ["https://www.virustotal.com/#/domain/#{$target.gsub('http://', '')}", 'https://dnsdumpster.com/', 'https://pentest-tools.com/information-gathering/find-subdomains-of-domain']

      places.each { |i| puts "\t#{i}" }

      if $prompt.yes?(Lacewing::PROMPT + 'Would you like to open one of these in a browser?')
        url = $prompt.select('Which one?', places)
        system("open \"#{url}\"")
      end
    end

    def self.nmap
      puts Lacewing::PROMPT + 'Here are some nmap scans to get info on ' + $target
      scans = ["nmap -p 1-65535 -sV -sS -T4 \"#{$target}\"", "nmap -v -sS -A -T4 \"#{$target}\"", "nmap -v -Pn -sS -sV --version-light \"#{$target}\""]
      scans.each { |i| puts "\t#{i}" }
      if $prompt.yes?(Lacewing::PROMPT + 'Would you like to execute one of these? (nmap required)')
        if `which nmap`.empty?
          puts Lacewing::PROMPT + 'nmap is not installed. Skipping...'.red
        else
          cmd = $prompt.select('Which one?', scans)
          system(cmd)
        end
      end
    end

  end # Scans
end # Lacewing

