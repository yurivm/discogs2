#shamelessly stolen from ActiveSupport, http://api.rubyonrails.org/
class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end