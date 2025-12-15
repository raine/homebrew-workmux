class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.50/aarch64-apple-darwin.tar.gz"
      sha256 "11808472c489ee48d3c7c6bf1ebf0d2595d2f4ebe43826bf1ee5aa1386f851e1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.50/x86_64-apple-darwin.tar.gz"
      sha256 "c358bb911dcfed66da2c487c7419719642c9c05aff7627b5954a16a5cf802482"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.50/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d3480a596907bdc41838d03c4c3da53d8c8dfded56d650ca635e769757b43b4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.50/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5575b7e09285563ac06ca1a106486c06257b90144ed85720ad596c947cf6cee"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
