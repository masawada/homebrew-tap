class Mdp < Formula
  version '0.5.0'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.5.0/mdp_0.5.0_darwin_arm64.tar.gz'
      sha256 'd8ec20c463279597f54273efabaa2a537f9422e8ce7ad017fa2eeb49c85c6b1b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.5.0/mdp_0.5.0_darwin_amd64.tar.gz'
      sha256 '9339523646909d4f99432863269f552f0e23504de08447f7121f4949ee31e9e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.5.0/mdp_0.5.0_linux_arm64.tar.gz'
      sha256 'b7dd012b191997d01fcb10543a43c41589cdbdc089196e21625d512ad4dd0cdd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.5.0/mdp_0.5.0_linux_amd64.tar.gz'
      sha256 '4e0d4a6c6f4a99f9a0099979940f1b049fc25e0e8c5c2eb3abc4b5134a37adfa'
    end
  end

  head do
    url 'https://github.com/masawada/mdp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdp'
  end
end
