require 'tempfile'

module MultiEncoder
  class BarcodeImage < AbstractImage

    def type
      'barcodes'
    end

    def write
      barcode = Barby::Code128B.new(@contents.downcase)
      barcode_png = Barby::PngOutputter.new(barcode)
      extract_options(barcode_png)
      File.open("#{file_path}", 'wb'){ |f|
        f.write barcode_png.to_png()
      }

      save if respond_to? :save
    end

    private
    def extract_options(bc)
      bc.height = @options[:height] if @options[:height]
      bc.xdim   = @options[:xdim] if @options[:xdim]
      bc.ydim   = @options[:ydim]  if @options[:ydim]
      bc.margin = @options[:margin]  if @options[:margin]
      bc
    end

  end
end
