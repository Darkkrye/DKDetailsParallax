Pod::Spec.new do |s|
  s.name         = "DKDetailsParallax"
  s.version      = "2.1.0"
  s.summary      = "DKDetailsParallax is a framework which allows you to simply create details parallax controller."

  s.homepage     = "https://github.com/Darkkrye/DKDetailsParallax"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "BSD", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author       = { "Darkkrye" => "pierre.boudon.27@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.deployment_target = "8.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/Darkkrye/DKDetailsParallax.git", :tag => "v#{s.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "DKDetailsParallax/**/*.{swift,h,otf}"
  s.resource_bundles = {
    'DKDetailsParallax' => ['DKDetailsParallax/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true

end
