$: << File.dirname(__FILE__) + '/multi_encoder'

require 'version'
require 'qrencoder'
#require 'gbarcode'
require 'barby'
require 'storage'
require 'images'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'
require 'barby/outputter/svg_outputter'
require 'rqrcode'
require 'railtie' if defined? Rails
