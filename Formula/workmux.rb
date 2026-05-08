class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.203"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.203/workmux-darwin-arm64.tar.gz"
      sha256 "e454225a1e969d9216e028fac44fa04ebbf9c03cc556f3ae82829b1150411906"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.203/workmux-darwin-amd64.tar.gz"
      sha256 "7ce02063a9914435aa5048c0996a8d820e68e089e65dc133fc44867e20f8ab5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.203/workmux-linux-arm64.tar.gz"
      sha256 "99153b6a9db4162e888fe1b5a7cf06900b7d9e05bdffd4981ce382bf23b58358"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.203/workmux-linux-amd64.tar.gz"
      sha256 "bb626627d46d828cb1c858bf703f3181498b37577a99db0e564102d0a740b4fd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
