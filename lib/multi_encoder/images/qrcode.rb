module MultiEncoder
  class QRcodeImage < AbstractImage

    def type
      'qrcodes'
    end

    def write
      qrcode = RQRCode::QRCode.new(@contents.downcase)
      svg = qrcode.as_svg(offset: 0, color: '000', 
        shape_rendering: 'crispEdges', 
        module_size: @options[:size]) 
      svg.sub!('<svg ', '<svg preserveAspectRatio="none" ')
      data_svg = "data:image/svg+xml;utf8,#{svg.gsub(/\n/, '')}"
      data_svg
    end
  end
end
