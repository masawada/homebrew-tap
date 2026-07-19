class Mdp < Formula
  version '0.4.2'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.2/mdp_0.4.2_darwin_arm64.tar.gz'
      sha256 'b392c23811bf9727e528a6cd008a6e3c99de2e22bd2b5b7cf2f74c42e64aae59'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.2/mdp_0.4.2_darwin_amd64.tar.gz'
      sha256 '8648f6f180ce8475a0567be6682a64629e4a753fd872c4b2506b0bc97f64a59c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.2/mdp_0.4.2_linux_arm64.tar.gz'
      sha256 '4299079d7587477c3f1531a11d52bfa7e1d3f7f13f01f81d4954450edde17ce9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.2/mdp_0.4.2_linux_amd64.tar.gz'
      sha256 'd9569620cd5be502b5004a2b6c1075738948e84d5cd808e40253772060b2b25f'
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
