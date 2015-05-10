module Importable
  extend ActiveSupport::Concern
 
  module ClassMethods

    def import(file)
      error_found = false
      errors = {}
      unless file.nil?
        i = 2
        insertion_hash = SmarterCSV.process file.path
        # Validation usging brute force
        insertion_hash.each do |chunk| #:chunk_size => 10
          a = self.new chunk
          a.valid?
          unless a.errors.messages.empty?
            errors[:messages] = a.errors.full_messages
            errors[:num_errors] = a.errors.size
            errors[:filename] = file.original_filename
            errors[:line] = "#{i}"
            error_found = true
          end
          break if error_found
          i = i + 1
        end
        unless error_found
          insertion_hash.each do |chunk|
            self.create(chunk)
          end
        end
      else
        errors[:file] = 'blank'
      end
      errors
    end

  end
end