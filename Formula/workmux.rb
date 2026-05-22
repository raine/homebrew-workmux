class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.211"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.211/workmux-darwin-arm64.tar.gz"
      sha256 "76c97c737382d8eb6f431ce4cc2c52d300dd1bb43e0bd099461d268ed91cd95a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.211/workmux-darwin-amd64.tar.gz"
      sha256 "e84e33099dc607fd11b2e20df2b7be45e0d1b001817ef077b5fd33e712e83e6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.211/workmux-linux-arm64.tar.gz"
      sha256 "a8e9e3ee93251fb573a370409361f8e006f06835b57d27118e0faf4eb90f8469"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.211/workmux-linux-amd64.tar.gz"
      sha256 "aabd2e1d63ea88e74090adbe90052767a3cbcb30b240d41ff7a3ba7a3f1afaab"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
