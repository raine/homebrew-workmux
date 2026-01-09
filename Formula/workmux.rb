class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.79"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.79/workmux-darwin-arm64.tar.gz"
      sha256 "a9ae84df3a4bdccf6fb2b68ea5e6fbeeb1c0d0ef6ac61b90618fd56d84dd9288"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.79/workmux-darwin-amd64.tar.gz"
      sha256 "0cab403bc07f3a534330589865129f1b83811a84392e529d3e3412bb99a6a945"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.79/workmux-linux-arm64.tar.gz"
      sha256 "6204511033e4289909322e1e73a576233f7a189b4a5626498c53cef226f6bdd4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.79/workmux-linux-amd64.tar.gz"
      sha256 "9357633ea69ad097fbf11cb0200475e48079e04c0b342d24d18028bc34690ded"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
