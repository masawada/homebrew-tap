class MacosHidInspector < Formula
  version '0.2.2'
  homepage 'https://github.com/masawada/macos-hid-inspector'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.2/inspect-hid_v0.2.2_darwin_arm64.tar.gz'
      sha256 'cdcffa8959567dc3a9c49061638d6c32247f3a3379b68a690af48e871bc10e64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.2/inspect-hid_v0.2.2_darwin_amd64.tar.gz'
      sha256 '087ff6795aa08ceb9cee029c08ddaf87618953db7081aa61f7583c082df7fda4'
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
