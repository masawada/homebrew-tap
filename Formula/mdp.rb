class Mdp < Formula
  version '0.3.2'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.2/mdp_0.3.2_darwin_arm64.tar.gz'
      sha256 '8ae8a88a22a442429d40b2fd7109f991d285dbb0ed6668b0822efcbd7dc73919'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.2/mdp_0.3.2_darwin_amd64.tar.gz'
      sha256 '786c8bacf62eef9679debf7edd63217f61d0abf6c0a80d6f7a221fb87c074a83'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.2/mdp_0.3.2_linux_arm64.tar.gz'
      sha256 'd33e9fc2e06de8123e5d5686b17a7864103f7c9722f9ce220ccfd2806c35aa06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.2/mdp_0.3.2_linux_amd64.tar.gz'
      sha256 '32c4fcec4f9ceb1c01cbb10f7f59e06456db3c9b84b996dfad92b25e6ed04e5e'
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
