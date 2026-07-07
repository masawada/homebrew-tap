class MacosHidInspector < Formula
  version '0.2.5'
  homepage 'https://github.com/masawada/macos-hid-inspector'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.5/inspect-hid_v0.2.5_darwin_arm64.tar.gz'
      sha256 '5ccaf38bfa7c67fabbea30f5622f5397071ec0ec88150dae02ace74343b2822a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.5/inspect-hid_v0.2.5_darwin_amd64.tar.gz'
      sha256 'f0a4ad9b6334222eeef2f98a028e193df5cf5bde4f74504574a18e6540630015'
    end
  end

  head do
    url 'https://github.com/masawada/macos-hid-inspector.git'
    depends_on xcode: ['16.0', :build]
  end

  def install
    if build.head?
      system 'swift', 'build', '-c', 'release'
      bin.install '.build/release/inspect-hid'
    else
      bin.install 'inspect-hid'
    end
  end
end
