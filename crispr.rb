require 'rubygems'
require 'fileutils'
require 'json'
require 'bio'

# Read DNA from .txt, create new Bio::Sequence
file = File.open('dna.txt', 'r')
sequence = Bio::Sequence::NA.new(file.read).upcase
puts "Searching #{sequence.length} base pairs for CRISPR targets..."

# Regular Expression for CRISPR (forwards/backwards)
crispr = /[G][G].{19}[G][G]|[C][C].{19}[C][C]/

# Initialize targets
targets = []

# Scan for matches, Create index and initialize microhomology
sequence.scan(crispr) do |crispr|

  # Compile first set of data to JSON
  targets << {
              "target" => crispr,
              "first" => Regexp.last_match.offset(0).first, 
              "last" => Regexp.last_match.offset(0).last,
              "microhomology" => []
              }
end

if targets
  targets.each do |target|

    # The microhomology strategy
    mh_strategy = [12, 24, 48]

    # Create each MH
    mh_strategy.each do |m|

      # Double strand break based on polarity
      if target["target"][0] == "G"
        mh_last_char = target["last"] - 7
      else
        mh_last_char = target["first"] + 5
      end
        mh_first_char = mh_last_char - (m - 1)

      # Output target information
      target["microhomology"] << { 
        "homology_length" => "mh#{m}",
        "mh#{m}_oligo_forward" => (sequence[mh_first_char...target["last"]].complement + sequence[mh_first_char..mh_last_char]).upcase,
        "mh#{m}_oligo_reverse" => (sequence[mh_first_char...target["last"]].complement + sequence[mh_first_char..mh_last_char]).complement.upcase # (sequence[mh_first_char..mh_last_char].complement.reverse + sequence[mh_first_char...target["last"]]).upcase,
      }
    end
  end
  
  # CRISPR target file path
  crispr_file = "targets/crispr/crisper-#{Time.now.strftime("%m%d%Y-%M-%S")}.json"
  
  # Unless /targets/crispr folders exist, create them
  FileUtils.mkdir_p("targets/crispr") unless Dir.exists?("targets/crispr")

  # Write targets in file. If it doesn't exist, create it
  File.open(crispr_file, 'w+') {|f| f.write(JSON.pretty_generate(targets)) }
  puts "Found #{targets.length} targets.\nTargets exported to #{crispr_file}."
  
  # Print targets to screen and open file in default text editor
  puts JSON.pretty_generate(targets)
  system("open #{crispr_file}")

else
  puts "Sorry, no CRISPR targets found."
end
