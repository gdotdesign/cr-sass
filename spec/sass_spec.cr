require "./spec_helper"

# options = LibSass.sass_file_context_get_options(context)
# LibSass.sass_option_set_precision(options, 1)
# LibSass.sass_option_set_source_comments(options, true)
# LibSass.sass_file_context_set_options(context, options)

describe Sass do
  describe "#version" do
    it "should return version" do
      Sass
        .libsass_version
        .should_not eq("")
    end
  end

  describe "#compile_file" do
    it "should compile file" do
      Sass
        .compile_file("spec/fixtures/style.scss")
        .should_not eq("")
    end
  end

  describe "#compile_data" do
    it "should compile data" do
      Sass
        .compile_data("body { color: red; }")
        .should_not eq("")
    end
  end
end
