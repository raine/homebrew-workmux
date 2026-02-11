class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.110"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.110/workmux-darwin-arm64.tar.gz"
      sha256 "6be750cc2c5a82d146ff823d7d3f37bbf2ff36085196d109441b2e455f5c03ae"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.110/workmux-darwin-amd64.tar.gz"
      sha256 "af3bacf1bd04ae534b7cac9647a60dfe606cd77a49183068cfc0f8babb647d19"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.110/workmux-linux-arm64.tar.gz"
      sha256 "2c1cf6a9b2292d51f60c0f16f94b86371c96babb1c11a1ae2f33d5e51820f87d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.110/workmux-linux-amd64.tar.gz"
      sha256 "3347ebcccacc8806b008385d1073763f553ccfd75052eeade29bb2f952446cda"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
