# PDF-Sanitizer
This Ruby script removes JavaScript content from a PDF file using the hexapdf gem. It iterates through each page of the input PDF and removes JavaScript-related annotations and document-level JavaScript.

## Requirements
```
apt-get install ruby-full
gem install hexapdf
```

## Usage
```
ruby pdf-sanitizer.rb malicious.pdf clean.pdf
```

## Contribution
Contributions are welcome! If you find issues or have suggestions for improvements, please create an issue or submit a pull request.

## Acknowledgments
Special thanks to the contributors of the hexapdf gem.

## Disclaimer
Modifying PDF files may alter their functionality. The author of this script will not be accountable for any potential damages, loss of functionality, or unintended consequences resulting from the use of this script.
