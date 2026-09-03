class Metsuke < Formula
  version '0.0.2'
  homepage 'https://github.com/masawada/metsuke'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.2/metsuke_0.0.2_darwin_arm64.tar.gz'
      sha256 'f1208de7d1dc68301c1d31ef2525fa5de7559baf78ee42a67e561ec67d88cb43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.2/metsuke_0.0.2_darwin_amd64.tar.gz'
      sha256 '9f70f60ab7d62bdbd88a79d06d40e4f61fa1837843a950de9f3b7a72648bbb56'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.2/metsuke_0.0.2_linux_arm64.tar.gz'
      sha256 '8572f4262c27d479e320d5600b45e7ddc29dbdc04c885eb36fb4629f0e3d06b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.2/metsuke_0.0.2_linux_amd64.tar.gz'
      sha256 'c3d93a77f8178b2c61495593f0300313f6d06f775ae92939bf6bc366977696d4'
    end
  end

  head do
    url 'https://github.com/masawada/metsuke.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'metsuke'
  end
end
