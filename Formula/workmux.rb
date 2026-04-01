class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.167"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.167/workmux-darwin-arm64.tar.gz"
      sha256 "a85cf3eaf7a9c45ea94b62a5b514256d57398b4a3cc115f315f95ea36b3c3392"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.167/workmux-darwin-amd64.tar.gz"
      sha256 "b1fa463e29f3daed5a59de53634ce8015edb8084d28e8fbfffbb3ff7537a14d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.167/workmux-linux-arm64.tar.gz"
      sha256 "3b58f3495fff69ed7d60284d0d6c920b8a7795fac6dce93a98a7083b1046dbff"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.167/workmux-linux-amd64.tar.gz"
      sha256 "822afeb6ff69c60cfcb196580365cb878f91a07081cb0b7b18812826e6e31f25"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
