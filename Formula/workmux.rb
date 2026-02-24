class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.124"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.124/workmux-darwin-arm64.tar.gz"
      sha256 "171cee48fc81b01a780c07385f856cd7e9f6f27cf25074738c40f52e232693be"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.124/workmux-darwin-amd64.tar.gz"
      sha256 "9d7a5f7c31cb24634243225f7945533720e48afed4efaba968120b949b251b64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.124/workmux-linux-arm64.tar.gz"
      sha256 "51dd5f807d0cfab694b3b6e5a0510f7f8522d888b2306b7fd416079ee89129a7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.124/workmux-linux-amd64.tar.gz"
      sha256 "3e2e8d71341d9ca537323d88c46ff6ec7cd6422bc06e908c7b68c54476528b38"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
