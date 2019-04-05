MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gembox 'default'
  conf.gem :github => 'iij/mruby-dir'

  conf.cc do |cc|
    cc.command = "/usr/bin/gcc"
  end

  conf.linker do |linker|
    linker.command = "/usr/bin/gcc"
  end

  conf.archiver do |archiver|
    archiver.command = "/usr/bin/ar"
  end
end

MRuby::CrossBuild.new('cosmos-lwm') do |conf|
  toolchain :gcc

  conf.gembox 'default'
  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'iij/mruby-errno'
  conf.gem :github => 'iij/mruby-iijson'
  conf.gem :github => 'iij/mruby-pack'
  conf.gem :github => 'iij/mruby-process'
  conf.gem :github => 'iij/mruby-tempfile'

  conf.cc do |cc|
    cc.command = `hcrun --host cosmos:lwm printenv | awk -F= '$1 == "CC" { print }' | sed s,CC=,,`.chomp
    cc.flags = `hcrun --host cosmos:lwm printenv | awk -F= '$1 == "CFLAGS" { print }' | sed s,CFLAGS=,,`.chomp
  end

  conf.linker do |linker|
    linker.command = `hcrun --host cosmos:lwm printenv | awk -F= '$1 == "CC" { print }' | sed s,CC=,,`.chomp
    linker.flags = `hcrun --host cosmos:lwm printenv | awk -F= '$1 == "LDFLAGS" { print }' | sed s,LDFLAGS=,,`.chomp
  end

  conf.archiver do |archiver|
    archiver.command = `hcrun --host cosmos:lwm printenv | awk -F= '$1 == "AR" { print }' | sed s,AR=,,`.chomp
  end
end
