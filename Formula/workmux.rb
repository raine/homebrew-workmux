class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.100/workmux-darwin-arm64.tar.gz"
      sha256 "565e44effedcc139087c6fbae1e669657a4de21fe6e59548cba0e201d2aca972"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.100/workmux-darwin-amd64.tar.gz"
      sha256 "8228d3bd89033b8a5b776836b7e8ce2beba71a64d4f615d3526572279b82aba3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.100/workmux-linux-arm64.tar.gz"
      sha256 "3b4b33711625ff439119a17a7aa601058a408f8fca0b4268a7a36246d09ff378"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.100/workmux-linux-amd64.tar.gz"
      sha256 "b4c3db555f01fa39a7907431014b06768923d2fbfbe26a090def201b7849571c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
