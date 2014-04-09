module YdtdFrontend
  module FlashHelper  
    def flash_class(level)
      case level
        when :notice then 'flash flash-info'
        when :success then 'flash flash-success'
        when :error then 'flash flash-error'
        when :alert then 'flash flash-error'
      end
    end
  end
end
