require 'tempfile'

module MultiEncoder
  class BarcodeImage < AbstractImage

    def type
      'barcodes'
    end

    def write
      svg = ::Barby::Code128.new(@contents.downcase).to_svg(margin: @options[:margin], height: @options[:height])
      svg.sub!('<svg ', '<svg preserveAspectRatio="none" ')
      data_svg = "data:image/svg+xml;utf8,#{svg.gsub(/\n/, '')}"
      data_svg
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
