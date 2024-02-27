require 'hexapdf'
require 'fileutils'

def remove_js_from_pdf(input_file, output_file)
  document = HexaPDF::Document.open(input_file)

  # Copying pages from reader to writer, removing annotations and actions
  document.pages.each do |page|
    if page[:Annots]
      page[:Annots].each do |annotation|
        annotation.delete(:A) if annotation.key?(:A)  # Remove actions
      end
    end
  end

  # Attempting to remove document-level JavaScript
  if document.trailer[:Root][:Names] && document.trailer[:Root][:Names][:JavaScript]
    document.trailer[:Root][:Names].delete(:JavaScript)
  end

  # Saving the modified document to a new file
  document.write(output_file)
end

# Checking if the correct number of command-line arguments is provided
if ARGV.length != 2
  puts "Usage: ruby script_name.rb input.pdf output.pdf"
  exit(1)
end

# Getting input and output PDF file paths from command-line arguments
input_pdf = ARGV[0]
output_pdf = ARGV[1]

# Calling the function with the specified file paths
remove_js_from_pdf(input_pdf, output_pdf)
