class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.188"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.188/workmux-darwin-arm64.tar.gz"
      sha256 "034bf4bacac5910ff58921f0d46a7d637c7ecf6fc29c6b9ce313d58b943f3c71"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.188/workmux-darwin-amd64.tar.gz"
      sha256 "8071f55b5680a4bfc05172353965cb34410aaf097f4aca68e8a1a44f65a5a9ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.188/workmux-linux-arm64.tar.gz"
      sha256 "9afd281cdb032bed6e45439175f69f7eda882cea7b6adbf2dd579d801c94a6ad"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.188/workmux-linux-amd64.tar.gz"
      sha256 "59a144540f241e0679a4bca1b2627519ee495d49cbd01e4bba9e02899d72e80f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
