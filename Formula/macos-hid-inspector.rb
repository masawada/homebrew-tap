class MacosHidInspector < Formula
  version '0.2.4'
  homepage 'https://github.com/masawada/macos-hid-inspector'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.4/inspect-hid_v0.2.4_darwin_arm64.tar.gz'
      sha256 '6134836af0b5d491d99d250dc74f8533fb1cb72cb9ea4a28583662ab5d74d94a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.4/inspect-hid_v0.2.4_darwin_amd64.tar.gz'
      sha256 '18fbccee416c4f5fff34e652e1e09bfb99a751ea7599dcabfb9f5141eabb05da'
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
