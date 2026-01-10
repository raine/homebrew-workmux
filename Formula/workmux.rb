class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.81/workmux-darwin-arm64.tar.gz"
      sha256 "58bc3a982cc31607d4d631a33ca639e05a4c6bdd1d52c7dc22259b2aab47ea28"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.81/workmux-darwin-amd64.tar.gz"
      sha256 "2cb0e132124207cf1a37f8384a68094977597a176bbc94c64a71b88780044974"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.81/workmux-linux-arm64.tar.gz"
      sha256 "6288fc72900bb1a43e7b986170e1d16a0588e8d98a9efa30bcfe0bb99069814c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.81/workmux-linux-amd64.tar.gz"
      sha256 "12435123fadf373644c5430ee81b4e111c1cd960b76e1d0ee63adcc9c486115d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
