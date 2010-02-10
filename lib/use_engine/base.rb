module UseEngine::Base
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
  
    def use_engine *args
    
      options = args.extract_options!
    
      engine_name = args.first
      engine_version = options[:version] || local_engine_version(engine_name)
      engine_name = "vendor/gems/#{engine_name}-#{engine_version}"
      engine_model_name = (options[:model] || self.name).underscore
      relative_path = options[:path] || path_for_class
      
      require_dependency File.join(RAILS_ROOT, "#{engine_name}/app/#{relative_path}/#{engine_model_name}.rb")
    end
  
    def local_engine_version engine_name
      @local_engine_versions ||= {}
      @local_engine_versions[engine_name.to_sym] ||= Dir.glob("vendor/gems/*").select{|dir| dir =~ Regexp.new("#{engine_name}")}.first.split('-').last rescue nil
    end
  
   
    def path_for_class
      case 
      when self.ancestors.include?(ActiveRecord::Base)
       then
        "models"
      when self.ancestors.include?(ActionController::Base) then
        "controllers"
      else
        raise "Can not find default path for class #{self}"
      end
    end
    
     #todo: auto find path for class
    # def path_for_class
    #      @path_for_class ||= {}
    #      @path_for_class[current_file] ||= _path_for_class
    #    end
    #    
    #    def _path_for_class
    #      class_path = Pathname.new(File.dirname(current_file))
    #      relative_path = class_path.relative_path_from(Pathname.new("#{RAILS_ROOT}/app")).to_s
    #      puts "relative_path: #{relative_path}"
    #      relative_path.split('/').first
    #    end
    #    
    #    def current_file 
    #      as_load_path
    #    end
    
  end
  
  
end