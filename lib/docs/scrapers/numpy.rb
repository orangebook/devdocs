module Docs
  class Numpy < FileScraper
    self.name = 'NumPy'
    self.type = 'sphinx'
    self.root_path = 'routines.html'
    self.links = {
      home: 'http://www.numpy.org/',
      code: 'https://github.com/numpy/numpy'
    }

    html_filters.push 'numpy/entries', 'numpy/clean_html'

    # .main contains more than the page's content alone, but we need something
    # that includes the navigation bar as well in order to guess the type of
    # most pages.
    options[:container] = '.main'

    # "generated" pages seem to be autogenerated from python docstrings.
    # "routines" are mostly lists that help organize the generated pages.
    # Everything else is manual-like and probably not desired in Devdocs.
    options[:only_patterns] = [
      /routines\.?.*\.html/,
      /generated.*/]

    options[:attribution] = <<-HTML
      &copy; Copyright 2008-2015, The Scipy community.<br>
      Licensed under a BSD-new License.
    HTML

    version '1.10' do
      self.release = '1.10'
      self.dir = '/vagrant/numpy-html/reference/'
      # self.base_url = 'http://docs.scipy.org/doc/numpy/reference/'
    end
  end
end