class Mdp < Formula
  version '0.4.0'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.0/mdp_0.4.0_darwin_arm64.tar.gz'
      sha256 '3b1c085bb529015cd47d48ff99720e101dc7a241643dbf4e09b3d00ad5f6b7c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.0/mdp_0.4.0_darwin_amd64.tar.gz'
      sha256 '8440853ad08b49575105bdfc4a70f1e9a368315773950f1ac3b47c1736666c60'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.0/mdp_0.4.0_linux_arm64.tar.gz'
      sha256 '60984a19daca10541df1d7ecfa6519e4a9244319b858371cecf56ff1ef83f558'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.0/mdp_0.4.0_linux_amd64.tar.gz'
      sha256 '9436832df6873dfb4994707a893f168f97cb2812f12a37a14d282476bcd22fec'
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
