class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.159"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.159/workmux-darwin-arm64.tar.gz"
      sha256 "7d0b3eba7068c0e9aa54867c20376153a499176e6cfcfc82a0664f9592b49a1b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.159/workmux-darwin-amd64.tar.gz"
      sha256 "fe50cca3ba2d8a0c3ab8452657c19f528dfc0c05534e6772a8e4e4ae07d6451a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.159/workmux-linux-arm64.tar.gz"
      sha256 "115f604e1ee0995a7394e91d90e92a2bad705bffb73a61e1e747e3e9d137c21d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.159/workmux-linux-amd64.tar.gz"
      sha256 "d2baa67480c935116a62ca44f635485c555a3ad9a6bfd88b1bded81b9ec942b8"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
