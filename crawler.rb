# frozen_string_literal: true

require 'fileutils'
require 'relaton_w3c'

FileUtils.rm_rf('data')
FileUtils.rm Dir.glob('index*')

system("git clone https://github.com/relaton/w3c-tr-archive w3c-tr-archive")

RelatonW3c::DataFetcher.fetch 'w3c-tr-archive'
RelatonW3c::DataFetcher.fetch 'w3c-rdf'

system("zip index-w3c.zip index-w3c.yaml")
system("zip index1.zip index1.yaml")
system("git add index-w3c.yaml index-w3c.zip index1.yaml index1.zip")
