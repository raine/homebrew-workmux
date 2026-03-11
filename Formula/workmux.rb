class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.135"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.135/workmux-darwin-arm64.tar.gz"
      sha256 "570ecc369dff604fd664db8c1472051bf6448b298f125b6423c7850be790c10a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.135/workmux-darwin-amd64.tar.gz"
      sha256 "cba518d3aec963e6205b948835c28b5907eb48489995fd7b9d2f52fc1e61d8ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.135/workmux-linux-arm64.tar.gz"
      sha256 "553d691cabc3a28e1652325c5165a2682b9755569e6c58dae324485b4a4b3d40"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.135/workmux-linux-amd64.tar.gz"
      sha256 "5079b0566ca9dc22cfb308a6651f14f5ab13a6f3684c25b6939915d09cddaa17"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
