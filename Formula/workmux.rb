class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.151"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.151/workmux-darwin-arm64.tar.gz"
      sha256 "30ccf54e42af2b78b03b11ac0e012e413dcd4e59b0143bdc0d5f8d5d752c33a9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.151/workmux-darwin-amd64.tar.gz"
      sha256 "fb47d9589053d5625e6f33dc5dfd5412786ca0fad59af376d229c81f68ecce8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.151/workmux-linux-arm64.tar.gz"
      sha256 "7c10fc322dcc1d69fd30c831d04730acef05cf62d4bdd8d10ad7c3fcefcdeab8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.151/workmux-linux-amd64.tar.gz"
      sha256 "e23c3b45729a480ab707a0ad0135170972f0ff0d12f3d3798b3bc0f9dc2609da"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
