class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.217"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-darwin-arm64.tar.gz"
      sha256 "e5907ed57c821a338072737016701c6f3cd8ab65aac5e5c6b32bd15170e87483"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-darwin-amd64.tar.gz"
      sha256 "3a18e47b20094ec3f0da235196a59cdb683d9b22c726942be9cad296b736720b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-linux-arm64.tar.gz"
      sha256 "de25d30d38cd7891bb493cd3a8dca0d43207ed5c52b7dceb48e57ca4b02f8b44"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-linux-amd64.tar.gz"
      sha256 "cccafec3ecba4e93fd3e4050da8db084b0980500ce3974a8f293ce17575eb908"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
