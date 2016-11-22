@[Link("libsass")]
lib LibSass
  alias Char = LibC::Char
  alias Compiler = Int32*
  alias FileContext = Int32*
  alias DataContext = Int32*
  alias Context = FileContext | DataContext
  alias Options = Int32*

  fun libsass_version : Char*

  fun sass_make_file_context(file : Char*) : FileContext*
  fun sass_make_data_context(data : Char*) : DataContext*

  fun sass_file_context_get_options(Context*) : Options*
  fun sass_option_set_precision(Options*, Char) : Void
  fun sass_option_set_source_comments(Options*, Bool) : Void

  fun sass_make_file_compiler(FileContext*) : Compiler*
  fun sass_make_data_compiler(DataContext*) : Compiler*

  fun sass_compiler_execute(Compiler*) : Int8
  fun sass_compiler_parse(Compiler*) : Int8

  fun sass_context_get_output_string(Context*) : Char*

  fun sass_delete_file_context(FileContext*) : Void
  fun sass_delete_data_context(DataContext*) : Void
  fun sass_delete_compiler(Compiler*) : Void
end
