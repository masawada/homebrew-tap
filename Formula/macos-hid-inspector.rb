class MacosHidInspector < Formula
  version '0.2.3'
  homepage 'https://github.com/masawada/macos-hid-inspector'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.3/inspect-hid_v0.2.3_darwin_arm64.tar.gz'
      sha256 '379881bbfd259281c41028073640fd64687f9a181c561f9d9ba1cd33b1062211'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/macos-hid-inspector/releases/download/v0.2.3/inspect-hid_v0.2.3_darwin_amd64.tar.gz'
      sha256 '7aa7f7a1fdcd3344367f15d77720ff193a928a57e27c3a947ccb5718f41f197f'
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
