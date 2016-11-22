require "./sass/*"

module Sass
  extend self

  macro andThen(value)
    {{puts value}}
  end

  def libsass_version : String
    String.new LibSass.libsass_version
  end

  def compile_file(file : String) : String
    context = LibSass.sass_make_file_context file
    compiler = LibSass.sass_make_file_compiler context

    compile context, compiler
  end

  def compile_data(data : String) : String
    context = LibSass.sass_make_data_context data
    compiler = LibSass.sass_make_data_compiler context

    compile context, compiler
  end

  private def compile(context : LibSass::Context*, compiler : LibSass::Compiler*) : String
    LibSass.sass_compiler_parse(compiler)
    LibSass.sass_compiler_execute(compiler)
    String.new LibSass.sass_context_get_output_string(context)
  end
end
