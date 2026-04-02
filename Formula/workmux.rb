class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.172"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.172/workmux-darwin-arm64.tar.gz"
      sha256 "34297b1133c220e6ee260bec1164b5b8de98f828ed789633d7ae9a12fbd309d3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.172/workmux-darwin-amd64.tar.gz"
      sha256 "395690685cff9c133bf46b6a95dfe03033732d290e2372ed8fd2f618eb264be7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.172/workmux-linux-arm64.tar.gz"
      sha256 "0217039142770746922f692d04cb32119ed244b7952d8d581aba6929cf56325e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.172/workmux-linux-amd64.tar.gz"
      sha256 "9a16542d2278ae78444b13e02a2a18cca8f57998ebfe9c7684bdd3ba96900aca"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
