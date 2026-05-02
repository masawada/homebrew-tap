class Mdp < Formula
  version '0.4.1'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.1/mdp_0.4.1_darwin_arm64.tar.gz'
      sha256 '574c18cc5cb2d05d58ea18cb24214db7502c5e4a63c709bde1730f46e5ec142f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.1/mdp_0.4.1_darwin_amd64.tar.gz'
      sha256 '0fe780e4f329762eee5cf3e1790b05538edce3d810bd88581564e790abcef0d6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.1/mdp_0.4.1_linux_arm64.tar.gz'
      sha256 '6b1697716f42d5b4768f769e32d5d37d6ede8c6d1d5ce60fbbc67b3cbb29b71f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.4.1/mdp_0.4.1_linux_amd64.tar.gz'
      sha256 '4c5b7016ed5ca6496d40800fba86daf0a02f259c7b9cb9bdd067082039a31e37'
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
