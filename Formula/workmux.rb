class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.230"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.230/workmux-darwin-arm64.tar.gz"
      sha256 "ea297741bfc5930a6e11c2ea875d7cca604b4784b17c6359f357c19b22ae7fb6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.230/workmux-darwin-amd64.tar.gz"
      sha256 "798f60152f66cdee153efdbde935fb85dee26e1f2caca969c7f6118db38cef98"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.230/workmux-linux-arm64.tar.gz"
      sha256 "0dead80cfbeb3d1edbbffa99c860bbc435b7bc91280d1eb9434ff9af20e12062"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.230/workmux-linux-amd64.tar.gz"
      sha256 "f1dfaee25ef829bddb9bd43f4bbfaacce727c3567da1dd2c11debe5e4613c748"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
