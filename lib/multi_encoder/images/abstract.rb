module MultiEncoder
  class AbstractImage

    OUTPUT_FORMAT = 'png'

    def initialize(string, options = {})
      @contents = string
      @options = options
      choose_storage
    end

    def href
      write
    end

    private
    def fingerprint
      Digest::MD5.hexdigest(@contents)[0,9].scan(/.../)
    end

    def choose_storage
      storage = case MultiEncoder::Storage.destination
                when :filesystem
                  MultiEncoder::Storage::FileSystem
                when :aws
                  MultiEncoder::Storage::AWS
                end
      self.class.send :include, storage
    end

    private
    def eps_path
      "#{Storage.aws_bucket_tmp_path}/#{@contents}-#{Time.now.strftime('%Y%m%d-%H%M%S')}.eps"
    end
  end
end
