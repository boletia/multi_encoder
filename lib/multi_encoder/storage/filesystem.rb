module MultiEncoder
  module Storage
    module FileSystem

      def url
        "file:///" + file_path.to_s
      end

      def root
        defined?(Rails) ? Rails.root : Pathname.new('/tmp')
      end

      def directory
        root.join 'public', 'system', type, *fingerprint
      end

      def file_path
        Pathname.new "#{Storage.aws_bucket_tmp_path}/#{type}-#{filename}.#{MultiEncoder::BarcodeImage::OUTPUT_FORMAT}"
      end

      def exists?
        file_path.exist?
      end

      private
      def filename
        fingerprint.join
      end

    end
  end
end
