class Hash
  ## 
  # Returns a new hash that contains *only* the pair with 
  # the specified key.
  #
  # Example:
  #   {:page => 1, :page_size => 10}.only(:page)
  #   => {:page => 1}
  def only(*args)
    return self if args.blank?
    self.dup.delete_if do |k,v|
      as_string = k.to_s
      as_symbol = k.is_a?(Symbol) ? k : k.intern
      !args.include?(as_string) && !args.include?(as_symbol)
    end
  end
end